import 'package:flutter/material.dart';
import 'package:daroon_user/global/constants/app_colors.dart';

class SocailContainer extends StatelessWidget {
  final String imageUrl;
  final VoidCallback ontap;
  final double height;
  const SocailContainer({
    super.key,
    required this.imageUrl,
    required this.ontap,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.whiteBGColor,
          // color: const Color(0xffC4C4C4),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xffE7E8EA)),
          // image: const DecorationImage(
          //   image: AssetImage(Assets.googleLogo),
          //   fit: BoxFit.contain,
          // ),
        ),
        child: Image.asset(
          imageUrl,
          height: height,
        ),
      ),
    );
  }
}
