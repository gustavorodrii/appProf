import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SmartClassFormFieldCustom extends StatelessWidget {
  const SmartClassFormFieldCustom({
    this.title,
    this.onFieldSubmitted,
    this.onChanged,
    this.focusNode,
    this.obscureText = false,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.errorText,
    this.showRequiredIcon = false,
    this.maxLength,
    this.textCapitalization,
    this.initialValue,
    this.controller,
    Key? key,
  }) : super(key: key);

  final String? title;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? errorText;
  final bool showRequiredIcon;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final String? initialValue;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF24112F),
                ),
              ),
              TextSpan(
                text: showRequiredIcon ? ' *' : '',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFFFAFAFA),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            onChanged: onChanged,
            textCapitalization: textCapitalization ?? TextCapitalization.words,
            focusNode: focusNode,
            maxLength: maxLength,
            initialValue: initialValue,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.only(bottom: 32 / 2, left: 8, right: 8),
              counterText: '',
              border: InputBorder.none,
            ),
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: const TextStyle(
              color: Color(0xFF24112F),
              fontSize: 14.0,
              fontFamily: 'Montserrat',
            ),
            inputFormatters: inputFormatters,
            onFieldSubmitted: onFieldSubmitted,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
