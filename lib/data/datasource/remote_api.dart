import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/navigation_service.dart';

class RemoteApi {
  static Map<String, dynamic> header = {
    "Content-Type": "application/json",
    // "x-api-key": '',
    // "User-Agent": '',
  };

  static final Dio _dio = Dio();

  static Future<Response> getRequest({required String path}) async {
    try {
      final response = await _dio.get(
        path,
        options: Options(headers: header),
      );
      print(response.data);
      return response;
    } on DioException catch (e) {
      // Handle DioError here
      if (e.type == DioExceptionType.connectionError) {
        _showDialog(
          message: "No internet connection. Please check your connection and try again.",
          onEnter: () => Navigator.pop(NavigationService.currentContext!),
        );
      } else if (e.response?.statusCode == 401) {
        _showDialog(
          message: "Your session has expired. Please log in again to continue.",
          onEnter: () {
            // Handle re-login logic here
          },
        );
      } else if (e.response?.statusCode == 502) {
        _showDialog(
          message: "Connection failed. Please verify your internet connection and retry.",
          onEnter: () => Navigator.pop(NavigationService.currentContext!),
        );
      } else {
        _showDialog(
          message: "An error occurred: ${e.message}",
          onEnter: () => Navigator.pop(NavigationService.currentContext!),
        );
      }
      rethrow;
    }
  }

  static void _showDialog({required String message, required VoidCallback onEnter}) {
    showDialog(
      context: NavigationService.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: onEnter,
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
