import 'package:flutter/material.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool _checkedP = false;
bool _checkedT = false;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    String formProperty = "";
    String pass = "";
    String passCon = "";
    final myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'nombreusuario': 'nombreusuario',
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
          const SizedBox(width: 20, height: 60),
          Container(
            child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/40/40857.png',
                fit: BoxFit.cover,
                width: 200,
                height: 200),
          ),
          const SizedBox(width: 20, height: 80),
          FormFieldPers(
            ocultar: false,
            hintText: 'Nombre de usuario',
            icon: Icons.group_outlined,
            formProperty: 'nombreusuario',
            formValues: formValues,
          ),
          const SizedBox(width: 20, height: 20),
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
          const SizedBox(width: 20, height: 20),
          FormFieldPers(
            ocultar: false,
            keyboardType: TextInputType.number,
            hintText: '111 222 333',
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
          const SizedBox(width: 20, height: 30),
          Container(
            color: Colors.green,
            child: Material(
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                    'Acepto recibir notificaciones sobre las novedades de la app'),
                value: _checkedP,
                onChanged: (value) {
                  setState(() {
                    _checkedP = value!;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.green,
            child: Material(
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                    'He leido y acepto los términos y condiciones de uso'),
                value: _checkedT,
                onChanged: (value) {
                  setState(() {
                    _checkedT = value!;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                if (!myFormKey.currentState!.validate()) {
                  print('Credenciales incorrectas');
                  return;
                } else if (passCon != pass) {
                  print('Contraseñas deben coincidir');
                  return;
                }
                Navigator.pushNamed(context, 'home');
              },
              child: const Text('Crear cuenta', style: TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(height: 40),
        ]),
      ),
    ));
  }
}
