import 'package:flutter/material.dart';
import 'package:pelucapp/widgets/big_text.dart';
import 'package:pelucapp/widgets/small_text.dart';

import '../theme/app_theme.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});
  static String tProfileImage = "https://img.freepik.com/iconos-gratis/usuario_318-725053.jpg";

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),

              CircleAvatar(
                  backgroundColor: AppTheme.secondary,
                  minRadius: 105.0,
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage:
                        NetworkImage(tProfileImage),
                  ),
                ),

              SizedBox(height: 10,),

              _UserDetailItem( text: 'Usuario.nombre', icon: Icon(Icons.account_circle, color: AppTheme.secondary, size: 40,)),

              _UserDetailItem( text: 'usuario.email', icon: Icon(Icons.email_outlined, color: AppTheme.secondary, size: 40,)),

              _UserDetailItem( text: '623829123', icon: Icon(Icons.phone, color: AppTheme.secondary, size: 40,)),

              SizedBox(height: 10,),

              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'editar');
                  },
                  child: const Text('Editar perfil', style: TextStyle(fontSize: 20,)),
                ),
              ),

              SizedBox(height: 110,),
            ],
          ),
        ),
      );
  }
}

class _UserDetailItem extends StatelessWidget {
  const _UserDetailItem({
    super.key, required this.icon, required this.text,
  });
  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 15,),
          SmallText(text: text, color: Colors.black, size: 25,),
        ],
      ),
      );
  }
}