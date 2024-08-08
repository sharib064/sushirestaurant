import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushirestaurant/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "SUSHI MAN",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Image.asset('lib/images/salmon_eggs.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Feel the taste of most popular Japanese food from anywhere and anytime",
              style: TextStyle(color: Colors.grey[300]),
            ),
            const SizedBox(
              height: 10,
            ),
            MyButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/menu_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}
