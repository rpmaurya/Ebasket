import 'dart:convert';

import 'package:bbd_frontend/utils/end_point.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class HttpService<T> {
  Dio? _http;
  String? baseURL;
  final String? endURL;
  final HttpMethodType? methodType;
  Map<String, dynamic>? queryParameters;

  final HttpBodyType? bodyType;
  Map<String, dynamic>? body;
  Map<String, String>? headers;
  int? responseStatusCode;
  bool isAuthorizeRequest;

  HttpService({
    this.baseURL,
    this.endURL,
    this.methodType,
    this.queryParameters,
    this.body,
    this.bodyType = HttpBodyType.JSON,
    this.headers,
    this.isAuthorizeRequest = true,
  }) {
    if (this.baseURL == null) {
      this.baseURL = EndPoints.baseUrl;
    }
    _http = Dio();
  }

  authorizeRequest() {
    if (this.headers == null) {
      this.headers = <String, String>{};
    }
    this.headers!.addAll({"token": "tokenvvbhgv"});
  }

/////for request////
  Future<Response<T>>? request<T>() {
    dynamic bodyData;
    if (isAuthorizeRequest) {
      authorizeRequest();
    }
    if (this.headers == null) {
      this.headers = <String, String>{};
    }
    // Body Type check

    switch (this.bodyType) {
      case HttpBodyType.FormData:
        this.headers?.addAll({
          'Content-Type': 'application/x-www-form-urlencoded',
        });
        bodyData = this.body != null ? FormData.fromMap(this.body!) : null;
        break;
      case HttpBodyType.JSON:
        this.headers?.addAll({
          'Content-Type': 'application/json',
        });
        bodyData = this.body != null ? jsonEncode(this.body) : null;
        break;
      case HttpBodyType.XML:
        bodyData = this.body!["data"];
        break;
      default:
        bodyData = this.body;
        break;
    }

    // Method Type check

    switch (this.methodType) {
      case HttpMethodType.GET:
        return _http!.get<T>(
          this.baseURL! + this.endURL!,
          queryParameters: this.queryParameters,
          options: Options(
            headers: this.headers,
            validateStatus: (status) {
              this.responseStatusCode = status!;
              return status < 300;
            },
            receiveDataWhenStatusError: true,
          ),
        );

      case HttpMethodType.POST:
        return _http!.post<T>(
          this.baseURL! + this.endURL!,
          queryParameters: this.queryParameters,
          data: bodyData,
          options: Options(
            headers: this.headers,
            contentType: this.headers?["Content-Type"],
            validateStatus: (status) {
              this.responseStatusCode = status!;
              return status < 300;
            },
            receiveDataWhenStatusError: true,
          ),
        );
      case HttpMethodType.PUT:
        return _http!.put<T>(
          this.baseURL! + this.endURL!,
          queryParameters: this.queryParameters,
          data: bodyData,
          options: Options(
            headers: this.headers,
            validateStatus: (status) {
              this.responseStatusCode = status!;
              return status < 300;
            },
            receiveDataWhenStatusError: true,
          ),
        );
      case HttpMethodType.PATCH:
        return _http!.patch<T>(
          this.baseURL! + this.endURL!,
          queryParameters: this.queryParameters,
          data: bodyData,
          options: Options(
            headers: this.headers,
            validateStatus: (status) {
              this.responseStatusCode = status!;
              return status < 300;
            },
            receiveDataWhenStatusError: true,
          ),
        );
      case HttpMethodType.DELETE:
        return _http!.delete<T>(
          this.baseURL! + this.endURL!,
          queryParameters: this.queryParameters,
          data: bodyData,
          options: Options(
            headers: this.headers,
            validateStatus: (status) {
              this.responseStatusCode = status!;
              return status < 300;
            },
            receiveDataWhenStatusError: true,
          ),
        );
      default:
        return null;
    }
  }

  handleErrorResponse({
    BuildContext? context,
    dynamic error,
    bool tryParse = true,
    Function? postHandleError,
    bool isLogin = false,
  }) {
    String? message;
    if (error != null && tryParse) {
      try {
        message =
            '${error.response?.data["message"] ?? error.response?.data["errors"][0]["msg"]}';
      } catch (error) {
        message = null;
      }
    }
    switch (this.responseStatusCode) {
      case 200:
        "";
        return;
      case 400:
        // bad request
        "";
        if (message != null) {
          "";
          break;
        } else {
          "";
        }
        break;
      case 401:
        // unauthorize
        if (!isLogin) {
          "";
          return;
        } else {
          "";
        }
        break;
      case 404:
        // Forbidden
        if (message != null) {
          break;
        }
        break;
      case 500:
        // internal server error
        if (message != null) {
          break;
        }
        break;
      default:
        if (message != null) {
          break;
        }
        break;
    }
    if (postHandleError != null) {
      postHandleError();
    }
  }
}

enum HttpMethodType { GET, POST, PUT, PATCH, DELETE }

enum HttpBodyType { FormData, JSON, XML }
