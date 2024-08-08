import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class CepApi extends StatefulWidget {
  const CepApi({super.key});

  @override
  State<CepApi> createState() => _CepApiState();
}

class _CepApiState extends State<CepApi> {
  TextEditingController teste = TextEditingController();
  String? address;
  String? state;
  String? district;
  String? city;
  String? city_ibge;

  String _endPoint = 'https://cep.awesomeapi.com.br/json/';

  Future<void> signIn(
      {String? cep,
      VoidCallback? onSuccess,
      VoidCallback? onFail,
      bool? check}) async {
    String _authRoute = teste.text;

    try {
      var response = await get(
        Uri.parse(_endPoint + _authRoute),
      );
      if (response.statusCode == 200) {
        address = json.decode(response.body)["address"]!;
        state = json.decode(response.body)["state"]!;
        district = json.decode(response.body)["district"]!;
        city = json.decode(response.body)["city"]!;
        city_ibge = json.decode(response.body)["city_ibge"]!;
        log(response.body);
        setState(() {});
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
          title: const Text('cep'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: teste,
              ),
              TextButton(
                  onPressed: () async {
                    signIn(
                      onFail: () {
                        _onLoginFailed();
                      },
                      cep: teste.text,
                    );
                    setState(() {});
                  },
                  child: const Text('teste')),
              Text(address.toString()),
              Text(state.toString()),
              Text(district.toString()),
              Text(city.toString()),
              Text(city_ibge.toString()),
            ],
          ),
        ));
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
