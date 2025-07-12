

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/auth/auth_service.dart';
part 'sign_up_provider.g.dart';

@riverpod
class SignUp extends _$SignUp {
  @override
  FutureOr<void> build()  {}

    Future<void> registerUser (Map<String, dynamic> map) async {
      state = AsyncLoading();
      state = await AsyncValue.guard(()=> ref.watch(authServiceProvider).registerUser(map));
    }

}
