import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class LoginApi extends StatefulWidget {
  const LoginApi({super.key});

  @override
  State<LoginApi> createState() => _LoginApiState();
}

class _LoginApiState extends State<LoginApi> {
  TextEditingController teste = TextEditingController();
  TextEditingController senha = TextEditingController();
  String? token;


  String _endPoint = 'http://URL-POCKETBASE/api/collections';

  Future<void> signIn(
      {String? login,
      String? pass,
      VoidCallback? onSuccess,
      VoidCallback? onFail,
      bool? check}) async {
    const String _authRoute = "/users/auth-with-password";
    final form = json.encode({"identity": login, "password": pass});

    try {
      var response = await post(
        Uri.parse(_endPoint + _authRoute),
        body: form,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );
      if (response.statusCode == 200) {
        token = json.decode(response.body)["token"]!;
        onSuccess!();
        log(response.body);
      } else {
        onFail!();
      }
    } catch (err) {
      onFail!();
      throw ("some arbitrary error, ${err.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('logim page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16), 
        child: Column(
        children: [
          TextField(
            controller: teste,
          ),
          TextField(
            controller: senha,
          ),
          TextButton(
              onPressed: () async {
                signIn(
                  onSuccess: () {
                    _onLoginSuccess();
                  },
                  onFail: () {
                    _onLoginFailed();
                  },
                  login: teste.text,
                  pass: senha.text,
                );
                setState(() {
                  
                });
              },
              child: const Text('teste')),
          Text('o seu token é $token'),
          TextButton(onPressed: (){setState(() {
            
          });}, child: const Text('Atualizar'))
        ],
      ),)
    );
  }

  Future<void> _onLoginSuccess() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bem vindo'),
          content: const Text('Logim bem sucedido '),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _onLoginFailed() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro '),
          content: const Text('login ou senha incorretos '),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
