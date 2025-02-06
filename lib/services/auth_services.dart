import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvmapi/config/app_constants.dart';
import 'package:mvvmapi/model/common/signup_creadntail.dart';
import 'package:mvvmapi/services/base/signup_base.dart';
import 'package:mvvmapi/utils/api_client.dart';

class AuthServices extends Auth {
  final Ref ref;
  AuthServices(this.ref);

  
 
  
  @override
  Future<Response> signup({required SignupCreadntail signupCreadntail}) async {
     final response = await ref
        .read(apiClientProvider)
        .post(AppConstants.register, data: signupCreadntail.toMap());
    return response;
    
  }
  
  @override
  Future<Response> login({required String contract, required String password}) async {
    final response=await ref.read(apiClientProvider).post(AppConstants.login, 
    data: {
      contract.contains('@')? 'email': 'phone': contract,
      
      'password': password
    });
    return response;
  }
  
 
}


final authServiceProvider = Provider((ref) => AuthServices (ref));
