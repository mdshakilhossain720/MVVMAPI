import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvmapi/services/base/signup_base.dart';

import '../../model/common/common_model.dart';

class AuthController extends StateNotifier<bool> {
  final Ref ref;
  AuthController(this.ref) : super(false);

  Future<CommonResponse> login(
      {required String contract, required String password}) async {
    state = true;
    bool isSuccess = false;
    

  }
}
