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
              const FlutterLogo( size: 200,),

              const SizedBox( height: 30,),

              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: AppTheme.buttomColor
                  ),
                  onPressed: () {
                    final route = MaterialPageRoute(builder: (context) => const HomeScreen());
                    Navigator.push(context, route);
                  },
                  child: const Text('Iniciar sesion', style: TextStyle( fontSize: 20)),
                ),
              ),

              const SizedBox( height: 30,),
              
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: AppTheme.buttomColor
                  ),
                  onPressed: () {
                    
                  },
                  child: const Text('Registrarse', style: TextStyle( fontSize: 20)),
                ),
              ),

              const SizedBox( height: 30,),

              Container(
                width:300,
                height:50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2048px-Google_%22G%22_Logo.svg.png',
                        fit:BoxFit.cover
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/600px-Facebook_Logo_%282019%29.png',
                        fit:BoxFit.cover
                    ),
                  ],
                ),
              ),

              const SizedBox( height: 30,),

              const Text('Terminos y condiciones', style: TextStyle( fontSize: 20, )),

              const SizedBox( height: 30,),
            ],
          ),
        )
    );
  }
}