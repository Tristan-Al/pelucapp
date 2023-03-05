import 'package:flutter/material.dart';

class FormCreditCardNumber extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool ocultar;
  final TextInputType? keyboardType;
  final String? value;

  final String formProperty;
  final Map<String, String> formValues;

  // Constructor del FormEmail
  const FormCreditCardNumber(
      {Key? key,
      this.hintText,
      this.icon,
      this.ocultar = false,
      required this.formProperty,
      required this.formValues,
      this.keyboardType,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: ocultar,
      keyboardType: keyboardType,
      initialValue: value ?? "",
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        String pattern =
            '^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})\$'; //Visa MasterCard
        RegExp regExp = RegExp(pattern);

        return regExp.hasMatch(value ?? '')
            ? null
            : 'Introduzca una tarjeta válida';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(icon),
      ),
    );
  }
}
