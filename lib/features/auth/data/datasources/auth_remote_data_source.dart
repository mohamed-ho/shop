import 'package:shop/core/constant/end_points.dart';
import 'package:shop/core/server_service/http_service.dart';
import 'package:shop/dependent_enjection.dart';
import 'package:shop/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:shop/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> addUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<void> delteUser(int id);
  Future<void> login(String email, String password);
  Future<UserModel> getUserData(int id);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final HttpService httpService;

  AuthRemoteDataSourceImpl({required this.httpService});
  @override
  Future<void> addUser(UserModel user) async {
    await httpService.post(url: EndPoints.signupUrl, data: user.toJson());
  }

  @override
  Future<void> delteUser(int id) async {
    await httpService.post(url: EndPoints.deleteUserUrl, data: {"id": id});
  }

  @override
  Future<void> login(String username, String password) async {
    final result = await httpService.post(
        url: EndPoints.loginUrl,
        data: {'email': username, 'password': password});
    await ls<AuthLocalDataSource>().addUserData(UserModel.fromJson(result));
    await ls<AuthLocalDataSource>().saveLogin();
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await httpService.post(url: EndPoints.updateUserUrl, data: user.toJson());
    await ls<AuthLocalDataSource>().addUserData(user);
  }

  @override
  Future<void> logout() async {
    await ls<AuthLocalDataSource>().logout();
  }

  @override
  Future<UserModel> getUserData(int id) async {
    final result =
        await httpService.post(url: EndPoints.getUserDataUrl, data: {'id': id});
    return UserModel.fromJson(result);
  }
}
