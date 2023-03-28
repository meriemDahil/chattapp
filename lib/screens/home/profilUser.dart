import 'package:chatapp/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class profilUser extends StatefulWidget  {
  const profilUser({super.key});

  @override
  State<profilUser> createState() => _profilUserState();
}

class _profilUserState extends State<profilUser> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(icon: const Icon(Icons.arrow_left, color: Colors.black),
        onPressed: () async 
        //{Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  Home())); },
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
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(children:const  [
          
            CircleAvatar(radius:45.0,
           backgroundImage:NetworkImage("https://lastfm.freetls.fastly.net/i/u/770x0/13f370ec1fcca1dca240abb85fcbb914.jpg"),
              ),
           
            ]
            ),
          ),
        )

      ),
    );
  }
}