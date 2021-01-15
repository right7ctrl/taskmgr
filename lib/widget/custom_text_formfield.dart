import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum BorderType { FLAT, ROUNDED }

class CustomTextFormField extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String val) validator;
  final List<TextInputFormatter> inputFormatters;
  final void Function(String val) onChanged;
  final TextCapitalization textCapitalization;
  final InputDecoration decoration;
  final BorderType borderType;
  final int maxLength;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool enabled;
  final int maxLines;
  final int minLines;
  final String initialValue;
  final TextStyle style;

  const CustomTextFormField({Key key, this.placeholder, this.controller, this.focusNode, this.validator, this.inputFormatters, this.style, this.onChanged, this.textCapitalization, this.minLines, this.initialValue, this.maxLines = 1, this.decoration, this.maxLength, this.obscureText, this.textInputType, this.textInputAction, this.enabled = true, this.borderType = BorderType.ROUNDED}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: style,
      obscureText: obscureText != null ? obscureText : false,
      textCapitalization: textCapitalization != null ? textCapitalization : TextCapitalization.none,
      cursorColor: Theme.of(context).primaryColor,
      inputFormatters: inputFormatters,
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      enabled: enabled,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      initialValue: initialValue,
      decoration: InputDecoration(
          alignLabelWithHint: false,
          suffix: decoration != null && decoration.suffix != null ? decoration.suffix : null,
          suffixIcon: decoration != null && decoration.suffixIcon != null ? decoration.suffixIcon : null,
          prefixIcon: decoration != null && decoration.prefixIcon != null ? decoration.prefixIcon : null,
          contentPadding: decoration != null && decoration.contentPadding != null ? decoration.contentPadding : EdgeInsets.all(8),
          labelText: '$placeholder',
          focusedBorder: decoration != null && decoration.focusedBorder != null
              ? decoration.focusedBorder
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
                  borderRadius: borderType == BorderType.FLAT ? BorderRadius.circular(0) : BorderRadius.circular(4),
                ),
          enabledBorder: decoration != null && decoration.enabledBorder != null
              ? decoration.enabledBorder
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black26),
                  borderRadius: borderType == BorderType.FLAT ? BorderRadius.circular(0) : BorderRadius.circular(4),
                ),
          errorBorder: decoration != null && decoration.errorBorder != null
              ? decoration.errorBorder
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.red),
                  borderRadius: borderType == BorderType.FLAT ? BorderRadius.circular(0) : BorderRadius.circular(4),
                ),
          focusedErrorBorder: decoration != null && decoration.focusedErrorBorder != null
              ? decoration.focusedErrorBorder
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.red),
                  borderRadius: borderType == BorderType.FLAT ? BorderRadius.circular(0) : BorderRadius.circular(4),
                ),
          disabledBorder: decoration != null && decoration.disabledBorder != null
              ? decoration.disabledBorder
              : OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black26),
                  borderRadius: borderType == BorderType.FLAT ? BorderRadius.circular(0) : BorderRadius.circular(4),
                ),
          enabled: decoration != null && decoration.enabled != null ? decoration.enabled : true,
          counterText: decoration != null && decoration.counterText != null ? decoration.counterText : null),
    );
  }
}
