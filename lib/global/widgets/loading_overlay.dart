import 'dart:ui';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:daroon_user/global/constants/app_colors.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4,
        sigmaY: 4,
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.transparent,
        child: const SpinKitSpinningLines(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      color: AppColors.primaryColor,
      size: 6 * SizeConfig.heightMultiplier,
    );
  }
}

class ButtonLoader extends StatelessWidget {
  const ButtonLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      itemCount: 3,
      color: AppColors.whiteBGColor,
      size: 2.3 * SizeConfig.heightMultiplier,
    );
  }
}
