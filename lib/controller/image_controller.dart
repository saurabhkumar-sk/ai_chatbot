import 'dart:io';

import 'package:chatgenie/global/my_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import '../apis/apis.dart';

enum Status { none, loading, complete }

class ImageController extends GetxController {
  final textC = TextEditingController();

  final status = Status.none.obs;

  final url = ''.obs;

  final imageList = <String>[].obs;

  void downloadImage(String url) async {
    try {
      // Show loading dialog
      MyDialog.showLoadingDialog();

      // Log URL
      debugPrint('url: $url');

      // Fetch image bytes
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;

        // Get temporary directory
        final dir = await getTemporaryDirectory();

        // Write bytes to file
        final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

        // Log file path
        debugPrint('filePath: ${file.path}');

        // Save image to gallery
        final result = await ImageGallerySaver.saveFile(file.path);
        if (result != null && result.isNotEmpty) {
          // Hide loading
          Get.back();
          MyDialog.success('Image Downloaded to Gallery!');
        } else {
          // Hide loading
          Get.back();
          MyDialog.error('Failed to save image to gallery!');
        }
      } else {
        // Hide loading
        Get.back();
        MyDialog.error(
            'Failed to download image. Server returned status code: ${response.statusCode}');
        debugPrint(
            'Failed to download image. Server returned status code: ${response.statusCode}');
      }
    } catch (e) {
      // Hide loading
      Get.back();
      MyDialog.error('Something Went Wrong (Try again in sometime)!');
      debugPrint('downloadImageE: $e');
    }
  }

  // void shareImage() async {
  //   try {
  //     //To show loading
  //     MyDialog.showLoadingDialog();

  //     log('url: $url');

  //     final bytes = (await get(Uri.parse(url.value))).bodyBytes;
  //     final dir = await getTemporaryDirectory();
  //     final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

  //     log('filePath: ${file.path}');

  //     //hide loading
  //     Get.back();

  //     await Share.shareXFiles([XFile(file.path)],
  //         text:
  //             'Check out this Amazing Image created by Ai Assistant App by Harsh H. Rajpurohit');
  //   } catch (e) {
  //     //hide loading
  //     Get.back();
  //     MyDialog.error('Something Went Wrong (Try again in sometime)!');
  //     log('downloadImageE: $e');
  //   }
  // }

  Future<void> searchAiImage() async {
    //if prompt is not empty
    if (textC.text.trim().isNotEmpty) {
      status.value = Status.loading;

      imageList.value = await APIs.searchAiImages(textC.text);

      if (imageList.isEmpty) {
        MyDialog.error('Something went wrong (Try again in sometime)');

        return;
      }

      url.value = imageList.first;

      status.value = Status.complete;
    } else {
      MyDialog.info('Provide some beautiful image description!');
    }
  }
}
