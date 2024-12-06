import 'package:flutter/material.dart';
import 'package:inter_day1/model/login.dart';
import 'package:inter_day1/screens/users_screen.dart';
import 'package:inter_day1/service/api_service.dart';
import 'package:inter_day1/util/m_sharepreference.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 251, 254, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 251, 254, 255),
          title: const Text('Material App Bar'),
        ),
        body: const Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    usernameController.text = "emilys";
    passwordController.text = "emilyspass";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Material(
              elevation: 5,
              shadowColor: Colors.white,
              child: TextFormField(
                controller: usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter username";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  label: Text("Username"),
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Material(
              elevation: 5,
              shadowColor: Colors.white,
              child: TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter password";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  label: Text("Password"),
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_key.currentState!.validate()) {
                  Login? mLogin = await login(
                      usernameController.text, passwordController.text);
                  if (mLogin == null) {
                    showMyDialog();
                  } else {
                    await MyShare.init();
                    await MyShare.addLogin(mLogin);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                UsersScreen(token: mLogin.accessToken)));
                  }
                }
              },
              child: const Text("LOGIN"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showMyDialog() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) => AlertDialog(
              title: const Text("fail"),
              content: const Text("Login fail. try again!"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            ));
  }
}
