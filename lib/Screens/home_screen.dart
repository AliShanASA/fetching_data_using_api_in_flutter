import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kamwali/Model/user.dart';
import 'package:kamwali/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  bool flag = false;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Call Sample'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ),
      body: flag
          ? _buildUserList()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _buildUserList() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        final name = user.fullName;
        final phone = user.phone;

        return ListTile(
          title: Text(name),
          subtitle: Text(phone),
        );
      },
    );
  }

  Future<void> fetchUser() async {
    setState(() {
      flag = false;
    });

    final response = await UserApi.fetchUser();

    setState(() {
      users = response;
      flag = true;
    });
  }
}
