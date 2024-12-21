import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminProductCustomTextFormField extends StatelessWidget {
  const AdminProductCustomTextFormField(
      {super.key,
      required this.valid,
      this.maxLine,
      required this.hintText,
      required this.validation,
      this.keyboardType,
      required this.controller,
      this.onChanged});
  final bool valid;
  final int? maxLine;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String? value) validation;
  final TextEditingController controller;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: valid ? 8.h : 0),
      child: TextFormField(
        onChanged: onChanged,
        enabled: valid,
        validator: validation,
        keyboardType: keyboardType,
        controller: controller,
        maxLines: maxLine,
        decoration: InputDecoration(
            hintText: hintText,
            label: Text(hintText),
            disabledBorder: valid
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey))
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
            border: valid
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey))
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
            errorBorder: valid
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
            fillColor: Colors.transparent,
            filled: true),
      ),
    );
  }
}
