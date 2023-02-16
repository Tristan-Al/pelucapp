import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelucapp/screens/front_page_screen.dart';
import 'package:pelucapp/theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(const FrontPageScreen());
    }); 
    return Scaffold(
      backgroundColor: AppTheme.mainColor,
       body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              Image.network(
                        'https://cdn-icons-png.flaticon.com/512/40/40857.png',
                        fit:BoxFit.cover
                    ),
             
            ],         
        ),
        ),
    );
  }
}