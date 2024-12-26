import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Conexao extends StatefulWidget {
  @override
  _ConexaoState createState() => _ConexaoState();
}

class _ConexaoState extends State<Conexao> {
  bool _isConnectedToWifi = false;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    _startListeningToConnectivityChanges();
  }

  Future<void> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isConnectedToWifi = (connectivityResult == ConnectivityResult.wifi);
    });
  }

  void _startListeningToConnectivityChanges() {
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      setState(() {
        _isConnectedToWifi = results.contains(ConnectivityResult.wifi);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connectivity Example'),
      ),
      body: Center(
        child: Text(
          'Connected to Wi-Fi: $_isConnectedToWifi',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
