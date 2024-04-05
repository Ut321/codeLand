import 'package:flutter/material.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final double? height;
  final int? lines;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onTextChanged;
  final String? errorText;
  final String? hintText;

  const TextFieldWithTitle({
    super.key,
    required this.label,
    this.controller,
    this.height,
    this.lines,
    this.validator,
    this.onTextChanged,
    this.errorText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        style: TextStyle(),
        validator: validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
          labelText: label,
          hintStyle: const TextStyle(
            color: Colors.green,
            fontSize: 12,
          ),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
          alignLabelWithHint: true,
          filled: true,
          errorText: errorText,
        ),
        cursorColor: Colors.blue,
        keyboardType: TextInputType.multiline,
        maxLines: lines,
        onChanged:
            onTextChanged != null ? (value) => onTextChanged!(value) : null,
        onFieldSubmitted: (_) {
          FocusScope.of(context).nextFocus();
        },
      ),
    );
  }
}
