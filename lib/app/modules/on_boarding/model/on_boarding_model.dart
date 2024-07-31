class OnBoardingModel {
  final String imageUrl;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imageUrl,
    required this.subTitle,
    required this.title,
  });
}

List<OnBoardingModel> onboardingModelList = [
  OnBoardingModel(
      imageUrl: "assets/images/onboarding1.png",
      subTitle:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
      title: "Find Trusted Doctors"),
  OnBoardingModel(
      imageUrl: "assets/images/onboarding2.png",
      subTitle:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old..",
      title: "Choose Best Doctors"),
  OnBoardingModel(
      imageUrl: "assets/images/onboarding3.png",
      subTitle:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old..",
      title: "Easy Appointments"),
];
