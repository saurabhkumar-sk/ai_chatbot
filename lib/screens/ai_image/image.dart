import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatgenie/controller/image_controller.dart';
import 'package:chatgenie/global/cus_btn.dart';
import 'package:chatgenie/global/cus_landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final _c = ImageController();

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xfff2f1f9),
        backgroundColor: const Color.fromARGB(117, 68, 68, 68),

        //app bar
        appBar: AppBar(
          title: Text(
            'AI Image Creator',
            style: GoogleFonts.poppins(
              fontSize: 21,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 37, 97, 127),
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
          //share btn
          // actions: [
          //   Obx(
          //     () => _c.status.value == Status.complete
          //         ? IconButton(
          //             padding: const EdgeInsets.only(right: 6),
          //             onPressed: _c.shareImage,
          //             icon: const Icon(Icons.share))
          //         : const SizedBox(),
          //   )
          // ],
        ),

        // download btn
        // floatingActionButton: Obx(
        //   () => _c.status.value == Status.complete
        //       ? Padding(
        //           padding: const EdgeInsets.only(right: 6, bottom: 6),
        //           child: FloatingActionButton(
        //             onPressed: () {
        //               _c.downloadImage(_c.url.value);
        //             },
        //             shape: const RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.all(Radius.circular(15))),
        //             child: const Icon(Icons.save_alt_rounded, size: 26),
        //           ),
        //         )
        //       : const SizedBox(),
        // ),

        //body
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
              top: mq.height * .02,
              bottom: mq.height * .1,
              left: mq.width * .04,
              right: mq.width * .04),
          children: [
            const SizedBox(height: 15),
            //text field

            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: _c.textC,
              textAlign: TextAlign.center,
              minLines: 1,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                hintText: 'Type here & I will create for you 😃',
                hintStyle: TextStyle(fontSize: 13.5, color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),

            // ai image
            Container(
                height: mq.height * .5,
                margin: EdgeInsets.symmetric(vertical: mq.height * .015),
                alignment: Alignment.center,
                child: Obx(() => _aiImage())),

            Obx(() => _c.imageList.isEmpty
                ? const SizedBox()
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(bottom: mq.height * .03),
                    physics: const BouncingScrollPhysics(),
                    child: Wrap(
                      spacing: 10,
                      children: _c.imageList
                          .map((e) => InkWell(
                                onTap: () {
                                  _c.url.value = e;
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  child: CachedNetworkImage(
                                    imageUrl: e,
                                    height: 100,
                                    errorWidget: (context, url, error) =>
                                        const SizedBox(),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  )),

            //create btn
            // CustomBtn(onTap: _c.createAIImage, text: 'Create'),
            CustomBtn(onTap: _c.searchAiImage, text: 'Create'),
          ],
        ),
      ),
    );
  }

  Widget _aiImage() => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: switch (_c.status.value) {
          Status.none => Lottie.asset('assets/lottie/ai_play.json',
              height: MediaQuery.of(context).size.height * .3),
          Status.complete => CachedNetworkImage(
              imageUrl: _c.url.value,
              placeholder: (context, url) => const CustomLoading(),
              errorWidget: (context, url, error) => const SizedBox(),
            ),
          Status.loading => const CustomLoading()
        },
      );
}
