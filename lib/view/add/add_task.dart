import 'package:flutter/material.dart';
import 'package:task_manager/model/list/list_item_model.dart';
import 'package:task_manager/provider/list/list_provider.dart';
import 'package:task_manager/widget/app_button.dart';
import 'package:task_manager/widget/custom_text_formfield.dart';
import 'package:provider/provider.dart';

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
  String screenTitle = 'Add To-Do';
  String buttonText = 'Add';

  @override
  void initState() {
    if (widget?.data != null) {
      screenTitle = 'Edit To-Do';
      buttonText = 'Save';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final listProvider = context.watch<ListProvider>();

    return Container(
      height: 280,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$screenTitle', style: TextStyle(fontSize: 18)),
          SizedBox(height: 24),
          CustomTextFormField(
            placeholder: 'Title',
            initialValue: widget?.data?.title ?? '',
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            initialValue: widget?.data?.description ?? '',
            placeholder: 'Description',
            minLines: 3,
            maxLines: 3,
          ),
          SizedBox(height: 16),
          AppButton(
            title: '$buttonText',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
