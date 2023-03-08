import 'package:flutter/material.dart';

class FormCreditCardDate extends StatefulWidget {
  final String? hintText;
  final IconData? icon;
  final bool ocultar;
  final TextInputType? keyboardType;
  final String? value;

  // Constructor del FormEmail
  const FormCreditCardDate({
    Key? key,
    this.hintText,
    this.icon,
    this.ocultar = false,
    this.keyboardType,
    this.value,
  }) : super(key: key);

  @override
  _FormCreditCardDateState createState() => _FormCreditCardDateState();
}

class _FormCreditCardDateState extends State<FormCreditCardDate> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      autofocus: false,
      obscureText: widget.ocultar,
      keyboardType: widget.keyboardType,
      validator: (value) {
        String pattern =
            r'^(0[1-9]|1[0-2])\/?([0-9]{2})$'; //Date, podria haber usado r'REGEX' para indicar raw string
        RegExp regExp = RegExp(pattern);

        return regExp.hasMatch(value ?? '')
            ? null
            : 'Introduzca una fecha en formato válido (MM/YY)';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: Icon(widget.icon),
      ),
      onChanged: (value) {
        if (value.length == 2) {
          _controller.text = value + "/";
          _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length));
        }
      },
    );
  }
}

/*
class FormCreditCardDate extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool ocultar;
  final TextInputType? keyboardType;
  final String? value;

  // Constructor del FormEmail
  const FormCreditCardDate(
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
        String pattern =
            r'^(0[1-9]|1[0-2])\/?([0-9]{2})$'; //Date, podria haber usado r'REGEX' para indicar raw string
        RegExp regExp = RegExp(pattern);

        return regExp.hasMatch(value ?? '')
            ? null
            : 'Introduzca una fecha en formato válido (MM/YY)';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(icon),
      ),
    );
  }
}
*/