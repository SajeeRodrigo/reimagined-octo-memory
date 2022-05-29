import 'package:flutter/material.dart';

class LoginTabPage extends StatefulWidget {
  const LoginTabPage({Key? key}) : super(key: key);

  @override
  State<LoginTabPage> createState() => _LoginTabPageState();
}

class _LoginTabPageState extends State<LoginTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Login Tab page"
      ),
    );
  }
}
