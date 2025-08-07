import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce_app/auth/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/Custom_TextField.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Text(
                "Forgot\nPassword?",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                mycontroller: email,
                icon: Icons.email,
                hintText: 'Enter your email address',
              ),

              const SizedBox(height: 8),
              const Text(
                "* We will send you a message to set or reset your new password",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 55),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email.text)
                        .then((onValue) async {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            desc: 'Reset password successfully',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LoginScreen(),
                                ),
                              );
                            },
                          ).show();
                        })
                        .catchError((error) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            title: "The email address you entered is not valid",
                            desc: "Create a new account to get started",
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          ).show();
                        });
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF83758),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    "Send Reset Link",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
