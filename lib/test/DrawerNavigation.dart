import 'package:flutter/material.dart';

class Drawer_Navigation extends StatefulWidget{
  @override
  _Drawer_NavigationState createState() => _Drawer_NavigationState();
}

class _Drawer_NavigationState extends State<Drawer_Navigation> {  

  final scaffoldKey = GlobalKey<ScaffoldState>();
  //key for scaffold, required to manually open/close drawer

  @override
  Widget build(BuildContext context) { 
    return  Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text("Drawer in Flutter Flutter"),
          ),
          drawer: Drawer(
              child: SafeArea( 
                child:Column(
                    children: [
                       ListTile(
                          dense: true,
                          title: Text("Drawer_Navigation Page"),
                          leading: Icon(Icons.home),
                          onTap: (){
                              //action when this menu is pressed
                          },
                       ),

                       ListTile(
                          dense: true,
                          title: Text("My Profile"),
                          leading: Icon(Icons.person),
                          onTap: (){
                              //action when this menu is pressed
                          },
                       ),


                       ListTile(
                          dense: true,
                          title: Text("My Orders"),
                          leading: Icon(Icons.add_box),
                          onTap: (){
                              //action when this menu is pressed
                          },
                       ),

                       ListTile(
                          dense: true,
                          title: Text("My Favourites"),
                          leading: Icon(Icons.monitor_heart),
                          onTap: (){
                              //action when this menu is pressed
                          },
                       )
                  ],
                )
              ),
          ),
          
          body: Container(
              height: 150,
              child: Center( 
                 child: ElevatedButton(  //open/close drawer by code
                    child: Text("Open/Close Drawer"),
                    onPressed: (){
                        if(scaffoldKey.currentState!.isDrawerOpen){
                            scaffoldKey.currentState!.closeDrawer();
                            //close drawer, if drawer is open
                        }else{
                            scaffoldKey.currentState!.openDrawer();
                            //open drawer, if drawer is closed
                        }
                    },
                 ),
              ),
          )
       );
  }
}