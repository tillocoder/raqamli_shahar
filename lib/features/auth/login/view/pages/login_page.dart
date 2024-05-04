import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamorqa_app/core/languages/app_words.dart';
import 'package:tamorqa_app/core/services/auth/login_ser.dart';
import 'package:tamorqa_app/core/widgets/language_button.dart';
import 'package:tamorqa_app/features/auth/login/controller/login_ctr.dart';
import 'package:tamorqa_app/features/auth/login/view/widgets/c_text_field.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(loginController);
    var ctr = ref.read(loginController);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          LanguageButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Form(
            key: ctr.formKey,
            child: Column(
              children: [
                const SizedBox(height: 70),
                Image.asset(
                  'assets/images/herb1.png',
                  height: 100,
                ),
                const SizedBox(height: 20),
                Text(Words.digital.tr(context)),
                const SizedBox(height: 70),
                CTextField(
                    ctr: ctr.loginCtr,
                    hintString: 'Login',
                    inputTypes: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your login";
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(height: 20),
                CTextField(
                    ctr: ctr.passwordCtr,
                    hintString: 'Password',
                    inputTypes: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else {
                        return null;
                      }
                    }),
              ],
            ),
          ),
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
            onPressed: () async {
              bool result = ctr.formKey.currentState!.validate();
              if (result) {
                await AuthLoginService.getToken(
                    {"username": ctr.loginCtr.text, "password": ctr.passwordCtr.text}, context);
                // ignore: use_build_context_synchronously
              }
            },
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
