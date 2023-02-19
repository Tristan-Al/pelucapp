import 'package:flutter/material.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'email': 'email',
    };

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: _FormLogIn(myFormKey: myFormKey, formValues: formValues),
      ),
    );
  }
}

class _FormLogIn extends StatelessWidget {
  const _FormLogIn({
    super.key,
    required this.myFormKey,
    required this.formValues,
  });

  final GlobalKey<FormState> myFormKey;
  final Map<String, String> formValues;

  @override
  Widget build(BuildContext context) {
    String formProperty = "";
    return Form(
      key: myFormKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
        Row(
          children: [
            IconButton(
              alignment: Alignment.topLeft,
              onPressed: () => {Navigator.pop(context)},
              icon: Icon(Icons.arrow_back_ios, size: 28, color: Colors.black),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text('¿Has olvidado tu contraseña?',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 30),
        Text(
          'Te enviaremos las instrucciones a tu e-mail para que puedas restablecerla',
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 30),
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              hintText: 'john.doe@gmail.com',
              labelText: 'E-mail',
              suffixIcon: Icon(Icons.key),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ))),
          onChanged: (value) => formValues[formProperty] = value,
          validator: (value) {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp = RegExp(pattern);

            return regExp.hasMatch(value ?? '')
                ? null
                : 'El valor ingresado no luce como un correo';
          },
        ),
        const SizedBox(height: 55),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Restablecer contraseña',
                style: TextStyle(fontSize: 20)),
          ),
        ),
      ]),
    );
  }
}
