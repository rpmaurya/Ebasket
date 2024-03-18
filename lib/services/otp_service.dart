import 'package:bbd_frontend/models/otp_verify_model.dart';
import 'package:bbd_frontend/screens/bottom_bar_screen/bottom_bar_screen.dart';
import 'package:bbd_frontend/screens/bottom_bar_screen/user_dashboard.dart';
import 'package:bbd_frontend/services/http_services.dart';
import 'package:bbd_frontend/utils/end_point.dart';
import 'package:bbd_frontend/utils/sharepreferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpService {
  OtpVerifyModel? otpVerifyModel;
  Future<void> otpVerifyMob(
      {required Map<String, dynamic> body,
      required BuildContext context,
      required Function setState}) async {
    var http = HttpService(
        baseURL: EndPoints.baseUrl,
        endURL: EndPoints.otpVerifyByMobEndUrl,
        methodType: HttpMethodType.POST,
        bodyType: HttpBodyType.JSON,
        body: body);
    try {
      Response<dynamic>? response = await http.request<dynamic>();
      print({'response..': response?.data});
      OtpVerifyModel resp = OtpVerifyModel.fromJson(response?.data);
      otpVerifyModel = resp;
      if (otpVerifyModel?.status?.httpCode == '200') {
        SharepreferencClass().clearData();
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // pref.setString("token", otpVerifyModel?.data?.token ?? "");
        SharepreferencClass().saveUser(
            otpVerifyModel?.data?.token, otpVerifyModel?.data?.userId);
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
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => BottomBarScreen()));
      } else {
        print({'Error_message': resp.status?.message});
      }
    } on DioException catch (error) {
      OtpVerifyModel err = OtpVerifyModel.fromJson(error.response?.data);
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

  /// otp verifiy by email
  Future<void> otpVerifyEmail(
      {required Map<String, dynamic> body,
      required BuildContext context,
      required Function setState}) async {
    var http = HttpService(
        baseURL: EndPoints.baseUrl,
        endURL: EndPoints.otpVerifyByEmailEndUrl,
        methodType: HttpMethodType.POST,
        bodyType: HttpBodyType.JSON,
        body: body);
    try {
      Response<dynamic>? response = await http.request<dynamic>();
      print({'response..': response?.data});
      OtpVerifyModel resp = OtpVerifyModel.fromJson(response?.data);
      otpVerifyModel = resp;
      if (otpVerifyModel?.status?.httpCode == '200') {
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // pref.setString("token", otpVerifyModel?.data?.token ?? "");
        SharepreferencClass().saveUser(
            otpVerifyModel?.data?.token, otpVerifyModel?.data?.userId);
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
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomBarScreen()));
      } else {
        print({'Error_message': resp.status?.message});
      }
    } on DioException catch (error) {
      OtpVerifyModel err = OtpVerifyModel.fromJson(error.response?.data);
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
