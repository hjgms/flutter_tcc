import 'package:flutter/material.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_firebase/data/firebase/firebase_options.dart';

//configs
import 'package:flutter_application_firebase/config/globalVariables.dart' as global;

//pages
import 'package:flutter_application_firebase/pages/loginPage.dart';
import 'package:flutter_application_firebase/pages/providerPage.dart';

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
      debugShowCheckedModeBanner: false,
      home: MyHomePage()
    );
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
    return global.user["auth"]? const ProviderPage() : const LoginPage();
  }
}
