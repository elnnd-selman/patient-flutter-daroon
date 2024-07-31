import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/on_boarding/model/on_boarding_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/app_constants.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          PageView.builder(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (ctx, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      onboardingModelList[index].imageUrl,
                      height: size.height * 0.65,
                    ),
                  ],
                );
              }),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.lightgreyColor.withOpacity(0.1),
                        spreadRadius: 6,
                        blurRadius: 6,
                        offset: const Offset(-1, 1))
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      onboardingModelList[currentIndex].title,
                      style: AppTextStyles.medium.copyWith(
                        fontSize: 28,
                        letterSpacing: 1,
                        color: AppColors.primaryColor,
                        fontFamily: ksecondaryFontFamily,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      onboardingModelList[currentIndex].subTitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.medium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightgreyColor,
                        fontFamily: ksecondaryFontFamily,
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                3,
                                (index) => Container(
                                      height: 7,
                                      width: currentIndex == index ? 20 : 7,
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: currentIndex == index
                                            ? AppColors.primaryColor
                                            : AppColors.dotColor,
                                      ),
                                    )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.04),
                    GestureDetector(
                      onTap: () {
                        currentIndex == 2
                            ? Get.offNamed(Routes.loginSelectionScreen)
                            : _controller!.nextPage(
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 400),
                              );
                      },
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            currentIndex == 2 ? "Get Start" : "Next",
                            style: AppTextStyles.semiBold.copyWith(
                              fontSize: 16,
                              color: AppColors.whiteBGColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
