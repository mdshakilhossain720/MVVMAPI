import 'package:dio/dio.dart';
import 'package:mvvmapi/model/common/signup_creadntail.dart';

abstract class Auth{
  Future <Response> login({required String contract, required String password});


  Future<Response> signup({ required SignupCreadntail signupCreadntail});
}