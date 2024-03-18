import 'package:bbd_frontend/models/categoryList_Model.dart';
import 'package:bbd_frontend/services/http_services.dart';
import 'package:bbd_frontend/utils/end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DashboardService {
  CategoryListModel? categoryListModel;
  Future getCategoryList(
      {required Map<String, dynamic> query,
      required BuildContext context,
      required setState}) async {
    var http = HttpService(
        baseURL: EndPoints.baseUrl,
        endURL: EndPoints.getCategoryEndUrl,
        methodType: HttpMethodType.GET,
        bodyType: HttpBodyType.JSON,
        queryParameters: query);
    try {
      print({'userid': query});
      Response<dynamic>? response = await http.request<dynamic>();
      CategoryListModel respo = CategoryListModel.fromJson(response?.data);
      return respo;
    } on DioException catch (e) {
      CategoryListModel err = CategoryListModel.fromJson(e.response?.data);
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
      print({'error': e});
    }
  }
}
