import 'package:flutter/material.dart';
import 'package:my_note/app/core/utils/app_extensions.dart';

class DynamicText extends StatelessWidget {
  const DynamicText(
    this.text, {
    Key? key,
    this.align,
    this.style,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  final String text;
  final TextAlign? align;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: (overflow != null) ? overflow : TextOverflow.visible,
      textAlign: align ?? TextAlign.start,
      style: style?.copyWith(
            fontSize: style?.fontSize?.toDouble().sp(context),
          ) ??
          TextStyle(),
    );
  }
}
