import 'package:chatgenie/screens/about_page.dart';
import 'package:chatgenie/screens/ai_image/image.dart';
import 'package:chatgenie/screens/chatbot/chat.dart';
import 'package:chatgenie/screens/description.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(117, 68, 68, 68),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 37, 97, 127),
          centerTitle: true,
          title: Text(
            'ChatGenie',
            style: GoogleFonts.poppins(
              fontSize: 21,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        drawer: Drawer(
          shadowColor: Colors.white24,
          backgroundColor: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    top: 20,
                  ),
                  child: Text(
                    'About',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.white,
                thickness: 0.2,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionPage(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    top: 20,
                  ),
                  child: Text(
                    'Description',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const ChatPage());
                  },
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 19, 143, 110),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LottieBuilder.asset(
                          'assets/lottie/ai_hand_waving.json',
                          width: 150,
                        ),
                        SizedBox(width: mq.width * 0.1),
                        Text(
                          'AI ChatBot',
                          style: GoogleFonts.poppins(
                            fontSize: 21,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: mq.width * 0.05),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Get.to(const ImageFeature());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageFeature(),
                        ));
                  },
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(206, 2, 73, 95),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(width: 5),
                        Text(
                          'AI  Image Creator',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        LottieBuilder.asset(
                          'assets/lottie/ai_play.json',
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
