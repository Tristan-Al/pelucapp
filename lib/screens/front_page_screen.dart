import 'package:flutter/material.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/theme/app_theme.dart';

class FrontPageScreen extends StatelessWidget {
  const FrontPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Image(image: AssetImage('assets/logo.png'),height: 200,),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              child:
                  const Text('Iniciar sesion', style: TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.backgroundColor,
                  side: const BorderSide(width: 2, color: AppTheme.secondaryTextColor),
                  elevation: 0,
                ),
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: const Text('Registrarse', style: TextStyle(fontSize: 20, color: AppTheme.secondaryTextColor)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 300,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2048px-Google_%22G%22_Logo.svg.png',
                    fit: BoxFit.cover),
                const SizedBox(
                  width: 30,
                ),
                Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/600px-Facebook_Logo_%282019%29.png',
                    fit: BoxFit.cover),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('Terminos y condiciones',
              style: TextStyle(
                fontSize: 20,
              )),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    ));
  }
}
