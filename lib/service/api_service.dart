import 'package:dio/dio.dart';
import 'package:inter_day1/model/login.dart';
import 'package:inter_day1/model/user.dart';

Dio dio = Dio()
  ..options.baseUrl = "https://dummyjson.com"
  ..options.connectTimeout = const Duration(seconds: 5)
  ..options.receiveTimeout = const Duration(seconds: 5);

Future<Login?> login(String username, String password) async {
  try {
    var response = await dio.post("/auth/login",
        data: {"username": username, "password": password});
    return Login.fromJson(response.data);
    // print(response.data);
  } on DioException {
    return null;
  }
}

Future<User?> getAllUser(String token, int skip) async {
  try {
    var response = await dio.get("/auth/users",
        options: Options(headers: {"Authorization": token}),
        queryParameters: {"skip": skip});
    // print("users${response.data}");
    return User.fromJson(response.data);
  } on DioException {
    return null;
  }
}

Future<int?> addUser(String firstName, String lastName, int age, String gender,
    String email) async {
  var response = await dio.post("/users/add", data: {
    "firstName": firstName,
    "lastName": lastName,
    "age": age,
    "gender": gender,
    "email": email
  });
 return response.statusCode;
}
