// import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:daroon_user/app/routes/app_routes.dart';
// import 'package:daroon_user/generated/assets.dart';
// import 'package:daroon_user/global/constants/app_colors.dart';
// import 'package:daroon_user/global/utils/app_text_style.dart';

// class LoginSelectionScreen extends StatelessWidget {
//   const LoginSelectionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Center(
//               child: Image.asset(
//                 Assets.appLogo,
//                 width: 90,
//               ),
//             ),
//             SizedBox(height: size.height * 0.13),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               decoration: BoxDecoration(
//                 color: AppColors.primaryColor,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 40,
//                     width: 40,
//                     decoration: BoxDecoration(
//                         color: AppColors.whiteBGColor,
//                         borderRadius: BorderRadius.circular(15),
//                         image: const DecorationImage(
//                           image: AssetImage(Assets.googleLogo),
//                           fit: BoxFit.contain,
//                         )),
//                   ),
//                   Center(
//                     child: Text(
//                       "Login with Google",
//                       style: AppTextStyles.bold.copyWith(
//                         fontSize: 15,
//                         color: AppColors.whiteBGColor,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 30),
//                 ],
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 15),
//               width: size.width,
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
//               decoration: BoxDecoration(
//                 color: const Color(0xffF7F7F8),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Center(
//                 child: Text(
//                   "Sign up with email or phone number",
//                   style: AppTextStyles.bold.copyWith(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                     color: AppColors.primaryColor,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: _dividerContainer(),
//                 ),
//                 const SizedBox(width: 10),
//                 Text(
//                   "Or",
//                   style: AppTextStyles.semiBold.copyWith(
//                     fontSize: 13,
//                     color: const Color(0xffA0A1AB),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(child: _dividerContainer()),
//               ],
//             ),
//             const SizedBox(height: 16),
//             HaveAccount(
//               title: "Already have an account? ",
//               subtitle: "Sign in",
//               titleStyle: AppTextStyles.medium.copyWith(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: const Color(0xff707281),
//               ),
//               subtitleStyle: AppTextStyles.bold
//                   .copyWith(fontSize: 16, color: AppColors.primaryColor),
//               ontap: () {
//                 Get.offAllNamed(Routes.login);
//               },
//             ),
//             SizedBox(height: size.height * 0.18)
//           ],
//         ),
//       ),
//     );
//   }

//   Container _dividerContainer() {
//     return Container(
//       height: 0.5,
//       // width: size.width / 2.5,
//       color: const Color(0xffE7E8EA),
//     );
//   }
// }

import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback ontap;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  const HaveAccount({
    super.key,
    required this.title,
    required this.subtitle,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: titleStyle),
        CustomCupertinoButton(
          onTap: ontap,
          child: Text(subtitle, style: subtitleStyle),
        ),
      ],
    );
  }
}
