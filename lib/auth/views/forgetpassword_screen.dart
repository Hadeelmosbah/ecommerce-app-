import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce_app/auth/Custom%20widget/Custom_TextField.dart';
import 'package:ecommerce_app/auth/Custom%20widget/custom_awesdia.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
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
                      if (formKey.currentState!.validate()) {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email.text)
                            .then((onValue) {
                              CustomDialog.showDialogMessage(
                                context: context,
                                message: 'Reset password successfully',
                                type: DialogType.success,
                              );
                            })
                            .catchError((error) {
                              CustomDialog.showDialogMessage(
                                context: context,
                                message: 'Invalid email',
                                type: DialogType.error,
                              );
                            });
                      }
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
      ),
    );
  }
}
