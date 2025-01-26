import 'package:flutter/material.dart';

import '../config/app_constants.dart';




class CustomFormWidget extends StatelessWidget {
  const CustomFormWidget({
    super.key,
    this.hint = '',
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.label,
    this.suffixIcon,
    this.prefix,
    this.maxLength,
    this.onChanged,
    this.focusNode,
    this.readOnly = false,
    this.fillColor,
  });
  final String? hint;
  final String? label;
  final TextEditingController controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines, maxLength;
  final Widget? suffixIcon, prefix;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: fillColor,
        counterText: '',
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        label: label != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label!,
                    style: TextStyle(
                      // color: AppStaticColor.labelColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  if (validator != null)
                    Text(
                      "*",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                ],
              )
            : null,
        hintText: hint,
        hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w300),
        suffixIcon: suffixIcon,
        prefixIcon: prefix,
      ),
      style: TextStyle(fontSize: 16),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}

validatorWithMessage(
    {required String message,
    String? value,
    bool isEmail = false,
    BuildContext? context}) {
  if (value == null || value.isEmpty) {
    return message;
  }
  if (isEmail &&
      !RegExp(AppConstants.kTextValidatorEmailRegex).hasMatch(value)) {
    return 'Has to be a valid email address.';
  }
  return null;
}
