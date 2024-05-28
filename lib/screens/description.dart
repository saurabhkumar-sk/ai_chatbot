import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(117, 68, 68, 68),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(117, 68, 68, 68),
        title: Text(
          'ChatGenie Description',
          style: GoogleFonts.poppins(
            fontSize: 21,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
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
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text(
            //   'Chatgenie Description',
            //   style: TextStyle(
            //     fontSize: 24.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            Text(
              'ChatGenie is an innovative Flutter app that combines the power of a chatbot with an image generator to provide users with a unique and engaging experience. Here are some key features:',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.0),
            _buildFeatureItem(
              icon: Icons.chat,
              title: 'Interactive Chatbot',
              description:
                  'Engage in conversations with an AI-powered chatbot that can answer questions, provide recommendations, and assist users in various tasks.',
            ),
            _buildFeatureItem(
              icon: Icons.image,
              title: 'Image Generator',
              description:
                  'Generate custom images based on user preferences, such as style, colors, and content. The image generator utilizes advanced algorithms to create stunning visuals.',
            ),
            _buildFeatureItem(
              icon: Icons.info,
              title: 'About Page',
              description:
                  'Access detailed information about the Chatgenie app, including its purpose, functionalities, and code snippets for developers.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
      {required IconData icon,
      required String title,
      required String description}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            size: 32.0,
            color: Colors.white,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  description,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
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
