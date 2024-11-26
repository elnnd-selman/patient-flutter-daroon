import 'package:daroon_user/app/modules/doctor_message/controller/user_message_controller.dart';
import 'package:daroon_user/app/modules/doctor_message/model/user_message_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UserMessageScreen extends GetView<UserMessageController> {
  const UserMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "Message",
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.blackBGColor,
              fontSize: 2 * SizeConfig.heightMultiplier,
            ),
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 6 * SizeConfig.widthMultiplier),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3 * SizeConfig.heightMultiplier),
            _buildPatientTextField(),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
            Obx(
              () => controller.isLoading.value
                  ? const Expanded(child: Center(child: LoadingWidget()))
                  : controller.doctorConversationList.isEmpty
                      ? const Expanded(
                          child: NoDataWidget(
                          text: "No chat available",
                        ))
                      : Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount:
                                  controller.doctorConversationList.length,
                              itemBuilder: (context, int index) {
                                return _buildChatContainer(
                                    controller.doctorConversationList[index],
                                    context);
                              }),
                        ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField _buildPatientTextField() {
    return TextFormField(
      style: AppTextStyles.medium.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: AppColors.blackBGColor,
      ),
      cursorColor: Colors.black12,
      cursorWidth: 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 0),
        fillColor: const Color(0xffF7F7F8),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset(
            Assets.serachIcon,
            colorFilter: const ColorFilter.mode(
                AppColors.lighttextColor, BlendMode.srcIn),
          ),
        ),
        isDense: true,
        hintText: "Search Patient",
        hintStyle: AppTextStyles.medium.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: const Color(0xff787B80),
        ),
      ),
    );
  }
}

CustomCupertinoButton _buildChatContainer(
  UserMessageModelData doctorMessageModelData,
  BuildContext context,
) {
  return CustomCupertinoButton(
    onTap: () {
      Get.toNamed(Routes.userChatRoom, arguments: [doctorMessageModelData]);
    },
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          // doctorMessageModelData.patient!.profilePicture == null
          //     ? Container(
          //         height: 6 * SizeConfig.heightMultiplier,
          //         width: 6 * SizeConfig.heightMultiplier,
          //         padding: const EdgeInsets.all(10),
          //         decoration: const BoxDecoration(
          //             color: AppColors.blackBGColor, shape: BoxShape.circle),
          //         child: Center(
          //           child: FittedBox(
          //             child: Text(
          //               '${doctorMessageModelData.patient!.firstName![0].toUpperCase()}${doctorMessageModelData.patient!.lastNameEn![0].toUpperCase()}',
          //               style: AppTextStyles.bold.copyWith(
          //                 color: Colors.white,
          //                 fontSize: Spaces.fontSize(fontSize: 18),
          //               ),
          //             ),
          //           ),
          //         ))
          //     : ClipOval(
          //         child: NetWorkImageLoader(
          //           shape: BoxShape.circle,
          //           boxFit: BoxFit.cover,
          //           height: 6 * SizeConfig.heightMultiplier,
          //           width: 6 * SizeConfig.heightMultiplier,
          //           imageURL:
          //               doctorMessageModelData.patient!.profilePicture!.md!,
          //         ),
          //       ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                doctorMessageModelData.patient!.firstName!,
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackBGColor,
                  fontSize: SizeConfig.heightMultiplier * 1.8,
                ),
              ),
              Text(
                doctorMessageModelData.messages.isEmpty
                    ? '--'
                    : doctorMessageModelData.messages[0],
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff707281),
                  fontSize: SizeConfig.heightMultiplier * 1.4,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
