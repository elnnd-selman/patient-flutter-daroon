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
import 'package:daroon_user/app/modules/on_boarding/pages/login_selection_screen.dart';
import 'package:daroon_user/app/modules/on_boarding/pages/onboarding_screen.dart';
import 'package:daroon_user/app/modules/splash/splash_screen.dart';
import 'package:daroon_user/app/modules/user/user_bottom_navi_bar/binding/user_home_binding.dart';
import 'package:daroon_user/app/modules/user/user_bottom_navi_bar/page/user_drawer.dart';
import 'package:daroon_user/app/modules/user/user_offer/binding/user_offers_binding.dart';
import 'package:daroon_user/app/modules/user/user_offer/pages/user_offer_detail.dart';
import 'package:daroon_user/app/modules/user/user_offer/pages/user_offer_screen.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/binding/user_top_doctor_binding.dart';
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
    GetPage(
      name: Routes.loginSelectionScreen,
      page: () => const LoginSelectionScreen(),
    ),
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
        binding: OptBinding()),
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
      page: () => const ForgetOtpScreen(),
      binding: ForgetPasswordBindings(),
    ),
    GetPage(
      name: Routes.forgetEmail,
      page: () => ForgetEmailScreen(),
      binding: ForgetPasswordBindings(),
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
    // GetPage(
    //   name: Routes.doctordrawerScreen,
    //   page: () => const DoctorDrawerScreen(),
    //   binding: DoctorHomeBinding(),
    // ),
    // GetPage(
    //   name: Routes.doctorBottomNaviBar,
    //   page: () => const DoctorBottomNaviBar(),
    // ),
    // GetPage(
    //   name: Routes.doctorOffers,
    //   page: () => const DoctorOffersPage(),
    //   binding: DoctorOffersBinding(),
    // ),
    // GetPage(
    //   name: Routes.doctorOffersDetails,
    //   page: () => const DoctorOfferDetailScreen(),
    // ),
    // GetPage(
    //   name: Routes.doctorAppointmentDetail,
    //   page: () => const AppointmentDetailScreen(),
    // ),
    // GetPage(
    //   name: Routes.doctorAddOffers,
    //   page: () => const DoctorAddOfferScreen(),
    // ),
    // GetPage(
    //   name: Routes.cancelAppointment,
    //   page: () => const CancelAppointmentDetail(),
    //   binding: DoctorAppointmentBinding(),
    // ),
    // GetPage(
    //   name: Routes.doctorAssistant,
    //   page: () => const DoctorAssistantsScreen(),
    //   binding: DoctorAssistantBinding(),
    // ),
    // GetPage(
    //   name: Routes.doctorAssistantDetail,
    //   page: () => const DoctorAssistantDetailScreen(),
    // ),
    // GetPage(
    //   name: Routes.doctorAssistantEditAddress,
    //   page: () => const DoctorAssistentEditAddress(),
    // ),
    // GetPage(
    //   name: Routes.doctorAssistantEditProfile,
    //   page: () => const EditAssistantProfile(),
    // ),
    // GetPage(
    //   name: Routes.adddoctorAssistant,
    //   page: () => const AddAssistantScreen(),
    //   binding: DoctorAssistantBinding(),
    // ),
    // GetPage(
    //   name: Routes.doctorProfile,
    //   page: () => const DoctorProfileScreen(),
    //   binding: DoctorHomeBinding(),
    // ),
    // GetPage(
    //   name: Routes.doctorEditProfile,
    //   page: () => const DoctorEditProfile(),
    // ),
    // GetPage(
    //   name: Routes.doctorchangeLanguage,
    //   page: () => const DoctorLanguageScreen(),
    //   binding: DoctorProfileBinding(),
    // ),
    // GetPage(
    //   name: Routes.doctorEditSpeciality,
    //   page: () => const DoctorEditSpeciality(),
    //   binding: DoctorProfileBinding(),
    // ),
    // GetPage(
    //   name: Routes.doctorEditLevel,
    //   page: () => const DoctorEditLevel(),
    //   binding: DoctorProfileBinding(),
    // ),
    // GetPage(
    //   name: Routes.doctorMessage,
    //   page: () => const DoctorMessageScreen(),
    // ),
    // GetPage(
    //   name: Routes.doctorChatRoom,
    //   page: () => const DoctorChatRoom(),
    // ),
    // GetPage(
    //   name: Routes.doctorNotification,
    //   page: () => const DoctorNotificationScreen(),
    // ),
    // GetPage(
    //   name: Routes.addDoctorAdress,
    //   page: () => const AddDoctorAddressScreen(),
    //   binding: DoctorAddressBinding(),
    // ),
    // GetPage(
    //   name: Routes.addDoctorAdressDetail,
    //   page: () => const AddAdressDetailScreen(),
    //   binding: DoctorAddressBinding(),
    // ),
    // GetPage(
    //   name: Routes.doctorAdressDetail,
    //   page: () => const DoctorAddressDetailsScreen(),
    //   binding: DoctorAddressBinding(),
    // ),

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
      page: () => const UserOfferDetailScreen(),
    ),
    GetPage(
      name: Routes.filterScreen,
      page: () => const FilterScreen(),
      binding: UserTopDoctorBinding(),
    ),
  ];
}
