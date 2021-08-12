import 'package:flutter/material.dart';

class defaultTextField extends StatelessWidget {
  const defaultTextField({ Key? key, @required this.hintText}) : super(key: key);

  final hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
  border: InputBorder.none,
  fillColor: Colors.grey[200],
  filled: true,
  hintText: this.hintText
),
    );
  }
}