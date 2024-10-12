import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practical_task_1/constants/app_color.dart';
import 'package:practical_task_1/constants/app_style.dart';

class CommonTextFormField extends StatelessWidget {
  final TextInputType? textInputType;
  final TextStyle? textStyle;
  final TextStyle? textHintStyle;
  final TextStyle? prefixTextStyle;
  final TextStyle? counterTextStyle;
  final TextStyle? suffixTextStyle;
  final String? hintText;
  final String? errorText;
  final TextStyle? errorStyle;
  final String? prefixText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? autoFocus;
  final Widget? suffix;
  final Widget? prefix;
  final double? paddingHorizonatal;
  final double? paddingVertical;
  final bool? filled;
  final bool? readOnly;
  final bool? obscureText;
  final TextEditingController textEditingController;
  final Color? fillColor;
  final TextCapitalization? textCapitalization;
  final Color? cursoreColor;
  final String? suffixText;
  final FocusNode? focusNode;
  final InputBorder? enableBorder;
  final int? maxLines;
  final int? maxLength;
  final int? minLines;
  final Function(String)? onChanged;
  final Function(PointerDownEvent)? onTapOutside;
  final TextAlign? textAlign;
  final Function(String)? onSaved;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;
  final Widget? counterWidget;
  final String? initialValue;
  final ScrollController? scrollController;

  const CommonTextFormField({
    super.key,
    this.autoFocus,
    this.errorStyle,
    this.textInputType,
    this.suffixText,
    this.onFieldSubmitted,
    this.onTap,
    this.errorBorder,
    this.focusedErrorBorder,
    required this.textEditingController,
    this.textStyle,
    this.inputFormatters,
    this.textHintStyle,
    this.errorText,
    this.onTapOutside,
    this.initialValue,
    this.textCapitalization,
    this.counterWidget,
    this.onChanged,
    this.textAlign,
    this.hintText,
    this.prefixText,
    this.prefix,
    this.suffixIcon,
    this.prefixTextStyle,
    this.obscureText,
    this.paddingVertical,
    this.suffixTextStyle,
    this.filled,
    this.enableBorder,
    this.focusedBorder,
    this.fillColor,
    this.maxLines = 1,
    this.prefixIcon,
    this.focusNode,
    this.onSaved,
    this.maxLength,
    this.suffix,
    this.minLines,
    this.cursoreColor = AppColor.primaryColor,
    this.counterTextStyle,
    this.readOnly = false,
    this.paddingHorizonatal,
    this.validator,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      obscuringCharacter: '*',
      keyboardAppearance: Brightness.light,
      scrollController: scrollController,
      controller: textEditingController,
      cursorColor: cursoreColor,
      keyboardType: textInputType,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle ?? AppStyle.textFieldTextStyle,
      onSaved: (newValue) {},
      onTap: onTap,
      focusNode: focusNode,
      initialValue: initialValue,
      autofocus: autoFocus ?? false,
      maxLength: maxLength,
      readOnly: readOnly!,
      validator: validator,
      obscureText: obscureText ?? false,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      onTapOutside: onTapOutside ??
          (event) {
            FocusScope.of(context).unfocus();
          },
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        errorText: errorText,
        errorStyle: errorStyle ?? AppStyle.fieldErrorStyle,
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(5.r),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(5.r),
            ),
        enabledBorder: enableBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(5.r),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(5.r),
            ),
        isDense: true,
        suffixText: suffixText,
        border: InputBorder.none,
        suffixStyle: suffixTextStyle,
        suffix: suffix,
        suffixIcon: suffixIcon,
        hintText: hintText,
        counter: counterWidget,
        prefixText: prefixText,
        prefix: prefix,
        prefixIconConstraints: const BoxConstraints(),
        prefixStyle: prefixTextStyle,
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        hintStyle: textHintStyle ?? AppStyle.hintTextStyle,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(
            horizontal: paddingHorizonatal ?? 20.w,
            vertical: paddingVertical ?? 12.h),
        filled: filled ?? false,
        counterStyle: counterTextStyle,
        fillColor: fillColor,
      ),
    );
  }
}
