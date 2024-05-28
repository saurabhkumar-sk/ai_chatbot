import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(117, 68, 68, 68),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(117, 68, 68, 68),
        title: Text(
          'About ChatGenie',
          style: GoogleFonts.poppins(
            fontSize: 21,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.back,
            size: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'ChatGenie is a Flutter app that combines a chatbot and an image generator. It aims to provide users with a seamless experience of interacting with a chatbot while also generating images based on their preferences.',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24.0),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
