import 'dart:async';
import 'dart:ui' as ui;

import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OfficeOnMapController extends GetxController {
  final Completer<GoogleMapController> completer =
      Completer<GoogleMapController>();
  Rx<CameraPosition> kGooglePlex = const CameraPosition(
    target: LatLng(51.174179, 6.610550),
    zoom: 12.4746,
  ).obs;

  late GoogleMapController mapController;

  RxList<Marker> markers = <Marker>[].obs;
  RxBool isSetting = false.obs;
  setMarker(TopDoctorModel doctorData) async {
    isSetting.value = true;
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/icons_png/location_icon.png', 80);
    for (int i = 0; i < doctorData.offices.length; i++) {
      if (i == 0) {
        kGooglePlex.value = CameraPosition(
          target: LatLng(doctorData.offices[i].address!.coordinate!.latitude!,
              doctorData.offices[i].address!.coordinate!.longitude!),
          zoom: 16,
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
}
