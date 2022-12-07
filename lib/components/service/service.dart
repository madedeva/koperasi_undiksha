import "package:dio/dio.dart";

class Service {
  postLogin(String email, String password) async {
    Dio dio = Dio();
    String url = "https://reqres.in/api/users";
    final Response response;
    FormData formData = FormData.fromMap({});
    try {
      response = await dio.post(url, data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        return 'success';
      } else {
        return 'failed';
      }
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }
}
