
import 'dart:convert';

import 'package:async_provider/main.dart';
import 'package:async_provider/provider/user_state_provider.dart';
import 'package:async_provider/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class LoginProvider extends _$LoginProvider {
  @override
  FutureOr<void> build() {}

  Future<void> loginUser(Map<String, dynamic> map) async {
      state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final response = await ref.read(authServiceProvider).loginUser(map);
      ref.read(userStateProvider.notifier).addUser(response);
    });
  }
}
