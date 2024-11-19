import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorProfileToggleButton extends StatelessWidget {
  const DoctorProfileToggleButton({
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
    final capsuleWidth = widgetWidth * 0.37;
    return SizedBox(
      height: 47,
      width: deviceWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: widgetWidth,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.03),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticOut,
            top: 3,
            left: value == 0
                ? 0
                : value == 1
                    ? deviceWidth * 0.5 - capsuleWidth * 0.6
                    : null,
            right: value == 2 ? 0 : null,
            child: Container(
              width: blackWidth ?? capsuleWidth,
              height: 41,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.06),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
          SizedBox(
            width: widgetWidth,
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
                          color: value == 0
                              ? Colors.black
                              : AppColors.lighttextColor,
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
                        color: value == 1
                            ? Colors.black
                            : AppColors.lighttextColor,
                      ),
                    ),
                  ),
                ),
                // .horizontalSpace,
                Expanded(
                  child: CustomCupertinoButton(
                    onTap: () => onValueChange(2),
                    child: Center(
                      child: Text(
                        rightText,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.semiBold.copyWith(
                          color: value == 2
                              ? Colors.black
                              : AppColors.lighttextColor,
                        ),
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
