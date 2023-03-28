import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Register extends StatefulWidget {
 final VoidCallback showlogin;

  const Register({super.key, required this.showlogin});

  @override
  State<Register> createState() => _RegisterState();
 
}

class _RegisterState extends State<Register> {
final FirebaseAuth _auth =FirebaseAuth.instance;
 

 final _emailController =TextEditingController();
 final _password =TextEditingController();
 final _confirmpassword = TextEditingController();
 final _nameController =TextEditingController();
 final _prenomController =TextEditingController();
 final _ageController = TextEditingController();
 String error ="wrong confirm password";
 Future register() async {

try{
if (confirmpw()){
UserCredential result = await _auth.createUserWithEmailAndPassword(email: _emailController.text
.trim(), password: _password.text.trim());
 User? user  = result.user;
 addUserDetails(
  _nameController.text.trim(),
 _prenomController.text.trim(), 
 int.parse(_ageController.text.trim()),
 _emailController.text.trim(),
 );
 return user;
}
}catch(e)
 {debugPrint(e.toString());}
}

 bool confirmpw(){
  if (_confirmpassword.text.trim()==_password.text.trim()) 
  { return true;} 
  else 
  { return false;}
 }
 Future addUserDetails (String firstname , String lastname, int age, String email)async{
final _user = await FirebaseFirestore.instance.collection('users').add({
  "firstname" :firstname,
  "lastname":lastname,
  "age":age,
  "email":email
});
 }


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _password.dispose();
    _confirmpassword.dispose();
    _ageController.dispose();
    _nameController.dispose();
    _prenomController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade300,
      
      body:SingleChildScrollView(
        
        child: SafeArea(
          child:Column(
            children: <Widget>[
            const Padding(
              padding:  EdgeInsets.all(15.0),
              child: CircleAvatar(backgroundImage: NetworkImage('https://news.artnet.com/app/news-upload/2023/01/automat.jpeg'),
                radius: 50.0,
              ),
            ),
            const SizedBox(height: 20.0,),
           const  Text('Explore Your Favorite Journey ',
           style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.7,
        ),
        ),
        const Text('With us ',
           style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.7,
        ),
        ),
        const SizedBox(height: 20.0,),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                
              decoration: BoxDecoration(color: Colors.grey.shade50,
                  border: Border.all(color: Colors.white,),
                   borderRadius: BorderRadius.circular(12),
              ),
                  
                    child:   Padding(
                      padding:const  EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextField(
                        controller: _prenomController,
                          decoration:const InputDecoration(
                            hintText: 'Fisrt Name',
                            border: InputBorder.none,
                          ),
                         
            
                    ) ,
                  ),
                  ),
            
              ),
              const SizedBox(height: 10.0,),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                
              decoration: BoxDecoration(color: Colors.grey.shade50,
                  border: Border.all(color: Colors.white,),
                   borderRadius: BorderRadius.circular(12),
              ),
                  
                    child:   Padding(
                      padding:const  EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextField(
                        controller: _nameController,
                          decoration:const InputDecoration(
                            hintText: 'Last Name',
                            border: InputBorder.none,
                          ),
                         
            
                    ) ,
                  ),
                  ),
            
              ),
       
        const SizedBox(height: 10.0,),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                
              decoration: BoxDecoration(color: Colors.grey.shade50,
                  border: Border.all(color: Colors.white,),
                   borderRadius: BorderRadius.circular(12),
              ),
                    child:   Padding(
                      padding:const  EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextField(
                        controller: _ageController,
                          decoration:const InputDecoration(
                            hintText: 'Age',
                            border: InputBorder.none,
                          ),
                         
            
                    ) ,
                  ),
                  ),
            
              ),
               const SizedBox(height: 10.0,),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                
              decoration: BoxDecoration(color: Colors.grey.shade50,
                  border: Border.all(color: Colors.white,),
                   borderRadius: BorderRadius.circular(12),
              ),
                  
                    child:   Padding(
                      padding:const  EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextField(
                        controller: _emailController,
                          decoration:const InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                         
            
                    ) ,
                  ),
                  ),
            
              ),
              const SizedBox(height: 10.0,),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:Container(
            decoration: BoxDecoration(color: Colors.grey.shade50,
                border: Border.all(color: Colors.white,),
                 borderRadius: BorderRadius.circular(12),
            ),
                
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                       controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'password',
                          border: InputBorder.none,
                          
                        ),
                       

                  ) ,
                ),
                ),
              ),
               const SizedBox(height: 10.0,),
               Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:Container(
            decoration: BoxDecoration(color: Colors.grey.shade50,
                border: Border.all(color: Colors.white,),
                 borderRadius: BorderRadius.circular(12),
            ),
                
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                       controller: _confirmpassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'confirm password',
                          border: InputBorder.none,
                          
                        ),
                       

                  ) ,
                ),
                ),
              ),
              const SizedBox(height: 10.0,),
               Padding(padding: const  EdgeInsets.symmetric(horizontal: 25.0),
               child:GestureDetector(
                onTap: register,
                 child: Container(
                 padding:   const EdgeInsets.all(20.0),
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurpleAccent,
                   ),
                   
                   child:const  Center(
                    child:Text('Register',
                   style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                   
                   ),
                  
                   ),
                             ),
                             ),
               ),
             
               ),
              const  SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget> [
                 const Text('i\'m member yet?',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  letterSpacing: 0.5,
                 
                  ),
                  ),
                   GestureDetector(
                    onTap: widget.showlogin,
                     child: const Text('  login here',style:TextStyle(
                                     fontWeight: FontWeight.w500,
                                     fontSize: 15.0,
                                     color: Colors.blue,
                                     letterSpacing: 0.5,
                                     ),
                                     ),
                   ),
                ],
              ),
            

              ],
              ),
              ),
      ),
            );
          }
        }