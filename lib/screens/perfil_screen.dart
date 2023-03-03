import 'package:flutter/material.dart';
import 'package:pelucapp/widgets/big_text.dart';
import 'package:pelucapp/widgets/small_text.dart';

import '../theme/app_theme.dart';

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key});

  Widget textfield({@required hintText}) {
    return Material(
      elevation: 2,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    SizedBox(
                      height:
                          70.0, // Establece la altura deseada entre los dos campos de texto
                    ),
                    textfield(
                      hintText: 'Nombre',
                    ),
                    SizedBox(
                      height:
                          16.0, // Establece la altura deseada entre los dos campos de texto
                    ),
                    textfield(
                      hintText: 'Apellidos ',
                    ),
                    SizedBox(
                      height:
                          16.0, // Establece la altura deseada entre los dos campos de texto
                    ),
                    textfield(
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height:
                          16.0, // Establece la altura deseada entre los dos campos de texto
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'editar');
                        },
                        child: Text('Editar perfil')),
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
              ),
              painter: HeaderCurvedContainer(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 5.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/User.png'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 220, left: 84),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color.fromARGB(255, 6, 0, 0);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
