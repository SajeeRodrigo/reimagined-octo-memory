import 'package:amazon_clone/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';

class RegistrationTabPage extends StatefulWidget {

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmpasswordTextEditingController =TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  State<RegistrationTabPage> createState() => _RegistrationTabPageState();
}

class _RegistrationTabPageState extends State<RegistrationTabPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            //get or capture image
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add_photo_alternate,
                  color: Colors.grey,
                  size: MediaQuery.of(context).size.width * 0.20,
                ),
              ),
            ),

            const SizedBox(height: 12),

            //inputs fields

            Form(
             // key: formkey,
              child: Column(
                children: [
                              CustomTextField(
              //textEditingController: nameTextEditingController,
              iconData: Icons.person,
              hintText: "Name..",
              isObsecure: false,
              enabled: true,

            ),
             CustomTextField(
              //textEditingController: nameTextEditingController,
              iconData: Icons.email,
              hintText: "Email..",
              isObsecure: false,
              enabled: true,

            ),
            CustomTextField(
              //textEditingController: nameTextEditingController,
              iconData: Icons.lock,
              hintText: "Password..",
              isObsecure: true,
              enabled: true,

            ),
            CustomTextField(
              //textEditingController: nameTextEditingController,
              iconData: Icons.lock,
              hintText: "Confirm Password..",
              isObsecure: true,
              enabled: true,

            ),

            const SizedBox(height: 20,),
                ],
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              ),
            onPressed: (){}, 
            child: const Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),

            const SizedBox(height:20),
          ],
        ),
      ),
    );
  }
}
