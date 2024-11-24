import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_podcast/model/comment_model.dart';
import 'package:daroon_user/app/modules/user/user_podcast/model/user_podcast_model.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class PresenterPodcastDetailCtrl extends GetxController {
  Rxn<PodCastModel> podCastModel = Rxn();
  final processing = false.obs;
  final scrollController = PageController();

  final commentFieldFocusNode = FocusNode();
  final commentTextController = RichTextController(
    targetMatches: [
      MatchTargetItem(
        regex: RegExp(r'\B@[a-zA-Z\d._]+\b'),
        style: AppTextStyles.medium.copyWith(
          color: AppColors.primaryColor,
          fontSize: 15,
        ),
      )
    ],
    onMatch: (data) {},
  );
  setData(PodCastModel data) {
    podCastModel.value = data;
    getPostComment(data.id!);
    postID.value = data.id!;
  }

  //////////////
  RxBool commentsLoading = false.obs;
  RxList<CommentReplyModel> commetnModelList = <CommentReplyModel>[].obs;
  getPostComment(String postID) async {
    commentsLoading.value = true;
    // content/66fc53279a950595e01369de/comments
    final response = await ApiService.getwithUserToken(
      endPoint: '${AppTokens.apiURl}/contents/$postID/comments',
      userToken: {
        "Authorization":
            "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
      },
    );
    if (response!.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      commetnModelList.value = List<CommentReplyModel>.from(
          jsonData["data"]!.map((x) => CommentReplyModel.fromJson(x)));
    }
    commentsLoading.value = false;
  }

  String getCommentTimeDifference({required int commentIndex}) {
    final creationTime = commetnModelList[commentIndex].createdAt!;
    final now = Timestamp.now().toDate();
    final years = (now.difference(creationTime).inMinutes / 525600).round();
    final months = (now.difference(creationTime).inMinutes / 43800).round();
    final days = now.difference(creationTime).inDays;
    final hours = now.difference(creationTime).inHours;
    final minutes = now.difference(creationTime).inMinutes;
    final seconds = now.difference(creationTime).inSeconds;

    if (years != 0) {
      return '${years}y ago';
    } else {
      if (months != 0) {
        return '${months}M ago';
      } else {
        if (days != 0) {
          return '${days}d ago';
        } else {
          if (hours != 0) {
            return '${hours}h ago';
          } else {
            if (minutes != 0) {
              return '${minutes}min ago';
            } else {
              if (seconds != 0) {
                return '${seconds}s ago';
              } else {
                return 'Just Now';
              }
            }
          }
        }
      }
    }
  }

  final selectedCommentIndex = RxInt(-1);
  void setReplyMode({
    required int commentIndex,
    int replyIndex = -1,
  }) async {
    selectedCommentIndex.value = commentIndex;
    if (replyIndex == -1) {
      // CChnage Commetn To your Name
      commentTextController.text =
          '@${commetnModelList[selectedCommentIndex.value].user!.username!} ';
    } else {
      commentTextController.text =
          '@${commetnModelList[selectedCommentIndex.value].replies[replyIndex].user!.username!} ';
    }
    commentTextController.selection = TextSelection.fromPosition(
      TextPosition(offset: commentTextController.value.text.length),
    );

    commentFieldFocusNode.requestFocus();
  }

  String getReplyTimeDifference({
    required int commentIndex,
    required int replyID,
  }) {
    final creationTime =
        commetnModelList[commentIndex].replies[replyID].createdAt!;
    final now = Timestamp.now().toDate();
    final years = (now.difference(creationTime).inMinutes / 525600).round();
    final months = (now.difference(creationTime).inMinutes / 43800).round();
    final days = now.difference(creationTime).inDays;
    final hours = now.difference(creationTime).inHours;
    final minutes = now.difference(creationTime).inMinutes;
    final seconds = now.difference(creationTime).inSeconds;

    if (years != 0) {
      return '${years}y ago';
    } else {
      if (months != 0) {
        return '${months}M ago';
      } else {
        if (days != 0) {
          return '${days}d ago';
        } else {
          if (hours != 0) {
            return '${hours}h ago';
          } else {
            if (minutes != 0) {
              return '${minutes}min ago';
            } else {
              if (seconds != 0) {
                return '${seconds}s ago';
              } else {
                return 'Just Now';
              }
            }
          }
        }
      }
    }
  }

  sendCommentOnPost() async {
    try {
      final response = await ApiService.postwithHeader(
        userToken: {
          'Content-Type': 'application/json',
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
        endPoint: '${AppTokens.apiURl}/comments/contents/$postID',
        body: {
          "comment": commentTextController.text.trim(),
        },
      );

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          final jsonData = jsonDecode(response.body);

          commetnModelList.add(CommentReplyModel.fromJson(jsonData['data']));
          commetnModelList.refresh();
          commentTextController.clear();
        } else {
          printInfo(
              info: "Error While Updating Assistant Address ${response.body}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  RxString postID = "".obs;
  replyOnComment() async {
    try {
      final response = await ApiService.postwithHeader(
        userToken: {
          'Content-Type': 'application/json',
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
        endPoint:
            '${AppTokens.apiURl}/contents/${postID.value}/comments/${commetnModelList[selectedCommentIndex.value].id}/replay',
        body: {
          "comment": commentTextController.text.trim(),
        },
      );

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          final jsonData = jsonDecode(response.body);

          commetnModelList[selectedCommentIndex.value]
              .replies
              .add(ReplyModel.fromJson(jsonData['data']));
          selectedCommentIndex.value = -1;
          commetnModelList.refresh();
          commentTextController.clear();
        } else {
          printInfo(
              info: "Error While Updating Assistant Address ${response.body}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  updateLikeOnPost() async {
    final response = await ApiService.postwithHeader(
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}"
        },
        endPoint:
            '${AppTokens.apiURl}/likes/contents/${podCastModel.value!.id}',
        body: {});
    if (response != null) {
      if (response.statusCode == 201 || response.statusCode == 200) {
        if (podCastModel.value!.isLiked!) {
          podCastModel.value!.isLiked = false;
          podCastModel.value!.likes = podCastModel.value!.likes! - 1;
        } else {
          podCastModel.value!.isLiked = true;
          podCastModel.value!.likes = podCastModel.value!.likes! + 1;
        }
        podCastModel.refresh();
        podCastModel.refresh();
      } else {
        printInfo(info: "Not Like${response.body}");
      }
    }
  }
}
