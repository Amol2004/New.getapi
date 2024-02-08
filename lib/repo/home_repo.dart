

import 'package:dartz/dartz.dart';
import 'package:getapp/model/home_model.dart';
import 'package:getapp/repo/api_expation.dart';
import 'package:getapp/repo/api_faliur.dart';
import 'package:getapp/repo/api_manager.dart';

class HomeRepo {
  final ApiManager apiManager = ApiManager();

  Future<Either<Failure, HomeModel?>> getData() async {

    try {
      var response = await apiManager.get("https://reqres.in/api/users?page=2");

      var json = HomeModel.fromJson(response);
      return right(json);
    
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }
}