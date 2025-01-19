import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';
import 'main.dart';


class SplashScreen extends StatefulWidget{

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthWrapper(),
          )
      );

    }
    );
  }
  @override
  Widget build(BuildContext context) {

    return Container(

      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,color: Colors.white,size: 200,),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 30,
          ),
          CircularProgressIndicator(
            color: Colors.white,
          )



        ],
      ),
    );
  }
}


class AuthWrapper extends StatelessWidget {
const AuthWrapper({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
final firebaseUser = context.watch<User?>();

if (firebaseUser != null) {
return const MyHomePage(title: "app");
}
return  LoginScreen();
}
}



