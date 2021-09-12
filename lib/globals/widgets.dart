import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {Key? key, @required this.hintText, required this.controller, this.hide = false})
      : super(key: key);

  final hintText;
  final controller;
  final hide;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: this.hide,
        decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.grey[200],
            filled: true,
            hintText: this.hintText),
        controller: this.controller);
  }
}
