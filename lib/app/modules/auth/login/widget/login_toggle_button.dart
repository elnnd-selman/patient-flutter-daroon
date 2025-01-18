import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInToggleButton extends StatelessWidget {
  const LogInToggleButton({
    super.key,
    this.leftText = 'Option 0',
    this.centreText = 'Option 1',
    this.rightText = 'Option 2',
    required this.value,
    required this.onValueChange,
    this.blackWidth,
  });

  final int value;
  final String leftText;
  final String rightText;
  final String centreText;
  final ValueChanged<int> onValueChange;
  final double? blackWidth;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(Get.context!).size.width;
    final widgetWidth = deviceWidth - 40;
    final capsuleWidth = widgetWidth * 0.5;
    return SizedBox(
      height: 5.5 * SizeConfig.heightMultiplier,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            // height: 43,
            width: widgetWidth,
            decoration: const BoxDecoration(
              color: Color(0xffF7F7F8),
              // border: Border.all(
              //   color: const Color(0xffC4C4C4).withOpacity(0.5),
              // ),
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticOut,
            // top: 3,
            // top: 1*SizeConfig.heightMultiplier,
            left: value == 0
                ? 1 * SizeConfig.widthMultiplier
                : value == 1
                    ? deviceWidth * 0.72 - capsuleWidth * 0.6
                    : null,
            right: value == 1 ? 1 * SizeConfig.widthMultiplier : null,
            child: Container(
              width: capsuleWidth,
              height: 40,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(14)
                  // borderRadius: BorderRadius.only(
                  //   topLeft:
                  // ),
                  ),
            ),
          ),
          SizedBox(
            // width: widgetWidth,
            child: Row(
              children: [
                Expanded(
                  child: CustomCupertinoButton(
                    onTap: () => onValueChange(0),
                    child: Center(
                      child: Text(
                        leftText,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.semiBold.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 1.8 * SizeConfig.heightMultiplier,
                          color: value == 0
                              ? AppColors.whiteBGColor
                              : const Color(0xff979797),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCupertinoButton(
                    onTap: () => onValueChange(1),
                    child: Text(
                      centreText,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.semiBold.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 1.8 * SizeConfig.heightMultiplier,
                        color: value == 1
                            ? AppColors.whiteBGColor
                            : const Color(0xff979797),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
