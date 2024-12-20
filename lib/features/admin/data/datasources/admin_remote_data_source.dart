import 'package:shop/core/constant/end_points.dart';
import 'package:shop/core/server_service/http_service.dart';
import 'package:shop/features/admin/data/models/admin_model.dart';

abstract class AdminRemoteDataSource {
  Future<AdminModel> login(String username, String password);
  Future<void> addAdminAccount(AdminModel admin);
  Future<void> updateAdminAccount(AdminModel admin);
  Future<void> deleteAddminAccount(int addminId);
  Future<List<AdminModel>> getAllAdmins();
}

class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {
  final HttpService httpService;

  AdminRemoteDataSourceImpl({required this.httpService});
  @override
  Future<void> addAdminAccount(AdminModel admin) async {
    await httpService.post(
        url: EndPoints.adminAddAccountUrl, data: admin.toJson());
  }

  @override
  Future<void> deleteAddminAccount(int addminId) async {
    await httpService
        .post(url: EndPoints.adminDeleteAccontUrl, data: {'id': addminId});
  }

  @override
  Future<AdminModel> login(String username, String password) async {
    final result = await httpService.post(
        url: EndPoints.adminLoginUrl,
        data: {'username': username, 'password': password});
    return AdminModel.fromJson(result);
  }

  @override
  Future<void> updateAdminAccount(AdminModel admin) async {
    await httpService.post(
        url: EndPoints.adminUpdateAccontUrl, data: admin.toJson());
  }

  @override
  Future<List<AdminModel>> getAllAdmins() async {
    final result = await httpService.get(url: EndPoints.getAllAdminsUrl);
    return List<AdminModel>.from(result.map((e) => AdminModel.fromJson(e)));
  }
}
