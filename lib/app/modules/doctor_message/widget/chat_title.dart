import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:flutter/material.dart';

class ChatTitle extends StatelessWidget {
  final int? chat;
  final String? avatar, message, time;
  final String? firstName;
  final String? lastName;
  final bool? showImage;
  final bool? isImageNull;
  const ChatTitle({
    super.key,
    this.chat,
    this.avatar,
    this.message,
    this.time,
    this.firstName,
    this.lastName,
    this.showImage,
    this.isImageNull,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        showImage!
            ? isImageNull!
                ? Container(
                    height: 6 * SizeConfig.heightMultiplier,
                    width: 6 * SizeConfig.heightMultiplier,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: AppColors.blackBGColor, shape: BoxShape.circle),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          '${firstName![0].toUpperCase()}${lastName![0].toUpperCase()}',
                          style: AppTextStyles.bold.copyWith(
                            color: Colors.white,
                            fontSize: Spaces.fontSize(
                                fontSize: 1.7 * SizeConfig.heightMultiplier),
                          ),
                        ),
                      ),
                    ))
                : ClipOval(
                    child: NetWorkImageLoader(
                      shape: BoxShape.circle,
                      boxFit: BoxFit.cover,
                      height: 6 * SizeConfig.heightMultiplier,
                      width: 6 * SizeConfig.heightMultiplier,
                      imageURL: avatar!,
                    ),
                  )
            : Text(
                '$time',
                style: AppTextStyles.normal.copyWith(
                    fontSize: 1.4 * SizeConfig.heightMultiplier,
                    color: const Color(0xff535353)),
              ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(
                left: 1 * SizeConfig.widthMultiplier,
                right: 1 * SizeConfig.widthMultiplier,
                top: 2 * SizeConfig.heightMultiplier),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 0
                  ? AppColors.primaryColor.withOpacity(0.05)
                  : AppColors.primaryColor.withOpacity(0.05),
              borderRadius: chat == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
            ),
            child: Text(
              '$message',
              style: AppTextStyles.normal.copyWith(
                  color: const Color(0xff11142D),
                  fontSize: 1.7 * SizeConfig.heightMultiplier),
            ),
          ),
        ),
        chat == 1
            ? Text(
                '$time',
                style: AppTextStyles.normal.copyWith(
                    fontSize: 1.4 * SizeConfig.heightMultiplier,
                    color: const Color(0xff535353)),
              )
            : const SizedBox(),
      ],
    );
  }
}
