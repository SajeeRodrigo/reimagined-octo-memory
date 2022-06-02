import 'package:flutter/material.dart';

import '../widgets/custom_text_fields.dart';

class LoginTabPage extends StatefulWidget {
  @override
  State<LoginTabPage> createState() => _LoginTabPageState();
}

class _LoginTabPageState extends State<LoginTabPage> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "images/login.png",
              height: MediaQuery.of(context).size.width*0.80,
            ),
          ),

          Form(
            // key: formkey,
            child: Column(
              children: [
                CustomTextField(
                  textEditingController: emailTextEditingController,
                  iconData: Icons.email,
                  hintText: "Email..",
                  isObsecure: false,
                  enabled: true,
                ),
                CustomTextField(
                  textEditingController: passwordTextEditingController,
                  iconData: Icons.lock,
                  hintText: "Password..",
                  isObsecure: true,
                  enabled: true,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.pinkAccent,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            ),
            onPressed: () {},
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
