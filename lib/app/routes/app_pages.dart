import 'package:daroon_user/app/modules/auth/reset_password/pages/reset_sucessfully.dart';
import 'package:daroon_user/app/modules/auth/signup/pages/email_otp_screen.dart';
import 'package:daroon_user/app/modules/user/user_home/pages/doctor_specialty_detail.dart';
import 'package:daroon_user/app/modules/user/user_invoice/binding/user_invoice_binding.dart';
import 'package:daroon_user/app/modules/user/user_invoice/pages/payment_succesfully.dart';
import 'package:daroon_user/app/modules/user/user_invoice/pages/user_invoice_detail.dart';
import 'package:daroon_user/app/modules/user/user_invoice/pages/user_invoice_screen.dart';
import 'package:daroon_user/app/modules/user/user_message/binding/user_mesaage_binding.dart';
import 'package:daroon_user/app/modules/user/user_message/pages/doctor_meeting.dart';
import 'package:daroon_user/app/modules/user/user_message/pages/user_chat_room.dart';
import 'package:daroon_user/app/modules/user/user_message/pages/user_message.dart';
import 'package:daroon_user/app/modules/user/user_appointment/binding/user_appointment_binding.dart';
import 'package:daroon_user/app/modules/user/user_appointment/pages/appointment_detail_screen.dart';
import 'package:daroon_user/app/modules/user/user_appointment/pages/cancel_appointment_detail.dart';
import 'package:daroon_user/app/modules/user/user_podcast/binding/presenter_binding.dart';
import 'package:daroon_user/app/modules/user/user_podcast/binding/user_podcast_binding.dart';
import 'package:daroon_user/app/modules/user/user_podcast/pages/presenter_podcast_details.dart';
import 'package:daroon_user/app/modules/user/user_podcast/pages/user_podcast_detail_screen.dart';
import 'package:daroon_user/app/modules/user/user_podcast/pages/user_presenter_profile.dart';
import 'package:daroon_user/app/modules/user/user_profile/binding/user_edit_profile_binding.dart';
import 'package:daroon_user/app/modules/user/user_profile/binding/user_profile_binding.dart';
import 'package:daroon_user/app/modules/user/user_profile/pages/user_change_email.dart';
import 'package:daroon_user/app/modules/user/user_profile/pages/user_change_username.dart';
import 'package:daroon_user/app/modules/user/user_profile/pages/user_edit_name.dart';
import 'package:daroon_user/app/modules/user/user_profile/pages/user_edit_profile.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/binding/top_doctor_bindng.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/pages/create_appointment_screen.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/pages/create_patient_detail.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/pages/see_on_map_offices.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/pages/specific_doctor_offer_screen.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/pages/top_doctor_details.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/forget/binding/forget_password_binding.dart';
import 'package:daroon_user/app/modules/auth/forget/pages/forget_email.dart';
import 'package:daroon_user/app/modules/auth/forget/pages/forget_otp_screen.dart';
import 'package:daroon_user/app/modules/auth/forget/pages/forget_password_screen.dart';
import 'package:daroon_user/app/modules/auth/forget/pages/forget_phone.dart';
import 'package:daroon_user/app/modules/auth/login/binding/login_binding.dart';
import 'package:daroon_user/app/modules/auth/login/binding/opt_binding.dart';
import 'package:daroon_user/app/modules/auth/login/pages/login_screen.dart';
import 'package:daroon_user/app/modules/auth/reset_password/binding/reset_password_binding.dart';
import 'package:daroon_user/app/modules/auth/reset_password/pages/reset_password.dart';
import 'package:daroon_user/app/modules/auth/signup/pages/email_phone_screen.dart';
import 'package:daroon_user/app/modules/auth/signup/pages/first_signup_screen.dart';
import 'package:daroon_user/app/modules/auth/signup/pages/otp_screen.dart';
import 'package:daroon_user/app/modules/auth/signup/pages/profile_picture_screen.dart';
import 'package:daroon_user/app/modules/auth/signup/pages/singup_screen.dart';
import 'package:daroon_user/app/modules/auth/signup/pages/welcome_screen.dart';
import 'package:daroon_user/app/modules/on_boarding/pages/onboarding_screen.dart';
import 'package:daroon_user/app/modules/splash/splash_screen.dart';
import 'package:daroon_user/app/modules/user/user_bottom_navi_bar/binding/user_home_binding.dart';
import 'package:daroon_user/app/modules/user/user_bottom_navi_bar/page/user_drawer.dart';
import 'package:daroon_user/app/modules/user/user_offer/binding/user_offers_binding.dart';
import 'package:daroon_user/app/modules/user/user_offer/pages/user_offer_detail.dart';
import 'package:daroon_user/app/modules/user/user_offer/pages/user_offer_screen.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/pages/filter_screen.dart';
import 'package:daroon_user/app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => const OnBoardingScreen(),
    ),
    // GetPage(
    //   name: Routes.loginSelectionScreen,
    //   page: () => const LoginSelectionScreen(),
    // ),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.firstsignup,
      page: () => const FirstSignupScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.singup,
      page: () => SignUpScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.emailPhoneNumber,
      page: () => const EmailPhoneNumberScreen(),
    ),
    GetPage(
      name: Routes.otpScreen,
      page: () => const OtpScreen(),
      binding: OptBinding(),
    ),
    GetPage(
      name: Routes.emailOTPScreen,
      page: () => const EmailOtpScreen(),
      binding: OptBinding(),
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => const ForgetPassowrdScreen(),
      binding: ForgetPasswordBindings(),
    ),
    GetPage(
      name: Routes.forgetPhone,
      page: () => const ForgetPhoneScreen(),
      binding: ForgetPasswordBindings(),
    ),
    GetPage(
      name: Routes.forgetOTPScreen,
      page: () => ForgetOtpScreen(),
      binding: ForgetPasswordBindings(),
    ),
    GetPage(
      name: Routes.forgetEmail,
      page: () => ForgetEmailScreen(),
      binding: ForgetPasswordBindings(),
    ),
    GetPage(
      name: Routes.resetSucessfully,
      page: () => const ResetSucessfully(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: Routes.profilePic,
      page: () => const ProfilePictureScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomeScreen(),
    ),

    //////  Top Doctor Detail
    GetPage(
      name: Routes.topDotocrProfileDetail,
      page: () => TopDoctorProfileScreen(),
      binding: TopDoctorBindng(),
    ),

    GetPage(
      name: Routes.seeOnMapAppointment,
      page: () => SeeOnMapAppointment(),
      binding: TopDoctorBindng(),
    ),
    GetPage(
      name: Routes.specificDoctorOfferScreen,
      page: () => const SpecificDoctorOfferScreen(),
      binding: TopDoctorBindng(),
    ),
    GetPage(
      name: Routes.createAppointment,
      page: () => CreateAppointmentScreen(),
      binding: TopDoctorBindng(),
    ),
    GetPage(
      name: Routes.createPatientDetail,
      page: () => const CreatePatientDetailScreen(),
      binding: TopDoctorBindng(),
    ),
    ////
    ///  Appointment
    GetPage(
      name: Routes.userAppointmentDetail,
      page: () => AppointmentDetailScreen(),
    ),
    GetPage(
      name: Routes.cancelAppointment,
      page: () => const CancelAppointmentDetail(),
      binding: UserAppointmentBinding(),
    ),
    ///////// User PodCast///
    GetPage(
      name: Routes.userPresenterProfile,
      page: () => UserPresenterProfileScreen(),
      binding: UserPodcastBinding(),
    ),
    GetPage(
      name: Routes.userPodCastDetail,
      page: () => UserPodcastDetailScreen(),
      binding: UserPodcastBinding(),
    ),
    GetPage(
      name: Routes.presenterPodCastDetail,
      page: () => PresenterPodcastDetails(),
      binding: PresenterBinding(),
    ),
    ///// User Profile ///
    GetPage(
      name: Routes.userEditProfile,
      page: () => const UserEditProfile(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: Routes.userChangeEmail,
      page: () => const UserChangeEmail(),
      binding: UserEditProfileBinding(),
    ),
    GetPage(
      name: Routes.userChangeName,
      page: () => const UserEditName(),
      binding: UserEditProfileBinding(),
    ),
    GetPage(
      name: Routes.userChangeUserName,
      page: () => const UserChangeUsername(),
      binding: UserEditProfileBinding(),
    ),
    /////////// Massge
    GetPage(
      name: Routes.userMessage,
      page: () => const UserMessageScreen(),
      binding: UserMesaageBinding(),
    ),
    GetPage(
      name: Routes.userChatRoom,
      page: () => const UserChatPage(),
      binding: UserMesaageBinding(),
    ),
    GetPage(
      name: Routes.inVoiceScreen,
      page: () => const UserInvoiceScreen(),
      binding: UserInvoiceBinding(),
    ),
    GetPage(
      name: Routes.inVoiceDetail,
      page: () => const UserInvoiceDetail(),
      binding: UserInvoiceBinding(),
    ),
    GetPage(
      name: Routes.paymentStatus,
      page: () => PaymentSuccesfully(),
    ),

    /////////////// User Side Screens///
    GetPage(
      name: Routes.userdrawerScreen,
      page: () => const UserDrawerScreen(),
      binding: UserHomeBinding(),
    ),
    GetPage(
      name: Routes.userOfferScreen,
      page: () => const UserOfferScreen(),
      binding: UserOffersBinding(),
    ),
    GetPage(
      name: Routes.userOffersDetails,
      page: () => UserOfferDetailScreen(),
    ),
    GetPage(
      name: Routes.filterScreen,
      page: () => const FilterScreen(),
      binding: TopDoctorBindng(),
    ),
    GetPage(
      name: Routes.meetingScreen,
      page: () => const VideoMeetingPages(),
      binding: UserMesaageBinding(),
    ),
    GetPage(
      name: Routes.doctorSpecialtyDetail,
      page: () => const DoctorSpecialtyDetail(),
      binding: UserHomeBinding(),
    ),
  ];
}
