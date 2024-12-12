import 'package:flutter/material.dart';
import 'package:inter_day1/service/api_service.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 251, 254, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 251, 254, 255),
          title: const Text("Add User"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Material(
                      elevation: 5,
                      shadowColor: Colors.white,
                      child: TextFormField(
                        controller: firstNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter FirstName";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          label: Text("FirstName"),
                          labelStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Material(
                      elevation: 5,
                      shadowColor: Colors.white,
                      child: TextFormField(
                        controller: lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter LastName";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          label: Text("LastName"),
                          labelStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Material(
                      elevation: 5,
                      shadowColor: Colors.white,
                      child: TextFormField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Age";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          label: Text("Age"),
                          labelStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Material(
                      elevation: 5,
                      shadowColor: Colors.white,
                      child: TextFormField(
                        controller: genderController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Gender";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          label: Text("Gender"),
                          labelStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                elevation: 5,
                shadowColor: Colors.white,
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Email";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    label: Text("Email"),
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
                    // print(firstNameController.text);
                    // print(lastNameController.text);
                    // print(ageController.text);
                    // print(genderController.text);
                    // print(emailController.text);
                    int? result = await addUser(
                        firstNameController.text,
                        lastNameController.text,
                        int.parse(ageController.text),
                        genderController.text,
                        emailController.text);
                    if (result == 201) {
                      firstNameController.clear();
                      lastNameController.clear();
                      ageController.clear();
                      genderController.clear();
                      emailController.clear();
                      showMyDialog();
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, foregroundColor: Colors.white),
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showMyDialog() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) => AlertDialog(
              title: const Text(
                "Add user successfully",
                style: TextStyle(color: Colors.green),
              ),
              //content: const Text("Login fail. try again!"),
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
