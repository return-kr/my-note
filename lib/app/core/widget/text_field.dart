import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    this.expands = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.placeholder = "",
    this.placeholderStyle,
    this.style,
    this.onChange,
    this.textInputAction,
    this.keyboardType,
    this.controller,
  });
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final TextStyle? style;
  final TextStyle? placeholderStyle;
  final String placeholder;
  final Function? onChange;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CupertinoTextField(
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        expands: expands,
        cursorColor: Colors.green,
        placeholder: placeholder,
        textInputAction: textInputAction ?? TextInputAction.done,
        keyboardType: TextInputType.multiline,
        style: style ?? TextStyle(),
        placeholderStyle: placeholderStyle ?? TextStyle(),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        onChanged: (value) {
          if (onChange != null) {
            onChange!(value);
          }
        },
      ),
    );
  }
}
