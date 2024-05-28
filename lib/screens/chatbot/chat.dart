import 'package:chatgenie/apis/apis.dart';
import 'package:chatgenie/screens/chatbot/BardAIController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    BardAIController controller = Get.put(BardAIController());
    TextEditingController textField = TextEditingController();
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xfff2f1f9),
        backgroundColor: const Color.fromARGB(117, 68, 68, 68),

        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 25,
            ),
          ),
          centerTitle: true,
          // leading: SvgPicture.asset(
          //   "assets/bard_logo.svg",
          //   width: 10,
          // ),
          title: Text(
            APPNAME,
            style: GoogleFonts.poppins(
              fontSize: 21,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 19, 143, 110),
          actions: [
            IconButton(
                onPressed: () {
                  controller.sendPrompt(
                    "Hello what can you do for me ",
                  );
                },
                icon: const Icon(
                  Icons.security,
                  color: Colors.white,
                ))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    Obx(() => Column(
                          children: controller.historyList
                              .map(
                                (e) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        e.system == "user" ? "👨‍💻" : "🤖",
                                      ),
                                      const SizedBox(width: 10),
                                      Flexible(child: Text(e.message)),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ))
                  ],
                )),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 19, 143, 110),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 60,
                  child: Row(children: [
                    Expanded(
                      child: TextFormField(
                        controller: textField,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                            hintText: "You can ask what you want..",
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Obx(
                      () => controller.isLoading.value
                          ? const SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                if (textField.text != "") {
                                  controller.sendPrompt(textField.text);
                                  textField.clear();
                                }
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              )),
                    ),
                    const SizedBox(width: 10)
                  ]),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
