import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Conectado extends StatefulWidget {
  @override
  _ConectadoState createState() => _ConectadoState();
}

class _ConectadoState extends State<Conectado> {
  String cType = "none";

  @override
  void initState() {
    checkConnection();

    // Listen to the network connection type change
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      setState(() {
        if (result.contains(ConnectivityResult.mobile)) {
          cType = "Mobile Data";
        } else if (result.contains(ConnectivityResult.wifi)) {
          cType = "Wifi Network";
        } else if (result.contains(ConnectivityResult.ethernet)) {
          cType = "Ethernet Network";
        } else if (result.contains(ConnectivityResult.bluetooth)) {
          cType = "Bluetooth Data connection";
        } else {
          cType = "none";
        }
      });
    });

    super.initState();
  }

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      if (connectivityResult == ConnectivityResult.mobile) {
        cType = "Mobile Data";
      } else if (connectivityResult == ConnectivityResult.wifi) {
        cType = "Wifi Network";
      } else if (connectivityResult == ConnectivityResult.ethernet) {
        cType = "Ethernet Network";
      } else if (connectivityResult == ConnectivityResult.bluetooth) {
        cType = "Bluetooth Data connection";
      } else {
        cType = "none";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Connection Type"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              "Connection Type: $cType",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
