import 'package:flutter/material.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'email': 'email',
      'password': 'password'
    };

    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: _FormLogIn(myFormKey: myFormKey, formValues: formValues),
        )
      ],
    ));
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
    return Form(
      key: myFormKey,
      child: Column(children: [
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
        const SizedBox(height: 60),
        Container(
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/40/40857.png',
            fit: BoxFit.cover,
            width: 200,
            height: 200,
          ),
        ),
        const SizedBox(width: 20, height: 80),
        FormEmail(
          ocultar: false,
          hintText: 'Email',
          icon: Icons.email_outlined,
          formProperty: 'email',
          formValues: formValues,
        ),
        const SizedBox(width: 20, height: 20),
        FormFieldPers(
          icon: Icons.key,
          ocultar: true,
          hintText: 'Contraseña',
          formProperty: 'password',
          formValues: formValues,
        ),
        const SizedBox(width: 20, height: 40),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'email');
          },
          child: const Text('¿Has olvidado tu contraseña?',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 20, height: 40),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (!myFormKey.currentState!.validate()) {
                print('Credenciales incorrectas');
                return;
              }
              Navigator.pushNamed(context, 'home');
            },
            child: const Text('Log in', style: TextStyle(fontSize: 20)),
          ),
        ),
        const SizedBox(height: 60)
      ]),
    );
  }
}
