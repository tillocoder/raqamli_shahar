import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamorqa_app/pages/home_screen/home_page.dart';
import 'package:tamorqa_app/pages/login_screen/widgets/c_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Future<String> getAccessToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('access_token') ?? '';
}

Future<String> getRefreshToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('refresh_token') ?? '';
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginCtr = TextEditingController();
  final TextEditingController passwordCtr = TextEditingController();

  Dio dio = Dio();

  Future<void> login() async {
    String username = loginCtr.text;
    String password = passwordCtr.text;

    try {
      Response response = await dio.post(
        'http://mahalla.ijro-app.uz/api/token/',
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        // Save tokens to shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', response.data['access']);
        await prefs.setString('refresh_token', response.data['refresh']);
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (ctx) => const HomePage(),
          ),
        );
      } else {
        // ignore: use_build_context_synchronousl
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed: Incorrect username or password'),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while logging in'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Image.asset(
              'assets/images/herb1.png',
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text('Raqamli Maxalla Portali'),
            const SizedBox(height: 70),
            CTextField(
              ctr: loginCtr,
              hintString: 'Login',
              inputTypes: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CTextField(
              ctr: passwordCtr,
              hintString: 'Password',
              inputTypes: TextInputType.text,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              backgroundColor: Colors.indigoAccent,
            ),
            onPressed: login,
            child: const Text(
              'Kirish',
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
