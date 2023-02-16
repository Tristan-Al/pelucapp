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
      'usuario': 'usuario',
      'password': 'password'
    };

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: myFormKey,
          child: Column(children: [
            const SizedBox(width: 20, height: 60),
            const FittedBox(
              child: FlutterLogo(
                size: 100,
              ),
            ),
            const SizedBox(width: 20, height: 80),
            FormFieldPers(
              ocultar: false,
              hintText: 'Usuario',
              icon: Icons.group_outlined,
              formProperty: 'usuario',
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
            const SizedBox(width: 20, height: 60),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: AppTheme.buttomColor),
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
          ]),
        ),
      ),
    );
  }
}
