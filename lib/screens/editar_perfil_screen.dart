import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class EditarPerfilScreen extends StatelessWidget {
  const EditarPerfilScreen({Key? key}) : super(key: key);

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new,
              color: AppTheme.mainTextColor),
        ),
        title: BigText(
          text: 'PELUCAPP',
          color: AppTheme.primary,
          size: 25,
        ),
      ),      
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: myFormKey,
          child: Column(children: [
            const SizedBox(height: 25),
            CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://d500.epimg.net/cincodias/imagenes/2016/07/04/lifestyle/1467646262_522853_1467646344_noticia_normal.jpg'),
                maxRadius: 100),
            const SizedBox(height: 40),
            FormFieldPers(
              ocultar: false,
              hintText: 'Cambiar nombre usuario',
              icon: Icons.group_outlined,
              formProperty: 'nombre',
              formValues: formValues,
            ),
            const SizedBox(height: 20),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'john.doe@gmail.com',
                  labelText: 'Cambiar e-mail',
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
            const SizedBox(height: 20),
            FormFieldPers(
              ocultar: false,
              keyboardType: TextInputType.number,
              hintText: 'Editar número',
              icon: Icons.phone_android_outlined,
              formProperty: 'telefono',
              formValues: formValues,
            ),
            const SizedBox(height: 20),
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
                  hintText: 'Nueva contraseña',
                  suffixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 20),
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
                  hintText: 'Confirmar nueva contraseña',
                  suffixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 50),
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
                  Navigator.pushNamed(context, 'perfil');
                },
                child: const Text('Guardar cambios usuario',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 50)
          ]),
        ),
      ),
    );
  }
}
