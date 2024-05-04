import 'package:flutter/material.dart';
import 'package:tamorqa_app/pages/splash.dart';

import 'pages/login_screen/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String accessToken = await getAccessToken();
  final String refreshToken = await getRefreshToken();

  runApp(
    MyApp(
      accessToken: accessToken,
      refreshToken: refreshToken,
    ),
  );
}

String aToken = '';
String rToken = '';

class MyApp extends StatelessWidget {
  final String accessToken;
  final String refreshToken;

  const MyApp({
    super.key,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: accessToken.isNotEmpty ? const Splash() : const LoginPage(),
    );
  }
}

//1cd53781-1e54-4000-8da8-1753f9bd9c9a
