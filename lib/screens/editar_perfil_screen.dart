import 'package:flutter/material.dart';
import 'package:pelucapp/screens/screens.dart';
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
          icon: const Icon(Icons.arrow_back_ios_new,
              color: AppTheme.secondaryTextColor),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: BigText(
            text: 'PELUCAPP',
            color: AppTheme.secondaryTextColor,
          ),
        ),
        actions: [
          Padding(
              padding:
                  const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 35),
              child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.notifications_sharp,
                    color: AppTheme.secondaryTextColor,
                  )))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: myFormKey,
          child: Column(children: [
            const SizedBox(width: 20, height: 60),
            /*
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ClipRRect(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(
                      'https://icones.pro/wp-content/uploads/2021/02/icone-utilisateur-gris.png'),
                  height: 320,
                  width: 320,
                  fit: BoxFit.cover,
                ),
                */
            const SizedBox(width: 20, height: 80),
            FormFieldPers(
              ocultar: false,
              hintText: 'Cambiar nombre usuario',
              icon: Icons.group_outlined,
              formProperty: 'nombre',
              formValues: formValues,
            ),
            const SizedBox(width: 20, height: 20),
            FormFieldPers(
              ocultar: false,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Cambiar dirección email',
              icon: Icons.mail,
              formProperty: 'email',
              formValues: formValues,
            ),
            const SizedBox(width: 20, height: 20),
            FormFieldPers(
              ocultar: false,
              keyboardType: TextInputType.number,
              hintText: 'Editar número',
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
                  hintText: 'Nueva contraseña',
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
                  hintText: 'Confirmar nueva contraseña',
                  suffixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ))),
            ),
            const SizedBox(width: 20, height: 30),
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
          ]),
        ),
      ),
    );
  }
}
