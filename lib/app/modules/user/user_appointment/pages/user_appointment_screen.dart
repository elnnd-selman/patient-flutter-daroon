import 'package:daroon_user/app/modules/user/user_appointment/controller/user_appointment_controller.dart';
import 'package:daroon_user/app/modules/user/user_appointment/pages/cancel_appointment_screen.dart';
import 'package:daroon_user/app/modules/user/user_appointment/pages/complete_appointment_screen.dart';
import 'package:daroon_user/app/modules/user/user_appointment/pages/confirmed_appointment_screen.dart';
import 'package:daroon_user/app/modules/user/user_appointment/pages/request_appointment_screen.dart';
import 'package:daroon_user/app/modules/user/user_appointment/pages/upcoming_appointment.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAppointmentScreen extends StatefulWidget {
  const UserAppointmentScreen({super.key});

  @override
  State<UserAppointmentScreen> createState() => _UserAppointmentScreenState();
}

class _UserAppointmentScreenState extends State<UserAppointmentScreen> {
  TabController? _tabController;
  final controller = Get.put(UserAppointmentController());

  List<Widget> appointmentBasetabs = [
    const Tab(text: "Requested"),
    const Tab(text: "Upcoming"),
    const Tab(text: "Confirmed"),
    const Tab(text: "Completed"),
    const Tab(
      text: "Cancelled",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          SizedBox(
            height: 30,
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsets.only(left: 25, bottom: 10),
                isScrollable: true,
                labelStyle: AppTextStyles.semiBold.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColors.primaryColor,
                ),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                indicatorColor: AppColors.primaryColor,
                unselectedLabelStyle: AppTextStyles.semiBold.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: const Color(0xff979797),
                ),
                tabs: appointmentBasetabs,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                RequestAppointmentScreen(),
                UpcomingAppointment(),
                ConfirmedAppointmentScreen(),
                CompleteAppointmentScreen(),
                CancelAppointmentScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
