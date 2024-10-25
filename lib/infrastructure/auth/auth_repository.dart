import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cubit_bloc/domain/auth/model/login_request_model.dart';
import 'package:flutter_cubit_bloc/domain/auth/model/login_response_model.dart';

class AuthRepository {
  Dio _dio = Dio();

  Future<Either<String, LoginResponseModel>> signInUserWithEmailAndPassword(
      {LoginRequestModel? loginRequestModel}) async {
    Response response;
    try {
      response = await _dio.post("https://reqres.in/api/login",
          data: loginRequestModel!.toJson());

      LoginResponseModel loginResp = LoginResponseModel.fromJson(response.data);

      return right(loginResp);
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
