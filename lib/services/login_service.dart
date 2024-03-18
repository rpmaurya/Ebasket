import 'package:bbd_frontend/controllers/otp_controller.dart';
import 'package:bbd_frontend/models/login_model.dart';
import 'package:bbd_frontend/screens/login_screen/otp_verify_screen.dart';
import 'package:bbd_frontend/services/http_services.dart';
import 'package:bbd_frontend/utils/end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginService {
  OtpController controller = OtpController();
  LoginModel? loginModel;
  // String? senddata;
  Future<void> login(
      {required Map<String, dynamic> body,
      required BuildContext context,
      required Function setState}) async {
    var http = HttpService(
        baseURL: EndPoints.baseUrl,
        endURL: EndPoints.loginByMobEndUrl,
        methodType: HttpMethodType.POST,
        bodyType: HttpBodyType.JSON,
        body: body);
    try {
      Response<dynamic>? response = await http.request<dynamic>();
      print({'response..': response?.data});
      LoginModel resp = LoginModel.fromJson(response?.data);
      loginModel = resp;
      if (loginModel?.status?.httpCode == '200') {
        // controller.mobile = loginModel?.data;
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
                builder: (BuildContext context) => OtpVerifyScreen(
                      resp: loginModel,
                      subtitle: ' ${resp.status?.message}',
                    )));
      } else {
        print({'Error_message': resp.status?.message});
      }
    } on DioException catch (error) {
      LoginModel err = LoginModel.fromJson(error.response?.data);
      if (err.status?.httpCode == '400') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              width: MediaQuery.of(context).size.width * 0.8,
              backgroundColor: Colors.red,
              content: Text(
                ' ${err.status?.message}',
                style: TextStyle(color: Colors.white),
              )),
        );
      }
      http.handleErrorResponse(error: "ressffgvv");
      print({'errror': error});
    }
  }

  ///login by email
  Future<void> loginbyEmail(
      {required Map<String, dynamic> body,
      required BuildContext context,
      required Function setState}) async {
    var http = HttpService(
        baseURL: EndPoints.baseUrl,
        endURL: EndPoints.loginByEmailEndUrl,
        methodType: HttpMethodType.POST,
        bodyType: HttpBodyType.JSON,
        body: body);
    try {
      Response<dynamic>? response = await http.request<dynamic>();
      print({'response..': response?.data});
      LoginModel resp = LoginModel.fromJson(response?.data);
      loginModel = resp;
      if (loginModel?.status?.httpCode == '200') {
        // controller.mobile = loginModel?.data;
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
                builder: (BuildContext context) => OtpVerifyScreen(
                      resp: loginModel,
                      subtitle: ' ${resp.status?.message}',
                    )));
      } else {
        print({'Error_message': resp.status?.message});
      }
    } on DioException catch (error) {
      LoginModel err = LoginModel.fromJson(error.response?.data);
      if (err.status?.httpCode == '400') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              width: MediaQuery.of(context).size.width * 0.8,
              backgroundColor: Colors.red,
              content: Text(
                ' ${err.status?.message}',
                style: TextStyle(color: Colors.white),
              )),
        );
      }
      http.handleErrorResponse(error: "ressffgvv");
      print({'errror': error});
    }
  }
}
