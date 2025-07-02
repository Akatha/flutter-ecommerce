import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data.g.dart';

part 'user_data.freezed.dart';


@freezed
abstract class UserData with _$UserData {
  const factory UserData({
   @Default('') String  token,
   @Default('') String  role,
    @Default('') String  userId


}) = _UserData;

  factory UserData.empty(){
    return UserData(
      token: 'no-token',
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
