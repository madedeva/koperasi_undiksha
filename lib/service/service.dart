import "package:dio/dio.dart";
import 'package:praktikum_satu/model/list_users_model.dart';

class Service {
  // list users
  Future<List<ListUsersModel>?> getDataUsers() async {
    Dio dio = Dio();
    String url = "https://koperasiundiksha.000webhostapp.com/users";
    final Response response;
    try {
      response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        var json = response.data;
        if (json is Map && json.keys.contains('data')) {
          var data = json['data'];
          if (data is List) {
            dynamic send = data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();
            print(send);
            return send;
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  // login
  Future<ListUsersModel?> loginUsers(
      {required String password, required String email}) async {
    Dio dio = Dio();
    String url = "https://koperasiundiksha.000webhostapp.com";
    final Response response;

    try {
      response = await dio.post(
        url,
        data: {"username": email, "password": password},
      );

      if (response.statusCode == 200) {
        var json = response.data;

        if (!json.keys.contains('data')) {
          return null;
        } else {
          if (json['data'] is List) {
            var data = json['data'];

            List<dynamic> dataList = (data as List).cast<dynamic>();

            print(dataList);

            double? balence = double.parse(dataList[0]['saldo']);
            int? id = int.parse(dataList[0]['user_id']);

            ListUsersModel user = ListUsersModel(
              user_id: id,
              username: dataList[0]['username'],
              nama: dataList[0]['nama'],
              saldo: balence,
            );
            return user;
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  // register
  Future<ListUsersModel?> registerUsers(
      {required String password,
      required String name,
      required String email}) async {
    Dio dio = Dio();
    String url = "https://koperasiundiksha.000webhostapp.com/register";
    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "username": email,
          "password": password,
          "nama": name,
        },
      );

      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        print(data['status']);
        if (data['status'] != 'error') {
          return null;
        } else {
          Future<ListUsersModel?> result =
              loginUsers(password: password, email: email);
          print(result);
          return result;
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }
}
