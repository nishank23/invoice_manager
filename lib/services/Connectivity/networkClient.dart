// ignore_for_file: constant_identifier_names, prefer_collection_literals, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';

import '../../../app/routes/app_pages.dart';
import '../../../main.dart';
import '../../app/global/constants/app_color.dart';
import '../../app/global/constants/constants.dart';
import '../../app/global/widgets/custom_dialog.dart';

class MethodType {
  static const String Post = "POST";
  static const String Get = "GET";
  static const String Put = "PUT";
  static const String Delete = "DELETE";
  static const String Patch = "PATCH";
}

class NetworkClient {
  static NetworkClient? _shared;

  NetworkClient._();

  static NetworkClient get getInstance =>
      _shared = _shared ?? NetworkClient._();

  final dio = Dio();
  GetStorage box = GetStorage();

  Map<String, dynamic> getAuthHeaders({String? tokenRegister}) {
    Map<String, dynamic> authHeaders = Map<String, dynamic>();
    String token = "";
    if (box.read(Constant.tokenKey) != null) {
      token = box.read(Constant.tokenKey);

      dio.options.headers["Authorization"] = "Bearer " + token;
    } else {
      dio.options.headers["Authorization"] = "Bearer " + token;
    }

    return authHeaders;
  }

  Map<String, dynamic> getAuthHeadersForVerify(String token) {
    Map<String, dynamic> authHeaders = Map<String, dynamic>();
    GetStorage box = GetStorage();
    String token = "";
    if (box.read(Constant.tokenKey) != null) {
      token = box.read(Constant.tokenKey);
      print(token);
      // token =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZSI6IkFkbWluIiwiaWF0IjoxNjUxNTAzNDExLCJleHAiOjE2NTE1ODk4MTF9.DkJhSf78gpX86gzruLiTs_PKSXl4Slj-XzELfztLa6k";
    }
    // } else {
    dio.options.headers["Authorization"] = "Bearer " + token;
    // } else {
    authHeaders["Content-Type"] = "application/json";
    // }

    return authHeaders;
  }

  Future callApi(
    BuildContext context,
    String baseUrl,
    String command,
    String method, {
    var params,
    Map<String, dynamic>? headers,
    Function(dynamic response, String message)? successCallback,
    Function(dynamic message, String statusCode)? failureCallback,
  }) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      failureCallback!("", "No Internet Connection");
      // getDialog(title: "Error", desc: "No Internet Connection.");
    }
    dio.options.validateStatus = (status) {
      return status! <= 505;
    };
    dio.options.connectTimeout = const Duration(seconds: 180); //5s
    dio.options.receiveTimeout = const Duration(seconds: 180);
    if (headers != null) {
      for (var key in headers.keys) {
        dio.options.headers[key] = headers[key];
      }
    }
    switch (method) {
      case MethodType.Post:
        Response response =
            await dio.post(baseUrl + command, data: jsonEncode(params));
        // ignore: use_build_context_synchronously
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;
      case MethodType.Patch:
        Response response = await dio.patch(baseUrl + command, data: params);
        // ignore: use_build_context_synchronously
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;
      case MethodType.Get:
        Response response =
            await dio.get(baseUrl + command, queryParameters: params);
        // ignore: use_build_context_synchronously
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;

      case MethodType.Put:
        Response response = await dio.put(baseUrl + command, data: params);
        // ignore: use_build_context_synchronously
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;

      case MethodType.Delete:
        Response response = await dio.delete(baseUrl + command, data: params);
        // ignore: use_build_context_synchronously
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;
      default:
    }
  }

  Future callApiForm(
    BuildContext context,
    String baseUrl,
    String command,
    String method, {
    var params,
    Map<String, dynamic>? headers,
    Function(dynamic response, String message)? successCallback,
    Function(dynamic message, String statusCode)? failureCallback,
  }) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      failureCallback!("", "No Internet Connection");
      // getDialog(title: "Error", desc: "No Internet Connection.");
    }
    dio.options.validateStatus = (status) {
      return status! <= 505;
    };
    dio.options.connectTimeout = const Duration(seconds: 60); //5s
    dio.options.receiveTimeout = const Duration(seconds: 60);
    if (headers != null) {
      for (var key in headers.keys) {
        dio.options.headers[key] = headers[key];
      }
    }
    switch (method) {
      case MethodType.Post:
        Response response = await dio.post(baseUrl + command, data: params);
        // ignore: use_build_context_synchronously
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;
      case MethodType.Patch:
        Response response = await dio.patch(baseUrl + command, data: params);
        // ignore: use_build_context_synchronously
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;
      case MethodType.Get:
        Response response =
            await dio.get(baseUrl + command, queryParameters: params);
        // ignore: use_build_context_synchronously
        log(response.toString());
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;

      case MethodType.Put:
        Response response = await dio.put(baseUrl + command, data: params);
        // ignore: use_build_context_synchronously
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;

      case MethodType.Delete:
        Response response = await dio.delete(baseUrl + command, data: params);
        // ignore: use_build_context_synchronously
        parseResponse(context, response,
            successCallback: successCallback!,
            failureCallback: failureCallback!);
        break;
      default:
    }
  }

  parseResponse(BuildContext context, Response response,
      {Function(dynamic response, String message)? successCallback,
      Function(dynamic statusCode, String message)? failureCallback}) {
    print(response.data.runtimeType);
    dynamic message = response.data is String
        ? "200"
        : response.data.containsKey('message')
            ? response.data['message']
            : "";

    if (response.statusCode == 401) {
      box.remove(Constant.tokenKey);
      Get.offAllNamed(Routes.LOGIN);
    } else if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 203) {
      if (response.data is Map<String, dynamic> ||
          response.data is List<dynamic> ||
          response.data is List<Map<String, dynamic>> ||
          response.data is dynamic) {
        successCallback!(response.data, message);
        return;
      }
    } else if (response.statusCode == 400) {
      String myerror = response.data['error'];

      failureCallback!(response.data, myerror);
      return;
    } else {
      failureCallback!(response.data, response.statusMessage.toString());
      return;
    }
  }

  void hideDialog(bool isProgress, BuildContext context) {
    if (isProgress) {
      app.resolve<CustomDialogs>().hideCircularDialog(context);
    }
  }

  getDialog(
      {String title = "Error", String desc = "Some Thing went wrong...."}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        title: title,
        content: Text(desc),
        buttonColor: AppColor.secondaryBlue,
        textConfirm: "Ok",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        });
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}
