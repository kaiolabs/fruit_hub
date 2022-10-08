import 'package:flutter/material.dart';
import 'package:fruit_hub/shared/palette.dart';

class InputField extends StatelessWidget {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? hintText;
  final TextEditingController controller;
  final double? fontSize;
  final double? borderRadius;
  const InputField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.fontSize = 16,
    this.borderRadius = 10,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: const Color(0xFF86869E)),
        suffixIcon: Icon(suffixIcon, color: const Color(0xFF86869E)),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: const Color(0xFFC2BDBD),
          fontFamily: 'TTNorms_Regular',
        ),
        filled: true,
        fillColor: const Color(0xFFF7F5F5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius!),
          ),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius!),
          ),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius!),
          ),
          borderSide: const BorderSide(
            color: Palette.orange,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius!),
          ),
          borderSide: const BorderSide(
            color: Palette.orange,
          ),
        ),
        errorStyle: const TextStyle(
          fontSize: 12,
          color: Palette.orange,
          fontFamily: 'TTNorms_Medium',
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
