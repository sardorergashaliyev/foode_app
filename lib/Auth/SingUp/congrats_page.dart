import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/pages/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/background_image.png'),
          ),
        ),
        child: Column(
          children: [
            200.verticalSpace,
            SizedBox(
              child: Image.asset('assets/image/congrats.png'),
            ),
            Spacer(),
            48.verticalSpace,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (a) => HomePage(),
                      ), (s) {
                    return false;
                  });
                },
                child: AnimatedContainer(
                  height: 55.h,
                  duration: Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  child: Center(
                    child: Text(
                      'Go homepage',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            48.verticalSpace,
          ],
        ),
      ),
    );
  }
}
