import 'package:cached_network_image/cached_network_image.dart';
import 'package:daroon_user/app/modules/user/user_home/model/top_doctor_content_model.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/controller/post_comment_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/widget/comment_setion.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CommentBottomSheet extends GetView<PostCommentController> {
  final ContentData contentData;
  const CommentBottomSheet({
    super.key,
    required this.contentData,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PostCommentController());
    return CustomCupertinoButton(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.2 +
            MediaQuery.of(context).viewInsets.bottom,
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.only(
        //   top: MediaQuery.of(Get.context!).size.height * 0.08,
        // ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // padding: EdgeInsets.zero,
            // shrinkWrap: true,
            children: [
              SizedBox(height: 1.2 * SizeConfig.heightMultiplier),
              Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                    color: const Color(0xffE7E8EA),
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: 1.2 * SizeConfig.heightMultiplier),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                      contentData.user!.usePictureAsLink == false
                          ? Container(
                              height: 6 * SizeConfig.heightMultiplier,
                              width: 6 * SizeConfig.heightMultiplier,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: AppColors.blackBGColor,
                                  shape: BoxShape.circle),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    '${contentData.user!.firstName![0].toUpperCase()}${contentData.user!.firstName![0].toUpperCase()}',
                                    style: AppTextStyles.bold.copyWith(
                                      color: Colors.white,
                                      fontSize: Spaces.fontSize(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ))
                          : CircleAvatar(
                              radius: 14,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: contentData.user!.firstName!,
                                  fit: BoxFit.cover,
                                  height: 3.5 * SizeConfig.heightMultiplier,
                                  width: 3.5 * SizeConfig.heightMultiplier,
                                ),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(width: 2 * SizeConfig.widthMultiplier),
                  Flexible(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: .5 * SizeConfig.heightMultiplier),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: contentData.user!.firstName!,
                                    style: AppTextStyles.medium.copyWith(
                                      color: const Color(0xff11142D),
                                      fontWeight: FontWeight.w600,
                                    )),
                                TextSpan(
                                    text: "   ${contentData.contentEn!}",
                                    style: const TextStyle(
                                      color: Color(0xff11142D),
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
              Container(
                height: .5,
                color: const Color(0xffE4E4E4),
              ),
              SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
              const Expanded(child: CommentSection()),
              // const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.72,
                      child: TextFormField(
                        focusNode: controller.commentFieldFocusNode,
                        controller: controller.commentTextController,
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.blackBGColor,
                        ),
                        cursorColor: Colors.black12,
                        cursorWidth: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 14),
                          fillColor: const Color(0xffF7F7F8),
                          filled: true,
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffE7E8EA)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffE7E8EA)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffE7E8EA)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffE7E8EA)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffE7E8EA)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          isDense: true,
                          suffixIcon: CupertinoButton(
                            pressedOpacity: 0,
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            onPressed: () {
                              if (controller.selectedCommentIndex.value == -1) {
                                controller.sendCommentOnPost();
                              } else {
                                controller.replyOnComment();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                Assets.sendIcon,
                              ),
                            ),
                          ),
                          hintText: "Send Comment",
                          hintStyle: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: const Color(0xff535353),
                          ),
                        ),
                        onChanged: (val) {
                          if (val.isEmpty) {
                            controller.selectedCommentIndex.value = -1;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 2 * SizeConfig.widthMultiplier),
                  //
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffE4E4E4).withOpacity(.3),
                      border: Border.all(
                        color: const Color(0xffE4E4E4),
                      ),
                    ),
                    child: Center(
                      child: Text("😍",
                          style: AppTextStyles.medium.copyWith(
                            color: const Color(0xff11142D),
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(height: 1 * SizeConfig.heightMultiplier),
            ],
          ),
        ),
      ),
    );
  }
}
