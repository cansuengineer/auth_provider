import 'package:auth_provider/screens/login_screen.dart';
import 'package:auth_provider/screens/profile_screen.dart';
import 'package:auth_provider/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/user_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<Auth>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? const LoginScreen() : const ProfileScreen();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
