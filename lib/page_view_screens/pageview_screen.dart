import 'package:ecommerce_app/auth/views/login_screen.dart';
import 'package:ecommerce_app/auth/views/register_screen.dart';
import 'package:ecommerce_app/page_view_screens/slider_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageviewScreen extends StatefulWidget {
  const PageviewScreen({super.key});

  @override
  State<PageviewScreen> createState() => _PageviewScreenState();
}

class _PageviewScreenState extends State<PageviewScreen> {
  int currentpage = 0;

  PageController viewcontroller = PageController();

  List<Widget> pages = [
    SliderScreen(
      title: "Choose Products",
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      image: "assets/pageview/chooseproduct.png",
    ),
    SliderScreen(
      title: "Make Payment",
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      image: "assets/pageview/makepayment.png",
    ),
    SliderScreen(
      title: "Get Your Order",
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      image: "assets/pageview/getyourorder.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "${currentpage + 1} / 3",
            style: TextStyle(color: Colors.black54),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: Text(
              "Skip",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: viewcontroller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentpage = index;
                });
              },
              itemBuilder: (context, index) => pages[index],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: SmoothPageIndicator(
                controller: viewcontroller,
                count: pages.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 9,
                  dotWidth: 16,
                  radius: 8,
                  activeDotColor: Color(0xff17223B),
                  dotColor: Color.fromARGB(35, 23, 34, 59),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentpage > 0
                    ? TextButton(
                        onPressed: () {
                          viewcontroller.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceOut,
                          );
                        },
                        child: Text(
                          "Prev",
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(94, 176, 169, 169),
                          ),
                        ),
                      )
                    : SizedBox(width: 60),

                TextButton(
                  onPressed: () {
                    if (currentpage < pages.length - 1) {
                      viewcontroller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => RegisterScreen()),
                      );
                    }
                  },
                  child: Text(
                    currentpage == pages.length - 1 ? "Get Started" : "Next",
                    style: GoogleFonts.montserrat(
                      fontSize: currentpage == pages.length - 1 ? 16 : 19,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffF83758),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
