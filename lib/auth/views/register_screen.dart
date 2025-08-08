import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommerce_app/Homepage/Home_screen.dart';
import 'package:ecommerce_app/auth/Custom%20widget/auth_services.dart';
import 'package:ecommerce_app/auth/Custom%20widget/custom_awesdia.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Custom widget/Custom_TextField.dart';
import '../Custom widget/social_Icon.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController conpassword = TextEditingController();

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
                "Create an\naccount",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              CustomTextField(
                mycontroller: email,
                hintText: 'Username or Email',
                icon: Icons.person,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                mycontroller: password,
                hintText: 'Password',
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                mycontroller: conpassword,
                hintText: 'Confirm Password',
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 8),

              Text.rich(
                TextSpan(
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 111, 111, 112),
                  ),
                  text: "By clicking the ",
                  children: [
                    TextSpan(
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffF83758),
                      ),
                      text: "Register",
                    ),
                    TextSpan(
                      text: " button, you agree\nto the public offer",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 111, 111, 112),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 55),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (password.text != conpassword.text) {
                      CustomDialog.showDialogMessage(
                        context: context,
                        message: "Passwords do not match",
                        type: DialogType.error,
                      );
                      return;
                    }

                    await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        )
                        .then((onValue) async {
                          CustomDialog.showDialogMessage(
                            context: context,
                            message: 'Registration Successful',
                            type: DialogType.success,);
                        })
                        .catchError((error) {
                          CustomDialog.showDialogMessage(
                            context: context,
                            message: "Registration Failed\n${error.toString()}",
                            type: DialogType.error,
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF83758),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Create Account",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 60),
              Center(
                child: Text(
                  "- OR Continue with -",
                  style: GoogleFonts.montserrat(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      try {
                        await AuthServices.signInWithGoogle();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      } catch (error) {
                        CustomDialog.showDialogMessage(
                          context: context,
                          message: "Google Sign-In Failed\n${error.toString()}",
                          type: DialogType.error,
                        );
                      }
                    },
                    child: SocialIcon(
                      imagePath: 'assets/socialmedia/google.png',
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () async {
                      try {
                        await AuthServices.signInWithFacebook();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      } catch (error) {
                        CustomDialog.showDialogMessage(
                          context: context,
                          message:
                              "Facebook Sign-In Failed\n${error.toString()}",
                          type: DialogType.error,
                        );
                      }
                    },
                    child: SocialIcon(
                      imagePath: 'assets/socialmedia/facebook.png',
                    ),
                  ),
                  const SizedBox(width: 16),
                 /* GestureDetector(
                    onTap: () async {
                      try {
                        await AuthServices.signInWithTwitter();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      } catch (error) {
                        CustomDialog.showDialogMessage(
                          context: context,
                          message:
                              "Twitter Sign-In Failed\n${error.toString()}",
                          type: DialogType.error,
                        );
                      }
                    },
                    child: SocialIcon(
                      imagePath: 'assets/socialmedia/twitter.png',
                    ),
                  ),*/
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I Already Have an Account "),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Login",
                      style: GoogleFonts.montserrat(
                        color: Color(0xffF83758),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
