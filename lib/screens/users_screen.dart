import 'package:flutter/material.dart';
import 'package:inter_day1/model/user.dart';
import 'package:inter_day1/service/api_service.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key, required this.token});
  final String token;
  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  ScrollController scrollController = ScrollController();
  int skip = 0;
  int totalUser = 0;
  bool isLoading = false;
  List<UserElement> users = [];

  @override
  void initState() {
    super.initState();
    getUsers();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getUsers();
      }
    });
  }

  void getUsers() async {
    if (isLoading) return;

    if (skip >= totalUser && skip > 0) return;
    setState(() {
      isLoading = true;
    });
    User? user = await getAllUser(widget.token, skip);
    users.addAll(user!.users);
    totalUser = user.total;
    skip += user.limit;
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 254, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 251, 254, 255),
        centerTitle: true,
        title: const Text("Users"),
      ),
      body: users.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              controller: scrollController,
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == users.length - 1 && isLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
                }
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: Image.network(users[index].image),
                    title: Text(
                      users[index].firstName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      users[index].email,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
