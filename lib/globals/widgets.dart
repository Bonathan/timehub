import 'package:flutter/material.dart';

class defaultTextField extends StatelessWidget {
  const defaultTextField(
      {Key? key, @required this.hintText, required this.controller})
      : super(key: key);

  final hintText;
  final controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.grey[200],
            filled: true,
            hintText: this.hintText),
        controller: this.controller);
  }
}
