import 'package:flutter/material.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_firebase/data/firebase/firebase_options.dart';

//configs
import 'package:flutter_application_firebase/data/cache/cache.dart' as cache;
import 'package:flutter_application_firebase/global/variables.dart' as global;

//pages
import 'package:flutter_application_firebase/pages/LoginPage.dart';
import 'package:flutter_application_firebase/pages/ProviderPage.dart';
import 'package:flutter_application_firebase/pages/SignPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: testLogin(),
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data == true){
          return const ProviderPage();
        }else if(snapshot.hasData && snapshot.data == false){
          return const LoginPage();
        }else{
          return Scaffold(
            body: Center(
              child: Container(
                height: 200,
                width: 200,
                color: global.colorTheme["color1"],
              ),
            )
          );
        }
      },
    );
  }

  Future<bool> testLogin() async {
    bool resp = await cache.getCacheUserAuth();
    if (resp == true) {
      return true;
    } else {
      return false;
    }
    //anterior;
    //global.user["auth"]? const ProviderPage() : const LoginPage()
  }

  pageTest() {
    //para testes fora do ambiente de preodução
    //no caso em local caso seja nescessario testar uma pagina em expecifico
    
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return const SignPage();
        },
      )
    );
  }
}
