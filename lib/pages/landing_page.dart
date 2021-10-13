import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget navItem({String? title, int? index}) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index!;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$title',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight:
                    index == selectedIndex ? FontWeight.w500 : FontWeight.w300,
              ),
            ),
            Container(
              width: 66,
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: index == selectedIndex
                    ? const Color(0xffFE998D)
                    : Colors.transparent,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'background.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 30,
          ),
          child: Column(
            children: [
              // NOTE: NAVIGATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'logo.png',
                    width: 72,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      navItem(
                        title: "Gueides",
                        index: 0,
                      ),
                      const SizedBox(width: 50),
                      navItem(
                        title: "Pricing",
                        index: 1,
                      ),
                      const SizedBox(width: 50),
                      navItem(
                        title: "Team",
                        index: 2,
                      ),
                      const SizedBox(width: 50),
                      navItem(
                        title: "Stories",
                        index: 3,
                      ),
                    ],
                  ),
                  Image.asset(
                    'btn_account.png',
                    width: 163,
                  )
                ],
              ),
              // NOTE: CONTENT
              const SizedBox(height: 76),
              Image.asset(
                'illustration.png',
                width: 550,
              ),
              // NOTE: FOOTER
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 83),
                  Image.asset(
                    'icon_scroll.png',
                    width: 24,
                  ),
                  const SizedBox(width: 13),
                  Text(
                    "Scroll to Learn More",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
