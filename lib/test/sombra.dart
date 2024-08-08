import 'package:flutter/material.dart';

class Sombra extends StatefulWidget{
  @override
  _SombraState createState() => _SombraState();
}

class _SombraState extends State<Sombra> { 
  @override
  Widget build(BuildContext context) { 
    return  Scaffold(
      appBar: AppBar(
      ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
                children: [                  
                   Container(
                     height: 150, 
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 10,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes x,y position of shadow
                          ),
                        ],
                      ),
                   ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                       spreadRadius: 10,
                            blurRadius: 5,
                            offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Text('teste'),
                  ),
            ],),
          ),
       );
  }
}