import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.text, this.maxLines = 1, this.isTitle = false, super.key});
  final int maxLines;
  final String? text;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: text,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.bodyMedium,
      minLines: 1,
      maxLength: isTitle ? 30 : 500,
    );
  }
}
