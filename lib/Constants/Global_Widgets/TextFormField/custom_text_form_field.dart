import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Global_Variables/Screen Util Size.dart';
import '../../Global_Variables/Sizes/global_sizes.dart';
import '../../Global_Variables/colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final String labelText;
  final bool obscureText;
  final ValueChanged onChanged;
  final Widget icon;
  final bool isLastField;
  final bool numberKeyboard;
  final bool enabled;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.errorText,
    required this.labelText,
    required this.onChanged,
    required this.icon,
    required this.isLastField,
    required this.obscureText,
    required this.numberKeyboard,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textInputAction =
        isLastField ? TextInputAction.done : TextInputAction.next;

    TextInputType keyboardType = numberKeyboard
        ? TextInputType.number // Use number keyboard if numberKeyboard is true
        : TextInputType.text; // Use regular keyboard if numberKeyboard is false

    return Container(
      margin: EdgeInsets.only(bottom: textFormFieldMarginBottom),
      child: TextFormField(
        // maxLines: 1,

        controller: controller,
        enabled: enabled,
        style: TextStyle(
            // overflow: TextOverflow.ellipsis,
            fontSize: textFormFieldFontSize,
            color: textFormFieldFontColor),
        // cursorColor: textFormFieldCursorColor,
        // cursorHeight: textFormFieldCursorHeight,
        obscureText: obscureText,
        keyboardType: keyboardType, // Set the keyboard type here
        inputFormatters:
            numberKeyboard // Use input formatters to restrict the keyboard to numbers only
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
        decoration: InputDecoration(
          suffixIcon: icon,
          filled: true,
          fillColor: Colors.white10,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(textFormFieldBorderRadius),
          ),
          labelText: labelText,
          errorText: errorText, // Pass the errorText directly
          errorStyle:
              TextStyle(fontSize: text40sp, color: textFormFieldErrorTextColor),
          errorMaxLines: 1,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
            borderRadius: BorderRadius.circular(textFormFieldErrorBorderRadius),
          ),
        ),
        textInputAction: textInputAction,
        onChanged: onChanged,
      ),
    );
  }
}
