import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/screens/home/profilUser.dart';

class Home extends StatelessWidget {
   Home({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;
  String utilisateur ="";
  
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
    return  Scaffold
    (
      appBar: AppBar(
        leading: const Icon(Icons.menu , color: Colors.black,) ,
        backgroundColor : Colors.white, 
        title: const Text('Travel App',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0.0,
      actions: [
         TextButton(
            onPressed: () async{
              // go to profil user
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const profilUser()));
            /*  await _auth.signOut();
               utilisateur =user.email!;
               debugPrint(utilisateur);*/
            },
            child: const Icon(Icons.person, color: Colors.black,)
            ),
            ],
  
      ),
      body: SafeArea(
        child: Column(
       
          children:  [
           
            Text('You Sign in with ${user.email!}'),
        
          ],
        ),
      ),
    );
  }
}
