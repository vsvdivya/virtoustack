import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'home.dart';

class login extends StatefulWidget{
  _loginState createState()=> _loginState();
}

class _loginState extends State<login>{

  bool _isloggin = false;
  Map _userObj = {};
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       color: Colors.black87,
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       child: Container(
         margin: EdgeInsets.only(top: 250),
         child: Column(
           children: [
             Text("Sign In",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white70),),
             SizedBox(height: 20,),
             Text("Sign in with your facebook account",style: TextStyle(fontSize: 13,color: Colors.white70),),
             SizedBox(height: 20,),
             Container(
                 child: _isloggin ?
                 Column(
                   children: [
                     Text(""),
                     TextButton(onPressed: (){
                       FacebookAuth.instance.logOut().then((value){
                         setState(() {
                           _isloggin = false;
                           _userObj = {};
                         });
                       });
                     },
                         child: Text("logout"))
                   ],
                 ) :
                 Builder(builder: (context)=> InkWell(
                   onTap: (){
                     FacebookAuth.instance.login(
                       permissions: ["public_profile0","email"]
                     ).then((value){
                      setState(() {
                        _isloggin = true;
                        Map userData;
                        _userObj = userData;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
                      });
                     });
                   },
                   child:Image.asset("Asset/Images/fbbtn.png",height: 30,)
                 )),
           ),
           ],
         ),
       ),
     ),
   );
  }
}