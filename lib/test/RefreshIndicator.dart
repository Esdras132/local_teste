import 'package:flutter/material.dart';


class RefreshIndicatorr extends StatefulWidget{
  @override
  _RefreshIndicatorrState createState() => _RefreshIndicatorrState();
}

class _RefreshIndicatorrState extends State<RefreshIndicatorr> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar( 
          title: Text("Refresh Indicator"),
          backgroundColor: Colors.deepPurpleAccent,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3));
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              for (int x = 1; x <= 4; x++) ...[
                Container(
                  height: 100,
                  color: Colors.redAccent,
                  margin: EdgeInsets.only(bottom: 10), // Adicionado para espaçar os containers
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
