import 'package:auth_provider/screens/login_screen.dart';
import 'package:auth_provider/services/auth.dart';
import 'package:auth_provider/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Auth>(
          create: (_) => Auth(),
          child: Provider<Storage>(
            create: (_) => Storage(),
          ),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Auth Example',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: const LoginScreen()),
    );
  }
}
