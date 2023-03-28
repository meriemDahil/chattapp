
import 'package:chatapp/screens/authentication/authentication.dart';
import 'screens/home/profilUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/screens/home/home.dart';

class Wrapper extends StatelessWidget {
   const Wrapper({super.key});
 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context , snapshot ){

    if (snapshot.hasData) {
      return  Home();
    } else {
      return const authentication();
    }
    
    } 
    ),
    );
  }
}