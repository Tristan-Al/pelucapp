import 'package:flutter/material.dart';

class FormFieldEdit extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool ocultar;
  final TextInputType? keyboardType;
  final String? value;

  // Constructor del FormFieldRegi
  const FormFieldEdit(
      {Key? key,
      this.hintText,
      this.icon,
      this.ocultar = false,
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
      validator: (value) {
        if (value == null || value.length < 1) {
          return 'El campo es obligatorio';
        } else if (value.length < 4) {
          return 'Es necesario completar el campo con al menos 4 caracteres';
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(icon),
      ),
    );
  }
}
