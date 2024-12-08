import 'package:daroon_user/app/modules/user/user_home/pages/user_home_screen.dart';
import 'package:daroon_user/app/modules/user/user_invoice/controller/user_invoice_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UserInvoiceDetail extends StatefulWidget {
  const UserInvoiceDetail({super.key});

  @override
  State<UserInvoiceDetail> createState() => _UserInvoiceDetailState();
}

class _UserInvoiceDetailState extends State<UserInvoiceDetail>
    with WidgetsBindingObserver {
  final name = Get.arguments[0] as String;

  final id = Get.arguments[1] as String;

  final controller = Get.find<UserInvoiceController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserInvoiceController>(initState: (_) {
      controller.setData(name, id);
    }, builder: (_) {
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
              name.capitalizeFirst!,
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.blackBGColor,
                fontSize: 2 * SizeConfig.heightMultiplier,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffe0f3f2),
                ),
                child: Row(
                  children: [
                    Text(
                      "FIB",
                      style: AppTextStyles.bold.copyWith(
                        fontSize: 2.2 * SizeConfig.heightMultiplier,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/fibLogo.png",
                      width: 10 * SizeConfig.heightMultiplier,
                      fit: BoxFit.fitWidth,
                    )
                  ],
                ),
              ),
              30.verticalSpace,
              Text(
                "Please Select Account Type",
                style: AppTextStyles.semiBold.copyWith(
                  fontSize: 2 * SizeConfig.heightMultiplier,
                ),
              ),
              10.verticalSpace,
              Obx(
                () => controller.isLoading.value
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return ShimmerLoader(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 34, horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey.shade300,
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.accountTypeList.length,
                        itemBuilder: (context, index) {
                          return CustomCupertinoButton(
                            onTap: () {
                              controller.selectedIndex.value = index;
                            },
                            child: _buildAccountContainer(
                              name: controller.accountTypeList[index],
                              index: index,
                            ),
                          );
                        },
                      ),
              ),
              const Spacer(),
              CommonButton(
                name: "Continue to Pay",
                ontap: () {
                  if (controller.selectedIndex.value == -1) {
                    showToastMessage(
                        message: "Please select account type",
                        // ignore: use_build_context_synchronously
                        context: context,
                        color: const Color(0xffEC1C24),
                        icon: Icons.close);
                  } else {
                    if (controller.userSpecificVoiceModel.value != null) {
                      if (controller.selectedIndex.value == 0) {
                        _handleDeepLink(
                            url: controller.userSpecificVoiceModel.value!.data!
                                .data!.personalAppLink!,
                            context: context);
                      } else if (controller.selectedIndex.value == 1) {
                        _handleDeepLink(
                            url: controller.userSpecificVoiceModel.value!.data!
                                .data!.businessAppLink!,
                            context: context);
                      } else if (controller.selectedIndex.value == 2) {
                        _handleDeepLink(
                            url: controller.userSpecificVoiceModel.value!.data!
                                .data!.corporateAppLink!,
                            context: context);
                      }
                    } else {
                      showToastMessage(
                          message: "Please try again later",
                          // ignore: use_build_context_synchronously
                          context: context,
                          color: const Color(0xffEC1C24),
                          icon: Icons.close);
                    }
                  }
                },
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Future.delayed(const Duration(seconds: 2));
      checkPayment();
    }
  }

  bool isUpdated = false;

  checkPayment() {
    if (!isUpdated) {
      isUpdated = true;
      controller.checkPaymentPaid(id);
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _handleDeepLink({
    required String url,
    required BuildContext context,
  }) async {
    try {
      final fibUri = Uri.parse(url);
      if (await canLaunchUrl(fibUri)) {
        final launched = await launchUrl(
          fibUri,
          mode: LaunchMode.externalApplication,
        );
        if (launched) {
          return;
        }
      }

      throw Exception("Could not launch payment app or fallback URL");
    } catch (e) {
      showToastMessage(
          message: "Error launching payment app: $e",
          // ignore: use_build_context_synchronously
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
    }
  }

  Container _buildAccountContainer({
    required String name,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffe0f3f2),
      ),
      child: Row(
        children: [
          Obx(
            () => Container(
              height: 3.5 * SizeConfig.heightMultiplier,
              width: 3.5 * SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: controller.selectedIndex.value == index
                    ? AppColors.primaryColor
                    : AppColors.whiteBGColor,
                border: Border.all(
                  color: controller.selectedIndex.value == index
                      ? AppColors.primaryColor
                      : const Color(0xffE8E8E8),
                  width: 0.5,
                ),
              ),
              child: Icon(
                Icons.check,
                size: 2.2 * SizeConfig.heightMultiplier,
                color: AppColors.whiteBGColor,
              ),
            ),
          ),
          14.horizontalSpace,
          Text(
            name,
            style: AppTextStyles.semiBold.copyWith(
              fontSize: 1.8 * SizeConfig.heightMultiplier,
            ),
          ),
        ],
      ),
    );
  }
}
