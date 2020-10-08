import 'package:flutter/material.dart';
import 'package:payso/constants.dart';

class ProfileTextField extends StatelessWidget {
  final String textFieldTitle;
  final Image textFieldImage;
  final int textFieldSize;
  final TextInputType textFieldType;
  final Function onChanged;
  final Function validator;
  final Function onFieldSubmitted;

  ProfileTextField(
      {this.textFieldImage,
      this.textFieldTitle,
      this.textFieldType,
      this.textFieldSize,
      this.onChanged,
      this.validator,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      style: cFormFieldStyle,
      maxLength: textFieldSize,
      keyboardType: textFieldType,
      decoration: InputDecoration(
        hintText: textFieldTitle,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.3,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        prefix: Container(
          width: MediaQuery.of(context).size.width / 9,
          child: textFieldImage,
        ),
      ),
    );
  }
}
