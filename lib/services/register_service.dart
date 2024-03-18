import 'package:bbd_frontend/models/register_model.dart';
import 'package:bbd_frontend/screens/login_screen/login_screen.dart';
import 'package:bbd_frontend/services/http_services.dart';
import 'package:bbd_frontend/utils/end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterService {
  RegisterModel? registerModel;
  Future<void> register(
      {required Map<String, dynamic> body,
      required BuildContext context,
      required Function setState}) async {
    var http = HttpService(
        baseURL: EndPoints.baseUrl,
        endURL: EndPoints.signupEndUrl,
        methodType: HttpMethodType.POST,
        bodyType: HttpBodyType.JSON,
        body: body);
    try {
      Response<dynamic>? response = await http.request<dynamic>();
      print({'responce': response?.data});
      RegisterModel responce = RegisterModel.fromJson(response?.data);

      registerModel = responce;
      if (registerModel?.status?.httpCode == '200') {
        print({"responsedata": responce.data?.email});
        print({'response_message': responce.status?.message});

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Colors.green[700],
              content: Text(
                'Registration  ${responce.status?.message}',
                style: TextStyle(color: Colors.white),
              )),
        );
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginScreen()));
      } else {
        print({'Error_message': responce.status?.message});
      }
    } on DioException catch (error) {
      RegisterModel err = RegisterModel.fromJson(error.response?.data);
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
    }
  }
}
