import 'dart:io';
import 'package:amazon_clone/global/global.dart';
import 'package:amazon_clone/mainScreens/home_screen.dart';
import 'package:amazon_clone/widgets/custom_text_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationTabPage extends StatefulWidget {
  @override
  State<RegistrationTabPage> createState() => _RegistrationTabPageState();
}

class _RegistrationTabPageState extends State<RegistrationTabPage> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmpasswordTextEditingController =
      TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String downloadUrlImage = "";

  XFile? imgXFile;
  final ImagePicker imagePicker = ImagePicker();

  getImageFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imgXFile;
    });
  }

  formValidation() async {
    if (imgXFile == null) {
      //image is not selected
      Fluttertoast.showToast(msg: "Please select an image!");
    } else {
      //image is selected
      //password is equal to confirm password.
      if (passwordTextEditingController.text ==
          confirmpasswordTextEditingController.text) {
        //check email,password, confirm password & name text fields.
        if (nameTextEditingController.text.isNotEmpty &&
            emailTextEditingController.text.isNotEmpty &&
            passwordTextEditingController.text.isNotEmpty &&
            confirmpasswordTextEditingController.text.isNotEmpty) {
          //1.upload image to storage
          String fileName = DateTime.now().microsecondsSinceEpoch.toString();
          fStorage.Reference storageRef = fStorage.FirebaseStorage.instance
              .ref()
              .child("usersImages")
              .child(fileName);

          fStorage.UploadTask uploadImageTask =
              storageRef.putFile(File(imgXFile!.path));

          fStorage.TaskSnapshot taskSnapshot =
              await uploadImageTask.whenComplete(() {});

          await taskSnapshot.ref.getDownloadURL().then((urlImage) {
            downloadUrlImage = urlImage;
          });
          //2.save the user info to firestore database.
          saveInformationToDatabase();
        } else {
          Fluttertoast.showToast(
              msg:
                  "Please complete the form. Do not leave any textfield empty!");
        }
      } else {
        //password is not equal to confirm password.
        Fluttertoast.showToast(
            msg: "Password and confirm password do not match!");
      }
    }
  }

  saveInformationToDatabase() async {
    //Authenticate the user first
    User? currentUser;

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user;
    }).catchError((errorMessage) {
      Fluttertoast.showToast(msg: "Error Occurred: \n $errorMessage");
    });

    if (currentUser != null) {
      //save the info to database and locally
      saveInfoToFirestoreAndLocally(currentUser!);
    }
  }

  saveInfoToFirestoreAndLocally(User currentUser) async {
    //to firestore
    FirebaseFirestore.instance.collection("Users").doc(currentUser.uid).set({
      "uid": currentUser.uid,
      "email": currentUser.email,
      "name": nameTextEditingController.text.trim(),
      "photoUrl": downloadUrlImage,
      "status": "approved",
      "userCart": ["initialValue"],
    });

    //to locally
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("uid", currentUser.uid);
    await sharedPreferences!.setString("email", currentUser.email!);
    await sharedPreferences!
        .setString("name", nameTextEditingController.text.trim());
    await sharedPreferences!.setString("photoUrl", downloadUrlImage);
    await sharedPreferences!.setStringList("userCart", ["initialValue"]);

    Navigator.push(context, MaterialPageRoute(builder: (c) => HomeScreen()));
  }

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
              onTap: () {
                getImageFromGallery();
              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.20,
                backgroundColor: Colors.white,
                backgroundImage:
                    imgXFile == null ? null : FileImage(File(imgXFile!.path)),
                child: imgXFile == null
                    ? Icon(
                        Icons.add_photo_alternate,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width * 0.20,
                      )
                    : null,
              ),
            ),

            const SizedBox(height: 12),

            //inputs fields

            Form(
              // key: formkey,
              child: Column(
                children: [
                  CustomTextField(
                    textEditingController: nameTextEditingController,
                    iconData: Icons.person,
                    hintText: "Name..",
                    isObsecure: false,
                    enabled: true,
                  ),
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
                  CustomTextField(
                    textEditingController: confirmpasswordTextEditingController,
                    iconData: Icons.lock,
                    hintText: "Confirm Password..",
                    isObsecure: true,
                    enabled: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              ),
              onPressed: () {
                formValidation();
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
