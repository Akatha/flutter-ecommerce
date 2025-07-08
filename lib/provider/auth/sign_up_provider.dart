
import 'package:async_provider/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
