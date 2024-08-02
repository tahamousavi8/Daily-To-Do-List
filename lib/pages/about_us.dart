// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                'Thanks For Using This App.',
                style: GoogleFonts.mukta(fontSize: 24),
              ),
            ),
            Lottie.asset('assets/ani2.json'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(SimpleIcons.github),
                InkWell(
                    onTap: () {
                      final _url = Uri.parse('https://github.com/tahamousavi8');

                      launchUrl(_url, mode: LaunchMode.externalApplication);
                    },
                    child: Text('tahamousavi6@gmail.com'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
