import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';

import '../../application.dart';
import '../../config/const/api_path.dart';
import '../local_storage/local_storage_service.dart';


class RestApiService {
  static RestApiService? _instance;
  static BaseOptions? options;
  static Dio? dio;

  RestApiService._internal();

  static String access_token = "";

  static Future<RestApiService?> getInstance() async {
    if (_instance == null) {
      _instance = RestApiService._internal();
    }
    if (Application.storageService == null)
      Application.storageService = await LocalStorageService.getInstance();

    Application.storageService!
        .getDataFromDisk("token")
        .then((value) => access_token = value);

    if (options == null) {
      options = BaseOptions(
          baseUrl: baseUrl,
          responseType: ResponseType.json,
          connectTimeout: 60000,
          receiveTimeout: 60000,
          validateStatus: (code) {
            if (code! >= 200) {
              return true;
            } else {
              return false;
            }
          });

      if (dio == null) {
        dio = Dio(options);
      }
    }
    return _instance;
  }

  // getApiCall(String path) async {
  //   await Application.storageService!
  //       .getDataFromDisk("token")
  //       .then((value) => access_token = value);
  //   try {
  //     Options options = Options(
  //       contentType: 'application/json',
  //       headers: {
  //         "Authorization": "Bearer " + access_token,
  //       },
  //     );
  //
  //     var response = await dio!.post(path, options: options);
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return ApiResponse.completed(response.data);
  //     } else if (response.statusCode == 429) {
  //       return ApiResponse.error(
  //           "Error while communicating with server. Please try again after some time.");
  //       print("Error: " +
  //           'Error while communicating with server. Please try again after some time.');
  //     } else {
  //       return ApiResponse.error(
  //           "Something went wrong. Please Retry After Some time");
  //       print("Error: " + response.statusCode.toString());
  //     }
  //   } on DioError catch (exception) {
  //     if (exception == null ||
  //         exception.toString().contains('SocketException')) {
  //       return ApiResponse.error("Network Error!!");
  //       print("Error: " + "Network Error");
  //     } else if (exception.type == DioErrorType.receiveTimeout ||
  //         exception.type == DioErrorType.connectTimeout) {
  //       return ApiResponse.error(
  //           "CONNECT_TIMEOUT Please Retry After Some time");
  //       print("Error: " +
  //           "Could'nt connect, please ensure you have a stable network.");
  //     } else {
  //       return ApiResponse.error(
  //           "Something went wrong. Please Retry After Some time");
  //     }
  //   }
  // }

  getApiCall(String path) async {
    await Application.storageService!
        .getDataFromDisk("token")
        .then((value) => access_token = value);
    try {
      Options options = Options(
        // contentType: 'application/json',
        headers: {
          "Content-Type": 'application/json',
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InByYWthc2hAaXZvbHdlLmNvbSIsImlkIjoiNjI0ODIyMmM0NzlkZDQ2YTE5ZTM5ODE2IiwiaWF0IjoxNjU3OTU2MTA4LCJleHAiOjE2NTgwNDI1MDh9.2a5pKBcZOmOi56FroYomV-TxinECRN_HQeYBNwsx_Zk",
        },
      );
      var response = await dio!.get(path,options: options);
      //var response = await dio.post(path, options: options, data: json);
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.completed(jsonDecode(response.data));
      } else if (response.statusCode == 429) {
        return ApiResponse.error(
            "Error while communicating with server. Please try again after some time.");
        print("Error: " +
            'Error while communicating with server. Please try again after some time.');
      } else {
        return ApiResponse.error(
            "Something went wrong. Please Retry After Some time");
        print("Error: " + response.statusCode.toString());
      }
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        return ApiResponse.error("Network Error!!");
        print("Error: " + "Network Error");
      } else if (exception.type == DioErrorType.receiveTimeout ||
          exception.type == DioErrorType.connectTimeout) {
        return ApiResponse.error(
            "CONNECT_TIMEOUT Please Retry After Some time");
        print("Error: " +
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return ApiResponse.error(
            "Something went wrong. Please Retry After Some time");
      }
    }
  }
  getApiCallwithdata(String path, var json) async {
    await Application.storageService!
        .getDataFromDisk("token")
        .then((value) => access_token = value);
    try {
      Options options = Options(
        contentType: 'application/json',
        headers: {
          "Authorization": "Bearer " + access_token,
        },
      );
      var response = await dio!.post(path, data:  FormData.fromMap(json));
      //var response = await dio.post(path, options: options, data: json);
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.completed(jsonDecode(response.data));
      } else if (response.statusCode == 429) {
        return ApiResponse.error(
            "Error while communicating with server. Please try again after some time.");
        print("Error: " +
            'Error while communicating with server. Please try again after some time.');
      } else {
        return ApiResponse.error(
            "Something went wrong. Please Retry After Some time");
        print("Error: " + response.statusCode.toString());
      }
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        return ApiResponse.error("Network Error!!");
        print("Error: " + "Network Error");
      } else if (exception.type == DioErrorType.receiveTimeout ||
          exception.type == DioErrorType.connectTimeout) {
        return ApiResponse.error(
            "CONNECT_TIMEOUT Please Retry After Some time");
        print("Error: " +
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return ApiResponse.error(
            "Something went wrong. Please Retry After Some time");
      }
    }
  }

  Future<dynamic> postData(String path, var jdata) async {

  /*  await Application.storageService
        .getDataFromDisk("token")
        .then((value) => access_token = value ?? "");

    print("postapi token " + access_token);*/
    try {
  /*    Options options = Options(
        contentType: 'application/json',
        headers: {
          "Authorization": "Bearer " + access_token,
        },
      );*/

     // var response = await dio.post(path, options: options, data: jdata);

       var response = await dio!.post(path, data:  FormData.fromMap(jdata));
      //  print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        // var responseJson = json.decode(response.data);
        // print(responseJson);
        return response.data;
      } else if (response.statusCode == 429) {
        print("Error: " +
            'Error while communicating with server. Please try again after some time.');
      } else {
        print("Error: " + response.statusCode.toString());
      }
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        print("Error: " + "Network Error");
      } else if (exception.type == DioErrorType.receiveTimeout ||
          exception.type == DioErrorType.connectTimeout) {
        print("Error: " +
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return null;
      }
    }
  }

  Future<dynamic> uploadImage(File file) async {
    try {
      Options options = Options(
          //contentType: 'application/json'
          // headers: {"Authorization": access_token,
          //},

          );
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });

      var response =
          await dio!.post("uploadImages", options: options, data: formData);
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        // var responseJson = json.decode(response.data);
        // print(responseJson);
        return response.data;
      } else if (response.statusCode == 429) {
        print("Error: " +
            'Error while communicating with server. Please try again after some time.');
      } else {
        print("Error: " + response.statusCode.toString());
      }
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        print("Error: " + "Network Error");
      } else if (exception.type == DioErrorType.receiveTimeout ||
          exception.type == DioErrorType.connectTimeout) {
        print("Error: " +
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return null;
      }
    }
  }

  Future<dynamic> uploadFile(String url, File file) async {
    await Application.storageService!
        .getDataFromDisk("token")
        .then((value) => access_token = value);
    try {
      Options options = Options(
        //contentType: 'application/json'
        headers: {
          "Authorization": access_token,
        },
      );
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });

      var response = await dio!.post(url, options: options, data: formData);
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        // var responseJson = json.decode(response.data);
        // print(responseJson);
        return response.data;
      } else if (response.statusCode == 429) {
        print("Error: " +
            'Error while communicating with server. Please try again after some time.');
      } else {
        print("Error: " + response.statusCode.toString());
      }
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        print("Error: " + "Network Error");
      } else if (exception.type == DioErrorType.receiveTimeout ||
          exception.type == DioErrorType.connectTimeout) {
        print("Error: " +
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return null;
      }
    }
  }

  Future<dynamic> uploadMultiFile(String url, List<File> filelist) async {
    await Application.storageService!
        .getDataFromDisk("token")
        .then((value) => access_token = value);
    try {
      Options options = Options(
        //contentType: 'application/json'
        headers: {
          "Authorization": access_token,
        },
      );

      var formData = FormData();
      for (var file in filelist) {
        formData.files.addAll([
          MapEntry("files", await MultipartFile.fromFile(file.path)),
        ]);
      }

      // String fileName = file.path.split('/').last;
      // FormData formData = FormData.fromMap({
      //   "file": await MultipartFile.fromFile(file.path, filename: fileName),
      // });

      var response = await dio!.post(url, options: options, data: formData);
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        // var responseJson = json.decode(response.data);
        // print(responseJson);
        return response.data;
      } else if (response.statusCode == 429) {
        print("Error: " +
            'Error while communicating with server. Please try again after some time.');
      } else {
        print("Error: " + response.statusCode.toString());
      }
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        print("Error: " + "Network Error");
      } else if (exception.type == DioErrorType.receiveTimeout ||
          exception.type == DioErrorType.connectTimeout) {
        print("Error: " +
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return null;
      }
    }
  }

  showNetworkErrorSnackbar(){
    getx.Get.snackbar("Seems like you are experiencing network Issue", "",snackPosition: getx.SnackPosition.BOTTOM,backgroundColor: Colors.red,colorText: Colors.white,
        padding: EdgeInsets.all(8),borderRadius: 5
    );
  }
}

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
