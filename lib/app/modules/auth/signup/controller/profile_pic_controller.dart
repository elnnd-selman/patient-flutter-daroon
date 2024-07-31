import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

import 'package:image_picker/image_picker.dart';

class ProfilePicController extends GetxController {
  RxBool isNoPhoto = true.obs;
  final imagePicker = ImagePicker();
  late File image;
  String? selectedImageName;
  RxString? selectedimageName = "".obs;

  final _processing = false.obs;
  bool get processing => _processing.value;

  Future<void> addPhoto(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                _getGalleryImage();
                Navigator.pop(context);
              },
              child: Text('Gallery Image',
                  style: AppTextStyles.medium.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    // fontFamily: ksecondaryFontFamily,
                    color: AppColors.blackBGColor,
                  )),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                _getCameraImage();
                Navigator.pop(context);
              },
              child: Text('Camera Image',
                  style: AppTextStyles.medium.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    // fontFamily: ksecondaryFontFamily,
                    color: AppColors.blackBGColor,
                  )),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel',
                style: AppTextStyles.medium.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  // fontFamily: ksecondaryFontFamily,
                  color: AppColors.blackBGColor,
                )),
          ),
        );
      },
    );
  }

  Future _getGalleryImage() async {
    imagePicker
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 800,
      maxWidth: 800,
    )
        .then((value) async {
      if (value != null) {
        image = File(value.path);

        selectedimageName!.value = value.path;

        isNoPhoto.value = false;
        image = await compress(image: image);
        selectedImageName = path.basename(image.path);
        update();
      } else {
        selectedImageName = '';
      }
    });
  }

  Future _getCameraImage() async {
    imagePicker
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxHeight: 800,
      maxWidth: 800,
    )
        .then((value) async {
      if (value != null) {
        image = File(value.path);
        selectedimageName!.value = value.path;
        update();
        isNoPhoto.value = false;
        // image = await compress(image: image);
        selectedImageName = 'captured-image.jpg';
      } else {
        selectedImageName = '';
      }
    });
  }

  static Future<File> compress({
    required File image,
    int quality = 100,
    int percentage = 70,
  }) async {
    final path = await FlutterNativeImage.compressImage(
      image.absolute.path,
      quality: quality,
      percentage: percentage,
    );
    return path;
  }

  uploadProfilePic({
    required String image,
    required String userToken,
    required BuildContext context,
  }) async {
    _processing.value = true;
    final response = await ApiService.patchImage(
      filepath: image,
      userToken: userToken,
      url: '${AppTokens.apiURl}/users/profile-picture',
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      _processing.value = false;
      showToastMessage(
          message: "Successfully Picture uploaded",
          // ignore: use_build_context_synchronously
          context: context,
          color: const Color(0xff5BA66B),
          icon: Icons.check);
      Get.offAllNamed(Routes.welcome);
    } else {
      _processing.value = false;
      showToastMessage(
          message: "Issue while uploading Picture",
          // ignore: use_build_context_synchronously
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
    }
  }
}
