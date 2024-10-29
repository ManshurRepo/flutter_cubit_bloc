import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cubit_bloc/domain/auth/model/login_request_model.dart';
import 'package:flutter_cubit_bloc/domain/auth/model/login_response_model.dart';
import 'package:flutter_cubit_bloc/domain/core/user/model/user_response.dart';

class ProfileRepository {
  Dio _dio = Dio();

  Future<Either<String, UserResponse>> getAllUserData(
      ) async {
    Response response;
    try {
      response = await _dio.get("https://reqres.in/api/users?page=2",
          );

      UserResponse _userResponse = UserResponse.fromJson(response.data);

      return right(_userResponse);
    } on DioException catch (e) {
      print(e.response?.statusCode);
      String errorMessage =
          e.response?.data?.toString() ?? "Unknown error occurred";

      // if (e.type == DioExceptionType.badResponse) {
      //    errorMessage = e.response?.data["error"];
      // }

      switch (e.type) {
        case DioExceptionType.badResponse:
          errorMessage = e.response?.data["error"];
          break;

        case DioExceptionType.connectionTimeout:
          break;
        case DioExceptionType.badCertificate:
          break;
        case DioExceptionType.connectionError:
          break;
        case DioExceptionType.receiveTimeout:
          break;
        case DioExceptionType.sendTimeout:
          break;
        case DioExceptionType.cancel:
          break;
        case DioExceptionType.unknown:
          break;
      }

      return left(errorMessage);
    }
  }
}
