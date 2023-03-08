import 'package:flutter/material.dart';

class FormCreditCardNumber extends StatefulWidget {
  final String? hintText;
  final IconData? icon;
  final bool ocultar;
  final TextInputType? keyboardType;
  final String? value;

  // Constructor del FormEmail
  const FormCreditCardNumber({
    Key? key,
    this.hintText,
    this.icon,
    this.ocultar = false,
    this.keyboardType,
    this.value,
  }) : super(key: key);

  @override
  _FormCreditCardNumberState createState() => _FormCreditCardNumberState();
}

class _FormCreditCardNumberState extends State<FormCreditCardNumber> {
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
            /*'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})\$'*/ r'^(?:4[0-9]{3}(?:\s?[0-9]{4}){3}(?:\s?[0-9]{3})?|5[1-5][0-9]{2}(?:\s?[0-9]{4}){3}(?:\s?[0-9]{3})?)$'; //Visa MasterCard
        RegExp regExp = RegExp(pattern);

        return regExp.hasMatch(value ?? '')
            ? null
            : 'Introduzca una tarjeta válida';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: Icon(widget.icon),
      ),
      onChanged: (value) {
        if (value.length == 4 || value.length == 9 || value.length == 14) {
          _controller.text = value + " ";
          _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length));
        }
      },
    );
  }
}

/*
class FormCreditCardNumber extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool ocultar;
  final TextInputType? keyboardType;
  final String? value;

  // Constructor del FormEmail
  FormCreditCardNumber(
      {Key? key,
      this.hintText,
      this.icon,
      this.ocultar = false,
      this.keyboardType,
      this.value})
      : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return TextFormField(
    controller: _controller,
    autofocus: false,
    obscureText: ocultar,
    keyboardType: keyboardType,
    initialValue: value ?? "",
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
    onChanged: (value) {
      if (value.length == 5 || value.length == 10 || value.length == 15) {
        _controller.text = value + " ";
        _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: _controller.text.length));
      }
    },
  );
  }
}
*/
/*
class FormCreditCardNumber extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool ocultar;
  final TextInputType? keyboardType;
  final String? value;

  // Constructor del FormEmail
  FormCreditCardNumber(
      {Key? key,
      this.hintText,
      this.icon,
      this.ocultar = false,
      this.keyboardType,
      this.value})
      : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      autofocus: false,
      obscureText: ocultar,
      keyboardType: keyboardType,
      initialValue: value ?? "",
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
      onChanged: (value) {
        value = value.replaceAll(' ', '');
        if (value.length == 4 || value.length == 9 || value.length == 14) {
          _controller.text = value + " ";
          _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length));
        }
      },
    );
  }
}
*/