import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:flutter/cupertino.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback ontap;
  final String name;
  final bool? isLoading;
  const CommonButton({
    super.key,
    required this.ontap,
    required this.name,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: isLoading!
              ? const ButtonLoader()
              : Text(
                  name,
                  style: AppTextStyles.bold.copyWith(
                    fontSize: 16,
                    color: AppColors.whiteBGColor,
                  ),
                ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback ontap;
  final String name;
  const CustomButton({
    super.key,
    required this.ontap,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoButton(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            name,
            style: AppTextStyles.bold.copyWith(
              fontSize: 16,
              color: AppColors.whiteBGColor,
            ),
          ),
        ),
      ),
    );
  }
}
