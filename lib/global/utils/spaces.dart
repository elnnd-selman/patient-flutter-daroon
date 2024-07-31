import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Spaces {
//height
  static double height4 = MediaQuery.of(Get.context!).size.height * .005;
  static double height5 = MediaQuery.of(Get.context!).size.height * .00625;
  static double height6 = MediaQuery.of(Get.context!).size.height * .0075;
  static double height8 = MediaQuery.of(Get.context!).size.height * .01;
  static double height10 = MediaQuery.of(Get.context!).size.height * .0125;
  static double height12 = MediaQuery.of(Get.context!).size.height * .015;
  static double height14 = MediaQuery.of(Get.context!).size.height * .0175;
  static double height16 = MediaQuery.of(Get.context!).size.height * .02;
  static double height18 = MediaQuery.of(Get.context!).size.height * .0225;
  static double height20 = MediaQuery.of(Get.context!).size.height * .025;
  static double height22 = MediaQuery.of(Get.context!).size.height * .0275;
  static double height24 = MediaQuery.of(Get.context!).size.height * .03;
  static double height26 = MediaQuery.of(Get.context!).size.height * .0325;
  static double height28 = MediaQuery.of(Get.context!).size.height * .035;
  static double height30 = MediaQuery.of(Get.context!).size.height * .0375;
  static double height32 = MediaQuery.of(Get.context!).size.height * .04;
  static double height36 = MediaQuery.of(Get.context!).size.height * .045;
  static double height40 = MediaQuery.of(Get.context!).size.height * .05;
  static double height50 = MediaQuery.of(Get.context!).size.height * .0625;
  static double height100 = MediaQuery.of(Get.context!).size.height * .125;
  static double height120 = MediaQuery.of(Get.context!).size.height * .15;
  static double height150 = MediaQuery.of(Get.context!).size.height * .1875;
  static double height200 = MediaQuery.of(Get.context!).size.height * .25;
  //width
  static double width4 = MediaQuery.of(Get.context!).size.width * .011111;
  static double width5 = MediaQuery.of(Get.context!).size.width * .013889;
  static double width6 = MediaQuery.of(Get.context!).size.width * .016667;
  static double width8 = MediaQuery.of(Get.context!).size.width * .02223;
  static double width10 = MediaQuery.of(Get.context!).size.width * .02778;
  static double width12 = MediaQuery.of(Get.context!).size.width * .03334;
  static double width14 = MediaQuery.of(Get.context!).size.width * .03889;
  static double width16 = MediaQuery.of(Get.context!).size.width * .04445;
  static double width18 = MediaQuery.of(Get.context!).size.width * .05;
  static double width20 = MediaQuery.of(Get.context!).size.width * .05556;
  static double width22 = MediaQuery.of(Get.context!).size.width * .0611;
  static double width24 = MediaQuery.of(Get.context!).size.width * .06667;
  static double width26 = MediaQuery.of(Get.context!).size.width * .07222;
  static double width28 = MediaQuery.of(Get.context!).size.width * .07777;
  static double width30 = MediaQuery.of(Get.context!).size.width * .083334;
  static double width32 = MediaQuery.of(Get.context!).size.width * .08889;
  static double width36 = MediaQuery.of(Get.context!).size.width * .1;
  static double width40 = MediaQuery.of(Get.context!).size.width * .1111;
  static double width50 = MediaQuery.of(Get.context!).size.width * .13889;
  static double width100 = MediaQuery.of(Get.context!).size.width * .2778;
  static double width120 = MediaQuery.of(Get.context!).size.width * .3333;
  static double width150 = MediaQuery.of(Get.context!).size.width * .4167;
  static double width200 = MediaQuery.of(Get.context!).size.width * .555;

  static double fontSize({required double fontSize}) {
    return fontSize * (MediaQuery.of(Get.context!).size.width / 390);
  }

  static double getWidthWithFactor({required double width}) {
    return width * (MediaQuery.of(Get.context!).size.width / 400);
  }

  static double getWidth({required double width}) {
    return MediaQuery.of(Get.context!).size.width * (width / 428);
  }

  static double getHeight({required double height}) {
    return MediaQuery.of(Get.context!).size.height * (height / 926);
  }
}
