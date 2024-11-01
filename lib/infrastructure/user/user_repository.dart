import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cubit_bloc/domain/core/user/model/user_req_res.dart';

import '../../domain/core/user/user_data2.dart';

class UserRepository {
  Dio _dio = Dio();

  Future<Either<String, UserData2>> createNewUser(
      RequestData requestData) async {
    Response response;
    try {
      response = await _dio.post("https://reqres.in/api/users",
          data: (requestData.toJson()));

      final _result = response.data;


      return right(UserData2.fromJson(_result));
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
