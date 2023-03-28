import 'package:flutter/material.dart';

class ListProfile extends StatelessWidget{

  final String title ;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endicon;
  final Color? textcolor;

  const ListProfile({super.key,  required this.title, required this.icon, required this.onPressed, required this.endicon, required this.textcolor});
  
  @override
  Widget build(BuildContext context) {
    return   ListTile(
      onTap: onPressed,
      leading: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.grey.shade200,),
        child:const Icon(Icons.settings),

      ),
      title:Text(title,style: const TextStyle(color: Colors.black),),

      trailing: endicon? Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.grey.shade200,),
        child:const Icon(Icons.arrow_right),
      ):null,
    );
  }
  

}