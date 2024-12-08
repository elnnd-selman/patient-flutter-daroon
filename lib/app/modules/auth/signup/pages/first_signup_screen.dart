import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/signup/controller/signup_controller.dart';
import 'package:daroon_user/app/modules/on_boarding/pages/login_selection_screen.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/auth_text_field.dart';
import 'package:daroon_user/global/widgets/common_button.dart';

class FirstSignupScreen extends GetView<SignUpCtrl> {
  const FirstSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            )),
      ),
      backgroundColor: AppColors.whiteBGColor,
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Form(
            key: form,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Text("Create account",
                            style: AppTextStyles.bold.copyWith(
                              fontSize: 25,
                              color: AppColors.darkBlackBGColor,
                            )),
                        const SizedBox(height: 30),
                        Text("create account to use app features.",
                            style: AppTextStyles.medium.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              // fontFamily: ksecondaryFontFamily,
                              color: const Color(0xff707281),
                            )),
                        14.verticalSpace,
                        CommonTextfeild(
                          scanIcons: false,
                          obscuretext: false,
                          hinttext: "First name",
                          controller: controller.firstNameEN,
                          keyboardType: TextInputType.emailAddress,
                          showicon: false,
                          validations: (value) {
                            if (value!.isEmpty) {
                              return "Enter First name ";
                            }
                            return null;
                          },
                        ),
                        15.verticalSpace,
                        CommonTextfeild(
                          scanIcons: false,
                          obscuretext: false,
                          hinttext: "Last name",
                          controller: controller.lastNameEN,
                          keyboardType: TextInputType.emailAddress,
                          showicon: false,
                          validations: (value) {
                            if (value!.isEmpty) {
                              return "Enter Last name ";
                            }
                            return null;
                          },
                        ),
                        15.verticalSpace,
                        Obx(
                          () => _buildTimeContainer(
                              title: controller.birthDate.value == null
                                  ? "Birth Date"
                                  : controller
                                      .formatDate(controller.birthDate.value!),
                              ontap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                Get.bottomSheet(
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    height: MediaQuery.of(context).size.height *
                                        0.45,
                                    decoration: const BoxDecoration(
                                        color: AppColors.whiteBGColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(24),
                                            topRight: Radius.circular(24))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () => Get.back(),
                                          child: Text(
                                            "Done",
                                            style: AppTextStyles.bold.copyWith(
                                                color: AppColors.primaryColor,
                                                fontSize: 18),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Expanded(
                                          child: CupertinoDatePicker(
                                            itemExtent: 100,
                                            initialDateTime: DateTime.now(),
                                            backgroundColor:
                                                AppColors.whiteBGColor,
                                            mode: CupertinoDatePickerMode.date,
                                            onDateTimeChanged: (date) {
                                              controller.birthDate.value = date;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        15.verticalSpace,
                        DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xffF7F7F8),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.borderColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.borderColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 2.2 * SizeConfig.heightMultiplier),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.borderColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          hint: Text(
                            'Select Your Gender',
                            style: AppTextStyles.medium.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: const Color(0xffA0A1AB),
                            ),
                          ),
                          items: controller.genderList
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: AppTextStyles.medium.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: AppColors.blackBGColor,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return '   Please select gender';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            controller.selectedGender.value = value.toString();
                          },
                          onSaved: (value) {
                            controller.selectedGender.value = value.toString();
                          },
                          buttonStyleData: ButtonStyleData(
                            padding: EdgeInsets.only(
                                right: 4 * SizeConfig.widthMultiplier),
                          ),
                          iconStyleData: IconStyleData(
                            icon: SvgPicture.asset("assets/icons/downIcon.svg"),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            elevation: 0,
                            decoration: BoxDecoration(
                              color: const Color(0xffF7F7F8),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                        const Spacer(),
                        20.verticalSpace,
                        CommonButton(
                            ontap: () {
                              if (form.currentState!.validate() &&
                                  controller.birthDate.value != null) {
                                Get.toNamed(Routes.singup);
                              } else if (controller.birthDate.value == null) {
                                showToastMessage(
                                    message: "Please select birth date",
                                    context: context,
                                    color: const Color(0xffEC1C24),
                                    icon: Icons.close);
                              }
                            },
                            name: "Next"),
                        5.verticalSpace,
                        HaveAccount(
                          title: "Already have an account? ",
                          subtitle: "Log in",
                          titleStyle: AppTextStyles.medium.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff11142D),
                          ),
                          subtitleStyle: AppTextStyles.bold.copyWith(
                              fontSize: 16, color: AppColors.primaryColor),
                          ontap: () {
                            Get.back();
                          },
                        ),
                        10.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  CustomCupertinoButton _buildTimeContainer({
    required String title,
    required Function()? ontap,
  }) {
    return CustomCupertinoButton(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 4 * SizeConfig.widthMultiplier,
            vertical: 2.2 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffF7F7F8),
          border: Border.all(
            color: const Color(0xffE7E8EA),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              Assets.calendarIcon,
              height: 2.5 * SizeConfig.heightMultiplier,
            ),
            10.horizontalSpace,
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.heightMultiplier * 1.7,
                color: const Color(0xff535353),
              ),
            ),
            const Spacer(),
            SvgPicture.asset("assets/icons/downIcon.svg"),
          ],
        ),
      ),
    );
  }
}
