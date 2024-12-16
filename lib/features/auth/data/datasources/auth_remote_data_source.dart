import 'package:shop/core/constant/end_points.dart';
import 'package:shop/core/server_service/http_service.dart';
import 'package:shop/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> getUserData(int id);
  Future<void> addUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<void> delteUser(int id);
  Future<void> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final HttpService httpService;

  AuthRemoteDataSourceImpl({required this.httpService});
  @override
  Future<void> addUser(UserModel user) async {
    await httpService.post(url: EndPoints.addUserUrl, data: user.toJson());
  }

  @override
  Future<void> delteUser(int id) async {
    await httpService.patch(url: EndPoints.deleteUserUrl(id: id));
  }

  @override
  Future<UserModel> getUserData(int id) async {
    final result = await httpService.get(url: EndPoints.getUserDataUrl(id: id));
    return UserModel.fromJson(result);
  }

  @override
  Future<void> login(String username, String password) async {
    await httpService.post(url: EndPoints.loginUrl, header: {
      'Content-Type': 'application/json',
    }, data: {
      'username': username,
      'password': password
    });
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await httpService.post(
        url: EndPoints.updateUserUrl(id: user.id), data: user.toJson());
  }
}
