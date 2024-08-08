import 'package:flutter/material.dart';

class Saida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Override Back Button"),
              backgroundColor: Colors.redAccent,
            ),
            body: Center(
              child: Text("Override Back Buttton"),
            )));
  }
}
