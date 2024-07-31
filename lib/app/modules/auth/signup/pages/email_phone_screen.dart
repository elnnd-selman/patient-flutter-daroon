import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EmailPhoneNumberScreen extends StatefulWidget {
  const EmailPhoneNumberScreen({super.key});

  @override
  State<EmailPhoneNumberScreen> createState() => _EmailPhoneNumberScreenState();
}

class _EmailPhoneNumberScreenState extends State<EmailPhoneNumberScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  List<Widget> accountTab = [
    const Tab(text: "Email"),
    const Tab(text: "Phone"),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text("Add email or phone",
                  style: AppTextStyles.bold.copyWith(
                    fontSize: 25,
                    color: AppColors.darkBlackBGColor,
                  )),
              const SizedBox(height: 10),
              Text(
                  "We will send a verification code to your email or phone number.",
                  style: AppTextStyles.medium.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff707281),
                  )),
              40.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 30,
                  child: TabBar(
                    controller: _tabController,
                    tabAlignment: TabAlignment.center,
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.13, vertical: 0),
                    padding: EdgeInsets.zero,
                    isScrollable: false,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: AppTextStyles.semiBold.copyWith(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                    dividerColor: const Color(0xffE4E4E4),
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    indicatorColor: AppColors.primaryColor,
                    unselectedLabelStyle: AppTextStyles.semiBold.copyWith(
                      fontSize: 15,
                      color: const Color(0xff808191),
                    ),
                    tabs: accountTab,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildEmailContainer(),
                    _buildPhoneContainer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final email = TextEditingController();
  final phone = TextEditingController();

  _buildEmailContainer() {
    return Column(
      children: [
        60.verticalSpace,
        TextFormField(
          style: AppTextStyles.medium.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: AppColors.blackBGColor,
          ),
          cursorColor: Colors.black,
          cursorWidth: 1,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
            fillColor: const Color(0xffF7F7F8),
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(15),
            ),
            isDense: true,
            hintText: "Email",
            hintStyle: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: const Color(0xffA0A1AB),
            ),
          ),
        ),
        // CommonTextfeild(
        //   scanIcons: false,
        //   obscuretext: false,
        //   hinttext: "Email",
        //   controller: email,
        //   keyboardType: TextInputType.emailAddress,
        //   showicon: false,
        //   validations: (value) {
        //     if (value!.isEmpty) {
        //       return "";
        //     } else if (!isEmailValidator(value)) {
        //       return "";
        //     }
        //     return null;
        //   },
        // ),
        const Spacer(),
        CommonButton(
            ontap: () {
              Get.toNamed(Routes.otpScreen);
            },
            name: "Send Code"),
        20.verticalSpace,
      ],
    );
  }

  _buildPhoneContainer() {
    return Column(
      children: [
        60.verticalSpace,
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xff6C5DD3),
              )),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {},
            onInputValidated: (bool value) {},
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: AppColors.primaryColor),
            textFieldController: phone,
            formatInput: false,
            maxLength: 9,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            cursorColor: Colors.black,
            inputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 15, left: 0),
              border: InputBorder.none,
              hintText: 'Phone Number',
              hintStyle: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: const Color(0xffA0A1AB),
              ),
            ),
            onSaved: (PhoneNumber number) {},
          ),
        ),
        const Spacer(),
        CommonButton(
            ontap: () {
              Get.toNamed(Routes.otpScreen);
            },
            name: "Send Code"),
        20.verticalSpace,
      ],
    );
  }
}
