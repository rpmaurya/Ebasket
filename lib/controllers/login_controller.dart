import 'package:bbd_frontend/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phone_form_field/phone_form_field.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  LoginService service = LoginService();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // var number;

  bool isLoding = false;
  Future<void> loginByMobile({
    required BuildContext context,
    required Function setState,
  }) async {
    setState(() {
      isLoding = true;
    });
    print({'phone Number...': phoneController.text});
    // print({'phone number........': number.toString()});
    Map<String, dynamic> body = {"mobile": phoneController.text};
    try {
      await service.login(body: body, context: context, setState: setState);
      setState(() {
        isLoding = false;
      });
    } catch (e) {
      print({'errror': e});
    }
  }

  Future<void> loginByEmail({
    required BuildContext context,
    required Function setState,
  }) async {
    setState(() {
      isLoding = false;
    });
    print({'email....': emailController.text});
    Map<String, dynamic> body = {"email": emailController.text};
    try {
      await service.loginbyEmail(
          body: body, context: context, setState: setState);
    } catch (e) {
      print({'errror': e});
    }
  }
}
