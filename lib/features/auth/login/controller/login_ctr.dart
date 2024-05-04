import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginController = ChangeNotifierProvider((ref) => LoginController());

class LoginController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController loginCtr = TextEditingController();
  final TextEditingController passwordCtr = TextEditingController();
}
