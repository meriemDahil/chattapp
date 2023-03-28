import 'package:chatapp/screens/authentication/authentication.dart';
import 'package:chatapp/screens/home/home.dart';
import 'package:chatapp/screens/home/listprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class profilUser extends StatefulWidget  {
  const profilUser({super.key});

  @override
  State<profilUser> createState() => _profilUserState();
}

class _profilUserState extends State<profilUser> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future signOut() async{
     try{
      debugPrint('you signed out');
      return _auth.signOut();
      }
      catch(e){
       return null;
      }
     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(icon: const Icon(Icons.arrow_left, color: Colors.black),
        onPressed: () async 
       // {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  Home())); },
       // {Get.back();},
        {Navigator.pop(context);},
        ),
        backgroundColor : Colors.white, 
        title: const Text('Travel App',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0.0,
      ),

      body:SingleChildScrollView(
        child:  Container(
          padding:  const EdgeInsets.all(25.0),
          child: Center(
            child: Column(children:  [
            const CircleAvatar(radius:45.0,
              backgroundImage:NetworkImage("https://lastfm.freetls.fastly.net/i/u/770x0/13f370ec1fcca1dca240abb85fcbb914.jpg"),
              ),
            const SizedBox(height: 20.0,),
            Text(user.email!),
            const SizedBox(height: 20.0,),
            ListProfile(title: "Setting", icon: Icons.abc, onPressed:(){}, endicon:true, textcolor: Colors.black),
            ListProfile(title: "Profile", icon: Icons.abc, onPressed:(){}, endicon:true, textcolor: Colors.black),
            ListProfile(title: "Log out", icon: Icons.abc,
             onPressed:() async
            { 
               await _auth.signOut();
              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const authentication()));
              Navigator.pop(context);
            },
               endicon:false, textcolor: Colors.red),
            ]
            ),
          ),
        )
      ),
    );
  }
}