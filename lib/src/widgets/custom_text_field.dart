import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.text,
    this.onChanged,
    this.maxLines = 1,
    this.isTitle = false,
    super.key,
  });

  final int maxLines;
  final String? text;
  final bool isTitle;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: text,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.bodyMedium,
      minLines: 1,
      maxLength: isTitle ? 30 : 500,
      onChanged: onChanged,
    );
  }
}
