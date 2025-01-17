import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_profile/controller/user_edit_profile_controller.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/json_message_extension.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserChangeNameController extends GetxController {
  RxBool isLoading = false.obs;

  RxBool processing = false.obs;

  final TextEditingController name = TextEditingController();

  final TextEditingController lastName = TextEditingController();

  setUserEmail(firstName, lastNameEN) {
    name.text = firstName;
    lastName.text = lastNameEN;
  }

  updateDoctorEmail({
    required BuildContext context,
  }) async {
    try {
      processing.value = true;
      final response = await ApiService.putWithHeader(
          userToken: {
            'Content-Type': 'application/json',
            "Authorization":
                "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
          },
          endPoint: '${AppTokens.apiURl}/users',
          body: {
            "firstName_en": name.text,
            "firstName": name.text,
            "lastName_en": lastName.text,
          });

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.back();
          Get.find<UserEditProfileController>().getUserProfileData();
          Get.find<UserEditProfileController>().imageUrl.value = '';
          Get.dialog(
            CupertinoAlertDialog(
              title: Column(
                children: [
                  10.verticalSpace,
                  SvgPicture.asset(
                    Assets.doneIcon,
                  ),
                  10.verticalSpace,
                  Text(
                    'All Done !',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bold.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  10.verticalSpace,
                ],
              ),
              content: Column(
                children: [
                  Text(
                    "You change your name \nsuccessfully !",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff979797),
                    ),
                  ),
                  10.verticalSpace,
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'Close',
                    style: AppTextStyles.bold.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff717171),
                    ),
                  ),
                ),
              ],
            ),
            barrierColor: Colors.black54,
          );
        } else {
          showToastMessage(
              message: response.body.extractErrorMessage(),
              context: context,
              color: const Color(0xffEC1C24),
              icon: Icons.close);
          printInfo(info: "Error While Updating  Email  ${response.body}");
        }
      }
      processing.value = false;
    } catch (e) {
      processing.value = false;
      printInfo(info: e.toString());
    }
  }
}
