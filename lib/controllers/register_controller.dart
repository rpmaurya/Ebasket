import 'package:bbd_frontend/services/register_service.dart';
import 'package:flutter/material.dart';

class RegisterController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  RegisterService service = RegisterService();
  Future<void> signup({
    required BuildContext context,
    required Function setState,
  }) async {
    // setState(() {});
    Map<String, dynamic> body = {
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "email": emailController.text,
      "mobileNo": phoneController.text,
      "countryCode": "91"
    };
    print({'body': body});
    try {
      await service.register(body: body, context: context, setState: setState);
    } catch (e) {
      print({'error': e});
    }
  }
}
