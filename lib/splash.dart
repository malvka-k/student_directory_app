// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_directory_app/studentlogin.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {Future.delayed(Duration(seconds: 3),(){
      Navigator.push(context,MaterialPageRoute(builder:(context) =>  Studentlogin(), ));
    },);
    return Scaffold(body: Center(child:Lottie.asset("assets/splash2.json")));
  }
}