import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';

class AppTextForm extends StatelessWidget {
  AppTextForm({
    super.key,
    required this.controller,
    required this.validator,
    required this.hint,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
    this.suffixWidget,
    this.focusNode,
    this.onChanged

  });
  FocusNode? focusNode;
  TextEditingController controller;
  Function(String?) validator;
  String hint;
  TextInputAction? textInputAction;
  TextInputType keyboardType = TextInputType.text;
  Function? onFieldSubmitted;
  Widget ? suffixWidget;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChanged?.call(value),
focusNode: focusNode,
      autofocus: true,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: (value) {
  onFieldSubmitted?.call(value);
},
controller: controller,
      validator: (val) => validator(val),
      decoration: InputDecoration(
       
        suffixIcon: Container(
          child: suffixWidget,
        ),
        constraints: BoxConstraints(
          maxHeight: 50
        ),
        contentPadding: EdgeInsets.all(2),
        suffixIconConstraints: BoxConstraints(
          maxWidth: 5,
          maxHeight: 12
        ),
        hint: Text(hint, style: AppTextStyles.lightDarkbold16),
        focusedBorder: UnderlineInputBorder(
          
          borderSide: BorderSide(
            color: AppColors.onboardingSecondaryButtonFillColor,
            width: 2,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.onboardingSecondaryButtonFillColor.withAlpha(50),
            width: 2,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.onboardingSecondaryButtonFillColor,
          ),
        ),
      ),
    ).animate().slide(

    );
  }
}
