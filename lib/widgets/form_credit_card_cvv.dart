import 'package:flutter/material.dart';

class FormCreditCardCvv extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool ocultar;
  final TextInputType? keyboardType;
  final String? value;

  final String formProperty;
  final Map<String, String> formValues;

  // Constructor del FormEmail
  const FormCreditCardCvv(
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
        String pattern = '^[0-9]{3, 4}\$'; //CVV
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
