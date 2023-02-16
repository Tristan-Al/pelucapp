import 'package:flutter/material.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/theme/app_theme.dart';
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
              hintText: 'Teléfono',
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
              alignment: Alignment.topLeft,
              constraints: const BoxConstraints(
                maxWidth: 150,
                maxHeight: 50,
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyStatefulWidget(),
                  Text(
                    'A',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              constraints: const BoxConstraints(
                maxWidth: 150,
                maxHeight: 50,
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyStatefulWidget(),
                  Text(
                    'B',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
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
                  Navigator.pushNamed(context, 'home');
                },
                child:
                    const Text('Crear cuenta', style: TextStyle(fontSize: 20)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;

  // Por si queremos personalizar la reacción del checkbox cuando el usuario interactúa con él
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return AppTheme.buttomColor;
      }
      return AppTheme.secondary;
    }

    /*
    return CheckboxListTile(
        checkColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text('I agree to the Terms and Conditions'),
        value: isChecked,
        onChanged: (value) => {
              setState(() {
                isChecked = value!;
              })
            });*/
    return Checkbox(
      // Color del tick
      checkColor: Colors.white,

      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
