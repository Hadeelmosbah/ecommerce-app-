import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController mycontroller;
 
  
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    required this.mycontroller,
     
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
        controller: mycontroller,
        obscureText: isPassword,
        decoration: InputDecoration(
          
          prefixIcon: Icon(icon),
          suffixIcon: isPassword ? const Icon(Icons.visibility) : null,
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffA8A8A9), width: 1.5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffA8A8A9), width: 2),
          ),
        ),
      
    );
  }
}
