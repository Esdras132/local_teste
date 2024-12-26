import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:local_test/splash.dart';
import 'package:local_test/test/DrawerNavigation.dart';
import 'package:local_test/test/RefreshIndicator.dart';
import 'package:local_test/test/animated_text_kit.dart';
import 'package:local_test/test/awesome_dialog.dart';
import 'package:local_test/test/calendario_text.dart';
import 'package:local_test/test/carousel_slider.dart';
import 'package:local_test/test/excel.dart';
import 'package:local_test/test/images/cached_network_image.dart';
import 'package:local_test/test/calendario.dart';
import 'package:local_test/test/camera.dart';
import 'package:local_test/test/cep.dart';
import 'package:local_test/test/conexao/conectado.dart';
import 'package:local_test/test/data.dart';
import 'package:local_test/test/images/photo_view.dart';
import 'package:local_test/test/infroma.dart';
import 'package:local_test/test/menu.dart';
import 'package:local_test/test/pdf.dart';
import 'package:local_test/test/saida.dart';
import 'package:local_test/test/sombra.dart';
import 'package:local_test/test/notifica%C3%A7%C3%A3o.dart';
import 'package:local_test/test/treispontos.dart';
import 'package:local_test/test/qrcode.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:local_test/test/webview.dart';
import 'test/conexao/conexao.dart';
import 'test/login_api.dart';
import 'test/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('pt_BR', null);


  AwesomeNotifications().initialize(
    null, 
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      ),
    ],
  );

  AwesomeNotifications().setListeners(
    onActionReceivedMethod: (receivedNotification) async {
      MyApp.navigatorKey.currentState?.pushNamed('/teste-page');
    },
  );

/*   // Mostrar a Splash Screen
  Future.microtask(() => runApp(const Splash_Screen()));

  // Aguardar 2 segundos antes de mostrar o app
  await Future.delayed(const Duration(seconds: 2));

  // Fechar a Splash Screen e mostrar o app */
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Teste',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: {
        '/teste-page': (context) => const test(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _createNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Hello!',
        body: 'This is a simple notification.',
        actionType: ActionType.Default,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Local teste'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FooterPage(),
                        ),
                      );
                    },
                    child: const Text('menu')),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Drawer_Navigation(),
                        ),
                      );
                    },
                    child: const Text('teste Drawer Navigation')),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => tresp(),
                        ),
                      );
                    },
                    child: const Text('teste tres pontos')),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CamScanner(),
                        ),
                      );
                    },
                    child: const Text('teste CamScanner')),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Saida(),
                      ),
                    );
                  },
                  child: const Text('teste perguntar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Camera(),
                      ),
                    );
                  },
                  child: const Text('teste camera'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sombra(),
                      ),
                    );
                  },
                  child: const Text('Sombra'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Infor(),
                      ),
                    );
                  },
                  child: const Text('Informaçoes do apk'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Conectado(),
                      ),
                    );
                  },
                  child: const Text('Conectado'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => awesome_dialog(),
                      ),
                    );
                  },
                  child: const Text('caixa de dialogo'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Calendario(),
                      ),
                    );
                  },
                  child: const Text('calendario'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Data(),
                      ),
                    );
                  },
                  child: const Text('colocar mes e dia'),
                ),
                ElevatedButton(
                  onPressed: _createNotification,
                  child: const Text('Show Notification'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebViewExample(),
                      ),
                    );
                  },
                  child: const Text('web view'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginApi(),
                      ),
                    );
                  },
                  child: const Text('login api'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SharedPreferencesDemo(),
                      ),
                    );
                  },
                  child: const Text('Shared Preferences'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CepApi(),
                      ),
                    );
                  },
                  child: const Text('cep'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfOnline(
                          link:
                              'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                        ),
                      ),
                    );
                  },
                  child: const Text('pdf'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Infor(),
                      ),
                    );
                  },
                  child: const Text('Informaçoes do apk'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RefreshIndicatorr(),
                      ),
                    );
                  },
                  child: const Text('RefreshIndicator'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => cached_network_image(),
                      ),
                    );
                  },
                  child: const Text('cached_network_image'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const flutter_image(),
                      ),
                    );
                  },
                  child: const Text('imagem boa'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => animated_text(),
                      ),
                    );
                  },
                  child: const Text('animated_text_kit'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarouselDemo(),
                      ),
                    );
                  },
                  child: const Text('CarouselDemo'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Conexao(),
                      ),
                    );
                  },
                  child: const Text('conexao'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalendarioText(),
                      ),
                    );
                  },
                  child: const Text('DateFormFieldExample'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExcelExemplo(),
                      ),
                    );
                  },
                  child: const Text('ExcelExemplo'),
                ), /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */ /* TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  CarouselDemo(),
                  ),
                );
              },
              child: const Text('CarouselDemo'),
            ), */
              ],
            ),
          ),
        ));
  }
}
