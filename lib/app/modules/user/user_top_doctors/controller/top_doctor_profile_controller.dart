import 'dart:async';
import 'dart:convert';

import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_home/model/top_doctor_content_model.dart';
import 'package:daroon_user/app/modules/user/user_offer/model/user_offer_model.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class TopDoctorProfileController extends GetxController {
  final _selectedTab = 0.obs;
  int get selectedTab => _selectedTab.value;
  // RxInt currentPage = 0.obs;
  RxInt totalPages = 1.obs;
  RxBool isLoading = false.obs;
  RxBool processing = false.obs;

  void selectTab(int value) {
    _selectedTab.value = value;
  }

  final Completer<GoogleMapController> completer =
      Completer<GoogleMapController>();

  // Rxn<ContentModel> contentModelList = Rxn();
  RxList<ContentData> contentModelList = <ContentData>[].obs;
  RxList<String> getPostType = [
    "All Posts",
    "Image",
    "Videos",
    "Text",
  ].obs;

  RxString selecetdPostType = 'All Posts'.obs;

  RxInt currentRecord = 0.obs;
  RxInt currentPage = 1.obs;
  RxInt totalRecord = RxInt(-1);
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(51.174179, 6.610550),
    zoom: 12.4746,
  );

  RxList<Marker> markers = <Marker>[].obs;
  RxBool isSetting = false.obs;
  setMarker(TopDoctorModel doctorData) async {
    isSetting.value = true;
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/icons_png/location_icon.png', 80);
    for (int i = 0; i < doctorData.offices.length; i++) {
      if (i == 0) {
        kGooglePlex = CameraPosition(
          target: LatLng(doctorData.offices[i].address!.coordinate!.latitude!,
              doctorData.offices[i].address!.coordinate!.longitude!),
          zoom: 12.4746,
        );
      }
      markers.add(
        Marker(
          // ignore: deprecated_member_use
          icon: BitmapDescriptor.fromBytes(markerIcon),
          markerId: MarkerId(doctorData.offices[i].id!),
          position: LatLng(doctorData.offices[i].address!.coordinate!.latitude!,
              doctorData.offices[i].address!.coordinate!.longitude!),
          infoWindow: InfoWindow(
              title: doctorData.offices[i].title,
              snippet: doctorData.offices[i].description),
        ),
      );
    }
    await getDoctorOfersData(doctorData.id!);
    isSetting.value = false;
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  getDoctorPost({
    required String postType,
  }) async {
    isLoading.value = true;
    currentPage.value = 1;
    currentRecord.value = 0;
    contentModelList.value = [];

    try {
      if (kDebugMode) {
        print(Get.find<UserHomeController>().userModel.value!.user!.id);
        print(Get.find<UserHomeController>().userModel.value!.token!);
      }

      final response = await ApiService.getwithUserToken(
        endPoint:
            '${AppTokens.apiURl}/contents/my-contents?pagination=1&limit=10&contentType=${postType == 'All Posts' ? 'post' : postType.toLowerCase()}',
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);

        RxList<ContentData> tempList = <ContentData>[].obs;

        totalRecord.value = jsonData["totalRecord"];

        tempList.value = List<ContentData>.from(
            jsonData["data"]!.map((x) => ContentData.fromJson(x)));

        contentModelList = contentModelList + tempList;
        currentRecord.value = contentModelList.length;
      } else {
        printError(info: response.body);
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      printInfo(info: e.toString());
    }
    isLoading.value = false;
  }

  postInApiReFetch(String postType) async {
    currentPage = currentPage + 1;

    final response = await ApiService.getwithUserToken(
      endPoint:
          '${AppTokens.apiURl}/contents/my-contents?pagination=$currentPage&limit=10&contentType=$postType',
      userToken: {
        "Authorization":
            "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
      },
    );
    if (response!.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      final tempList = <ContentData>[].obs;

      tempList.value = List<ContentData>.from(
          jsonData["data"]!.map((x) => ContentData.fromJson(x)));

      contentModelList = contentModelList + tempList;
      currentRecord.value = contentModelList.length;
    }
  }

  String convertDateToformat(String date) {
    DateTime dateTime = DateTime.parse(date);
    DateFormat formatter = DateFormat('dd-MMM-yyyy');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  updateLikeOnPost({
    required ContentData contentData,
    required int index,
  }) async {
    final response = await ApiService.postwithHeader(
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}"
        },
        endPoint: '${AppTokens.apiURl}/likes/contents/${contentData.id}',
        body: {});
    if (response != null) {
      if (response.statusCode == 201 || response.statusCode == 200) {
        if (contentModelList[index].isLiked!) {
          contentModelList[index].isLiked = false;
          contentModelList[index].likes = contentModelList[index].likes! - 1;
        } else {
          contentModelList[index].isLiked = true;
          contentModelList[index].likes = contentModelList[index].likes! + 1;
        }
        contentModelList.refresh();
      } else {
        printInfo(info: "Not Like${response.body}");
      }
    }
  }

  // Rxn<UserProfileModel> userProfileModel = Rxn();
  // getUserProfileData() async {
  //   processing.value = true;
  //   final response = await ApiService.getwithUserToken(
  //     endPoint: '${AppTokens.apiURl}/doctors/profile',
  //     userToken: {
  //       "Authorization":
  //           "Bearer ${Get.find<DoctorHomeController>().userModel.value!.token!}",
  //     },
  //   );

  //   if (response!.statusCode == 200 || response.statusCode == 201) {
  //     final jsonData = jsonDecode(response.body);
  //     userProfileModel.value = UserProfileModel.fromJson(jsonData);
  //   } else if (response.statusCode == 401) {
  //     final jsonData = jsonDecode(response.body);
  //     if (jsonData["message"] == "unauthorized") {
  //       Get.find<DoctorHomeController>().signOutUser();
  //     }
  //   }
  //   processing.value = false;
  // }

  // checkLanguageExist(String langName) {
  //   bool langExist = false;
  //   langExist =
  //       userProfileModel.value!.userProfile!.languages.contains(langName);
  //   return langExist;
  // }

  // deletePost(
  //     {required ContentData contentData,
  //     required int index,
  //     required BuildContext context}) async {
  //   final response = await ApiService.deleteWithHeader(
  //     userToken: {
  //       'Content-Type': 'application/json',
  //       "Authorization":
  //           "Bearer ${Get.find<DoctorHomeController>().userModel.value!.token!}",
  //     },
  //     endPoint: '${AppTokens.apiURl}/contents/${contentData.id}/delete',
  //     body: {},
  //   );

  //   if (response != null) {
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       contentModelList.removeWhere((val) => val.id == contentData.id);
  //       contentModelList.refresh();
  //       showToastMessage(
  //           message:
  //               "You send a request for admin to delete this post successfully.",
  //           context: context,
  //           color: const Color(0xff5BA66B),
  //           icon: Icons.check);
  //     }
  //   }
  // }

  ScrollController scrollController = ScrollController();
  RxBool reFetchLoader = false.obs;

  Future<void> _loadMoreData() async {
    if (selectedTab == 1) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (contentModelList.isNotEmpty) {
          if (totalRecord.value != currentRecord.value &&
              currentRecord < totalRecord.value) {
            reFetchLoader.value = true;
            await postInApiReFetch(selecetdPostType.value == 'All Posts'
                ? 'post'
                : selecetdPostType.value.toLowerCase());
          }
        }

        reFetchLoader.value = false;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_loadMoreData);
  }

  RxList<UserOfferModel> userOfferModelList = <UserOfferModel>[].obs;
  RxBool isOfferLoading = false.obs;
  RxBool isAppBarOpen = false.obs;
  getDoctorOfersData(String doctorID) async {
    isOfferLoading.value = true;
    userOfferModelList.value = [];

    try {
      final response = await ApiService.getwithUserToken(
        endPoint: '${AppTokens.apiURl}/offers/doctors/$doctorID',
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        userOfferModelList.value =
            jsonResponse.map((data) => UserOfferModel.fromJson(data)).toList();
      }

      isOfferLoading.value = false;
    } catch (e) {
      printError(info: e.toString());
      isOfferLoading.value = false;
    }
  }
}
