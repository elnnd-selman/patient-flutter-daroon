import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class UserPodcastScreen extends StatelessWidget {
  const UserPodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 4 * SizeConfig.widthMultiplier,
          vertical: 3 * SizeConfig.heightMultiplier),
      child: Column(
        children: [
          // SizedBox(height: 2 * SizeConfig.heightMultiplier),
          SearchTextField(
              hintText: "Search...",
              textEditingController: TextEditingController(),
              showSuffix: false,
              showPrefix: true,
              prefixIcon: Assets.serachIcon,
              suffixIcon: ""),
              
        ],
      ),
    );
  }
}
