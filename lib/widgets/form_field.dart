import 'package:flutter/material.dart';

class FormFieldRegi extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool ocultar;
  final TextInputType? keyboardType;

  final String formProperty;
  final Map<String, String> formValues;

  // Constructor del FormFieldRegi
  const FormFieldRegi({
    Key? key,
    this.hintText,
    this.icon,
    this.ocultar = false,
    required this.formProperty,
    required this.formValues,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: ocultar,
      keyboardType: keyboardType,
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        // validacion para el form. DEFINIR
        if (value!.isEmpty) {
          return 'No puede quedar vacío';
        }
        if (value.length < 6) {
          return 'No puede tener menos de 6 caracteres';
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(icon),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ))),
    );
  }
}
