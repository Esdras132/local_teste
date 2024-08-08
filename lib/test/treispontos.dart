import 'package:flutter/material.dart';


class tresp extends  StatefulWidget {
  @override
  State<tresp> createState() => _trespState();
}

class _trespState extends State<tresp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
            title: Text("Popup Menu on AppBar"),
            backgroundColor: Colors.redAccent,
            actions: [
                 
                 PopupMenuButton(
                   // add icon, by default "3 dot" icon
                  //icon: Icon(Icons.book)
                   itemBuilder: (context){
                     return [
                            const PopupMenuItem<int>(
                                value: 0,
                                child: Text("My Account"),
                            ),

                            const PopupMenuItem<int>(
                                value: 1,
                                child: Text("Settings"),
                            ),

                            const PopupMenuItem<int>(
                                value: 2,
                                child: Text("Logout"),
                            ),
                        ];
                   },
                   onSelected:(value){
                      if(value == 0){
                         print("My account menu is selected.");
                      }else if(value == 1){
                         print("Settings menu is selected.");
                      }else if(value == 2){
                         print("Logout menu is selected.");
                      }
                   }
                  ),

                   
            ],
         ),

         body: Container( 
               
        )
    );
  } 
}