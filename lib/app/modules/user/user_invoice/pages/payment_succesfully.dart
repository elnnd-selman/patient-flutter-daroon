import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSuccesfully extends StatelessWidget {
  PaymentSuccesfully({super.key});

  final isPaid = Get.arguments[0] as bool;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15 * SizeConfig.heightMultiplier),
          Center(
            child: Image.asset(
              isPaid
                  ? 'assets/images/payment_successfu.png'
                  : "assets/images/payment-failure.png",
              height: 20 * SizeConfig.heightMultiplier,
              color: isPaid ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(height: 4 * SizeConfig.heightMultiplier),
          Text(
            isPaid ? "Payment Successful" : "Payment Failed",
            textAlign: TextAlign.center,
            style: AppTextStyles.bold.copyWith(
              fontSize: 22,
              color: isPaid ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(height: 1 * SizeConfig.heightMultiplier),
          Text(
            isPaid
                ? "Your payment has been paid"
                : "Your payment has been failed, Please try again!",
            textAlign: TextAlign.center,
            style: AppTextStyles.normal.copyWith(
              fontSize: 14,
              color: const Color(0xff707281),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CommonButton(
              ontap: () {
                Get.back();
              },
              name: 'Back',
            ),
          )
        ],
      ),
    );
  }
}
