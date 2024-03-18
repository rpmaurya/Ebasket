import 'package:bbd_frontend/services/http_services.dart';
import 'package:bbd_frontend/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditController {
  UserService userService = UserService();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isLoding = false;
  Future<void> editProfile(
      {required BuildContext context, required setState}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var getid = await pref.getInt('userId');

    // Map<String, dynamic> query = {"userId": getid};
    // print({'getid...': query});
    Map<String, dynamic> body = {
      "firstName": firstName.text,
      "lastName": lastName.text,
      "email": email.text
    };
    try {
      setState(() {
        isLoding = true;
      });
      await userService.editProfileByID(
          body: body, context: context, query: getid, setState: setState);
      setState(() {
        isLoding = true;
      });
    } catch (e) {
      print({'error...': e});
    }
  }
}
