import 'package:flutter/material.dart';
//import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formProperty = "";
    String pass = "";
    String passCon = "";
    final myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'nombre': 'nombre',
      'telefono': 'telefono',
      'email': 'email',
      'password': 'password',
      'confirmacion': 'confirmacion'
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
            FormFieldRegi(
              ocultar: false,
              hintText: 'Nombre',
              icon: Icons.group_outlined,
              formProperty: 'nombre',
              formValues: formValues,
            ),
            const SizedBox(width: 20, height: 20),
            FormFieldRegi(
              ocultar: false,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email',
              icon: Icons.mail,
              formProperty: 'email',
              formValues: formValues,
            ),
            const SizedBox(width: 20, height: 20),
            FormFieldRegi(
              ocultar: false,
              hintText: 'telefono',
              icon: Icons.phone_android_outlined,
              formProperty: 'telefono',
              formValues: formValues,
            ),
            const SizedBox(width: 20, height: 20),
            TextFormField(
              autofocus: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              onChanged: (value) => formValues[formProperty] = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'No puede quedar vacío';
                } else if (value.length < 6) {
                  return 'No puede tener menos de 6 caracteres';
                } else {
                  pass = value;
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  suffixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ))),
            ),
            const SizedBox(width: 20, height: 20),
            TextFormField(
              autofocus: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              onChanged: (value) => formValues[formProperty] = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'No puede quedar vacío';
                } else if (value.length < 6) {
                  return 'No puede tener menos de 6 caracteres';
                } else {
                  passCon = value;
                  if (pass != passCon) {
                    return 'Las contraseñas deben coincidir';
                  }
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  hintText: 'Confirmar contraseña',
                  suffixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ))),
            ),
            const SizedBox(width: 20, height: 60),
            ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (!myFormKey.currentState!.validate()) {
                    print('Credenciales incorrectas');
                    return;
                  } else if (passCon != pass) {
                    print('Contraseñas deben coincidir');
                    return;
                  }
                  /*
                  final route3 = MaterialPageRoute(
                      builder: (context) => const ListViewScreen3());
                  Navigator.push(context, route3);
                  */
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Text('Crear cuenta', textAlign: TextAlign.center),
                )),
          ]),
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          final route3 =
              MaterialPageRoute(builder: (context) => const HomeScreen3());
          Navigator.push(context, route3);
        },
      ),
      */
    );
  }
}
