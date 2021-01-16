import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/enums.dart';
import 'package:task_manager/model/list/list_item_model.dart';
import 'package:task_manager/provider/list/list_provider.dart';
import 'package:task_manager/widget/app_button.dart';
import 'package:task_manager/widget/custom_text_formfield.dart';
import 'package:provider/provider.dart';

/// Add or edit task
class AddTask extends StatefulWidget {
  /// On task edit, [data] should not be null
  final ListItemModel data;

  const AddTask({Key key, this.data}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();

  static void show(BuildContext context, {ListItemModel initialData}) {
    showModalBottomSheet(context: context, builder: (context) => AddTask(data: initialData));
    return;
  }
}

class _AddTaskState extends State<AddTask> {
  TextEditingController _titleController, _descriptionController;
  List<String> _periods = ['DAILY', 'WEEKLY', 'MONTHLY'];
  ValueNotifier<int> _periodsListener = ValueNotifier(0);

  String screenTitle = 'Add To-Do', buttonText = 'Add';

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();

    if (widget?.data != null) {
      _periodsListener.value = widget.data.period.index;
      screenTitle = 'Edit To-Do';
      buttonText = 'Save';

      _titleController.text = widget?.data?.title ?? '';
      _descriptionController.text = widget?.data?.description ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleController?.dispose();
    _descriptionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listProvider = context.watch<ListProvider>();

    return Container(
      height: 326,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$screenTitle', style: TextStyle(fontSize: 18)),
          SizedBox(height: 12),
          _buildPeriods,
          SizedBox(height: 12),
          CustomTextFormField(
            controller: _titleController,
            placeholder: 'Title',
            validator: (String val) {
              if (val.isEmpty) return 'Zorunlu alan';
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: _descriptionController,
            placeholder: 'Description',
            validator: (String val) {
              if (val.isEmpty) return 'Zorunlu alan';
              return null;
            },
            minLines: 3,
            maxLines: 3,
          ),
          SizedBox(height: 16),
          AppButton(
            title: '$buttonText',
            onTap: () {
              if (widget?.data != null) {
                widget.data
                  ..title = _titleController.text
                  ..description = _descriptionController.text
                  ..period = TaskPeriod.values[_periodsListener.value];
                listProvider.editItem(widget.data);

                return;
              }

              listProvider.addItem(
                ListItemModel(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  period: TaskPeriod.values[_periodsListener.value],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget get _buildPeriods {
    return ValueListenableBuilder<int>(
      valueListenable: _periodsListener,
      builder: (context, val, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _periods
              .map(
                (e) => GestureDetector(
                  onTap: () => _periodsListener.value = _periods.indexOf(e),
                  child: Chip(
                    backgroundColor: _periodsListener.value == _periods.indexOf(e) ? Colors.green : null,
                    label: Text('$e'),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
