import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderScreen extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const SliderScreen({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(image), width: 350),
          SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              style:  GoogleFonts.montserrat(
                height: 1.5,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xffA8A8A9),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
