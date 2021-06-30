import 'package:flutter/material.dart';
import 'package:virtoustack_app/Model/Category.dart';
import 'package:virtoustack_app/Model/SuperResponce.dart';
import 'package:virtoustack_app/Reposetory/category_repo.dart';

class home extends StatefulWidget{
  _homeState createState()=> _homeState();
}

class _homeState extends State<home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog's path",style: TextStyle(fontSize: 12,color: Colors.white70),),
        elevation: 0.2,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          child:FutureBuilder(
            future: GetCategoryListRepo.getCatgories(),
            builder: (BuildContext context, AsyncSnapshot<SuperResponse<List<Category>>> snap){
              if(snap.hasData){
                var list = snap.data.data;
                print('111111${list}');
                return  ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...list.map((e){
                      Container(
                        child: Column(
                          children: [
                            Text(e.id),
                            Text(e.title),

                          ],
                        ),
                      );
                    }),
                  ],
                );
              }else if(snap.hasError){
                print(snap.error);
                return Text("Select Category");
                //showSnackBar('No Internet Connection!!', _scaffoldKey);
              }
            },
          ),
        ),
      ),
    );
  }
}