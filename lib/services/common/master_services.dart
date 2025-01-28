import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/app_constants.dart';
import '../../utils/api_client.dart';
import '../base/master_provider_base.dart';


class MasterServiceProvider extends MasterProviderBase {
  final Ref ref;
  MasterServiceProvider(this.ref);
  @override
  Future<Response> getMasterSettings() async {
    final response =
        await ref.read(apiClientProvider).get(AppConstants.settings);
    return response;
  }
}

final masterServiceProvider = Provider((ref) => MasterServiceProvider(ref));
