import 'package:bbd_frontend/models/user-model.dart';
import 'package:bbd_frontend/screens/bottom_bar_screen/account_screen.dart';
import 'package:bbd_frontend/screens/login_screen/otp_verify_screen.dart';
import 'package:bbd_frontend/screens/user_sides_screen/my_account_sceens/otpverification_by_editProfile.dart';
import 'package:bbd_frontend/services/http_services.dart';
import 'package:bbd_frontend/utils/end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserService {
  UserModel? userModel;
  Future getUser(
      {required Map<String, dynamic> query,
      required BuildContext context,
      required setState}) async {
    var http = HttpService(
        baseURL: EndPoints.baseUrl,
        endURL: EndPoints.getUserEndUrl,
        methodType: HttpMethodType.GET,
        bodyType: HttpBodyType.JSON,
        queryParameters: query);
    try {
      print({'userid': query});
      Response<dynamic>? response = await http.request<dynamic>();
      UserModel respo = UserModel.fromJson(response?.data);
      return respo;
    } catch (e) {
      print({'error': e});
    }
  }

  Future<void> editProfileByID(
      {required Map<String, dynamic> body,
      required BuildContext context,
      required query,
      required setState}) async {
    var http = HttpService(
      baseURL: EndPoints.baseUrl,
      endURL: '${EndPoints.editUserEndUrl}$query',
      methodType: HttpMethodType.PUT,
      bodyType: HttpBodyType.JSON,
      // queryParameters: query,
      body: body,
    );
    try {
      Response<dynamic>? response = await http.request<dynamic>();
      print({'response..': response?.data});
      UserModel resp = UserModel.fromJson(response?.data);

      userModel = resp;
      if (userModel?.status?.httpCode == '200') {
        print({'profile change...': userModel?.data?.email});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Colors.green[700],
              content: Text(
                ' ${resp.status?.message}',
                style: TextStyle(color: Colors.white),
              )),
        );
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpVerifyByProfileScreen(
                      editResp: userModel,
                    )));
      }
    } catch (e) {
      print({'error': e});
      http.handleErrorResponse(error: "ressffgvv");
    }
  }
}
