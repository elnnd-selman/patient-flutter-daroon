import 'package:daroon_user/app/modules/user/user_invoice/controller/user_invoice_controller.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';

class UserInvoiceScreen extends GetView<UserInvoiceController> {
  const UserInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.whiteBGColor,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "My Voice",
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
            Obx(
              () => Text(
                "${controller.userVoiceList.length} Voice",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff898A8D),
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
            Obx(
              () => controller.processing.value
                  ? const Expanded(child: LoadingWidget())
                  : controller.userVoiceList.isEmpty
                      ? const Expanded(
                          child: NoDataWidget(
                            text: "No Voice Fund",
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: controller.userVoiceList.length,
                            itemBuilder: (context, index) {
                              return CustomCupertinoButton(
                                onTap: () {
                                  Get.toNamed(Routes.inVoiceDetail, arguments: [
                                    controller.userVoiceList[index].appointment!
                                        .fullName!,
                                    controller.userVoiceList[index].id,
                                  ]);
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.whiteBGColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.greyColor
                                            .withOpacity(.15),
                                        spreadRadius: 2,
                                        offset: const Offset(0, 0),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .userVoiceList[index]
                                            .appointment!
                                            .fullName!
                                            .capitalizeFirst!,
                                        style: AppTextStyles.bold.copyWith(
                                          fontSize:
                                              2 * SizeConfig.heightMultiplier,
                                        ),
                                      ),
                                      10.verticalSpace,
                                      Row(
                                        children: [
                                          Text(
                                            "Total Amount : ",
                                            style:
                                                AppTextStyles.semiBold.copyWith(
                                              fontSize: 1.7 *
                                                  SizeConfig.heightMultiplier,
                                            ),
                                          ),
                                          Text(
                                            "${controller.userVoiceList[index].appointment!.amountPaid} ${controller.userVoiceList[index].currency!}",
                                            style:
                                                AppTextStyles.semiBold.copyWith(
                                              fontSize: 1.7 *
                                                  SizeConfig.heightMultiplier,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      10.verticalSpace,
                                      Row(
                                        children: [
                                          Text(
                                            "Status : ",
                                            style:
                                                AppTextStyles.semiBold.copyWith(
                                              fontSize: 1.7 *
                                                  SizeConfig.heightMultiplier,
                                            ),
                                          ),
                                          Text(
                                            controller.userVoiceList[index]
                                                    .appointment!.isPaid!
                                                ? "Paid"
                                                : "Not Paid",
                                            style: AppTextStyles.semiBold
                                                .copyWith(
                                                    fontSize: 1.7 *
                                                        SizeConfig
                                                            .heightMultiplier,
                                                    color: controller
                                                            .userVoiceList[
                                                                index]
                                                            .appointment!
                                                            .isPaid!
                                                        ? AppColors.primaryColor
                                                        : Colors.red),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            )
          ],
        ),
      ),
    );
  }
}
