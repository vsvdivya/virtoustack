import 'package:flutter/material.dart';
import 'package:virtoustack_app/Screen/login.dart';

class Splash extends StatefulWidget{
  _SplashState createState()=> _SplashState();
}

class _SplashState extends State<Splash>{

  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 10),
            () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => login()),
        ));
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
         color: Colors.black87,
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         child: Column(
           children: [
             Center(
               child: Container(
                 height: 120,
                 width: 120,
                 margin: EdgeInsets.only(top: 150),
                 child: Image.asset("Asset/Images/image.gif"),
               ),
             ),
             SizedBox(height: 20,),
             Text("Dog's Path",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white70),),
             SizedBox(height: 10,),
             Text("by",style: TextStyle(fontSize: 13,color: Colors.white70),),
             SizedBox(height: 15,),
             Text("VirtouStack Software Pvt Ltd.",style: TextStyle(fontSize: 18,color: Colors.white70),),
           ],
         ),
       ),
     );
  }
}