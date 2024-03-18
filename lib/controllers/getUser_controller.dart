// import 'package:bbd_frontend/models/user-model.dart';
// import 'package:bbd_frontend/services/user_service.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class UserController {
//   UserModel? userModel;
//   UserService userService = UserService();
//   bool isLoding = false;
//   Future<void> getUser(
//       {required BuildContext context, required setState}) async {
//     try {
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       var getid = await pref.getInt('userId');

//       Map<String, dynamic> query = {"userId": getid};
//       print({'getid...': query});
//       await userService
//           .getUser(query: query, context: context, setState: setState)
//           .then((value) {
//         userModel.data = value;
//       });
//     } catch (e) {
//       print({"error,,": e});
//     }
//   }
// }
