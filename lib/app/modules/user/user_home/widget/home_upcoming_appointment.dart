import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_home/widget/upcoming_appointment_container.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeUpcomingAppointment extends GetView<UserHomeController> {
  const HomeUpcomingAppointment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 7 * SizeConfig.heightMultiplier),
              child: const LoadingWidget(),
            )
          : controller.upcomingAppointmentList.isEmpty
              ? Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 7 * SizeConfig.heightMultiplier),
                      child: const NoDataWidget(
                        text: "No Upcoming appointment\nis found.",
                      )),
                )
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // padding:
                  //     EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return HomeUpcomingAppointmentContainer(
                      isPadding: false,
                      appointmentModel:
                          controller.upcomingAppointmentList[index],
                    );
                  },
                ),
    );
  }
}
