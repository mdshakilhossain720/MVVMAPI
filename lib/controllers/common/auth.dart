import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvmapi/model/common/signup_creadntail.dart';
import 'package:mvvmapi/services/auth_services.dart';
import 'package:mvvmapi/services/base/signup_base.dart';

import '../../model/common/common_model.dart';
import '../../model/common/user.dart';

class AuthController extends StateNotifier<bool> {
  final Ref ref;
  AuthController(this.ref) : super(false);
  Future<CommonResponse> login(
      {required String contract, required String password}) async {
    state = true;
    bool isSuccess = false;

    try {
      final response = await ref
          .read(authServiceProvider)
          .login(contract: contract, password: password);
      state = false;
      if (response.statusCode == 200) {
        isSuccess = true;
        final userInfo = User.fromMap(response.data);
        final authToken = response.data['data']['token'];
      }
      return CommonResponse(
          isSuccess: isSuccess, message: response.data['message']);
    } catch (e) {
      state = false;
      return CommonResponse(isSuccess: false, message: e.toString());
    } finally {
      state = false;
    }
  }

  // regestion

  Future<CommonResponse> signUp(SignupCreadntail signupCreadntail) async {
    state = true;
    bool isSuccess = false;

    try {
      final response=await ref.read(authServiceProvider).signup(signupCreadntail: signupCreadntail);
      state =false;
      if(response.statusCode==200){
        isSuccess=true;
        final userInfo=User.fromMap(response.data['data'] ['user']);
        final userToken=response.data['data']['token'];


      }
      return CommonResponse(isSuccess: isSuccess, message: response.data['message']);
    } catch (e) {
      state = false;
      return CommonResponse(isSuccess: false, message: e.toString());
    } finally {
      state = false;
    }
  }
}
