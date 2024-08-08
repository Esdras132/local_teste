import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CamScanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CamScanner(); // cria estado
  }
}

class _CamScanner extends State<CamScanner> {
  late String scanresult;

  @override
  void initState() {
    scanresult = "";
    super.initState();
    requestCameraPermission();
  }

  Future<void> requestCameraPermission() async {
    // Verificar se a permissão já foi concedida
    if (await Permission.camera.isGranted) {
      // Permissão já concedida
      return;
    }

    // Solicitar permissão
    var status = await Permission.camera.request();

    if (status.isDenied) {
      // Se a permissão foi negada, mostre uma mensagem ao usuário
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Permissão Negada'),
          content: Text('Para usar a câmera, é necessário conceder permissão.'),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR or Bar code Scanner"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(child: Text("Scan Result: " + scanresult)),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () async {
                  if (await Permission.camera.isGranted) {
                    scanresult = (await scanner.scan())!;
                    setState(() {});
                  } else {
                    var status = await Permission.camera.request();

                    if (status.isDenied) {
                      // Se a permissão foi negada, mostre uma mensagem ao usuário
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Permissão Negada'),
                          content: Text(
                              'Para usar a câmera, é necessário conceder permissão.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Fechar'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                child: Text("Scan QR or Bar Code"),
              ),
            ),
            TextButton(onPressed: (){
              
              Share.share(scanresult, subject: 'Welcome Message');
            },
             child: const Text('enviar')),
            TextButton(
              onPressed: () async {
                String _url = scanresult;
                Uri url = Uri.parse(_url); 
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $_url');
                }
              },
              child: Text('Abrir'),
            )
          ],
        ),
      ),
    );
  }
}
