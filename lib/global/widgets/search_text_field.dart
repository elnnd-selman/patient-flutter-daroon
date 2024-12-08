import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool showSuffix;
  final bool showPrefix;
  final String prefixIcon;
  final String suffixIcon;
  final Function()? onTap;
  final Function(String)? onChange;

  const SearchTextField(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      required this.showSuffix,
      required this.showPrefix,
      required this.prefixIcon,
      required this.suffixIcon,
      this.onChange,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.medium.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: AppColors.blackBGColor,
      ),
      onChanged: onChange,
      cursorColor: Colors.black12,
      cursorWidth: 1,
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 0),
        fillColor: const Color(0xffF7F7F8),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(20),
          child: showPrefix
              ? SvgPicture.asset(
                  prefixIcon,
                  colorFilter: const ColorFilter.mode(
                      AppColors.lighttextColor, BlendMode.srcIn),
                )
              : const SizedBox(),
        ),
        suffixIcon: CustomCupertinoButton(
          onTap: () => onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: showSuffix
                ? SvgPicture.asset(
                    suffixIcon,
                    colorFilter: const ColorFilter.mode(
                        AppColors.primaryColor, BlendMode.srcIn),
                  )
                : const SizedBox(),
          ),
        ),
        isDense: true,
        hintText: hintText,
        hintStyle: AppTextStyles.medium.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: const Color(0xff787B80),
        ),
      ),
    );
  }
}
