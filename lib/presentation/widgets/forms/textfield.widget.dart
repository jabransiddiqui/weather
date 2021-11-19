import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '/extensions/extension.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.controller,
    this.hint = '',
    this.hintStyle,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.height = 40,
    this.width,
    this.validatation = true,
    this.errorText = 'This field can not be empty',
    this.inputFormatter,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.textInputAction = TextInputAction.done,
    this.withLabel = true,
    this.validator,
    this.onSaved,
    this.onChanged
  }) : super(key: key);

  final TextEditingController? controller;
  final String? icon;
  final String hint;
  final TextStyle? hintStyle;
  final TextInputType keyboardType;
  final bool obscureText;
  final double height;
  final double? width;
  final bool validatation;
  final String errorText;
  final FilteringTextInputFormatter? inputFormatter;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final TextInputAction textInputAction;
  final bool withLabel;
  final String? validator;
  final Function(String? value)? onSaved;
  final Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      
      controller: controller,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
      obscureText: obscureText,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        // filled: true,
        isDense: true,
        prefixIcon: icon != null
            ? Container(
                height: 8,
                width: 8,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: SvgPicture.asset(
                  icon!.svg,
                ),
              )
            : null,
        hintText: hint,
        labelText: hint,
        hintStyle: hintStyle,
        border: InputBorder.none,
        // errorStyle: const TextStyle(height: 0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1, color: Theme.of(context).colorScheme.primary.greyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      maxLines: maxLines,
      minLines: minLines,
      validator: validatation
          ? (_) => validator
          : (_) => null,
      inputFormatters: [
        inputFormatter ?? FilteringTextInputFormatter.deny(''),
      ],
      onSaved: onSaved,
      onChanged: onChanged,
    );
  }
}
