import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';

// ignore: must_be_immutable
class CommonTextfeild extends StatefulWidget {
  CommonTextfeild({
    super.key,
    required this.obscuretext,
    required this.hinttext,
    required this.validations,
    required this.controller,
    required this.keyboardType,
    required this.showicon,
    required this.scanIcons,
    this.maxLine = 1,
    this.onChange,
    this.borderColor = AppColors.borderColor,
    this.inputFormat,
  });
  bool obscuretext;
  final String hinttext;
  final TextEditingController controller;
  final bool showicon;
  final Color borderColor;
  final bool scanIcons;

  final int? maxLine;
  Function(String)? onChange;
  // ignore: prefer_typing_uninitialized_variables
  final validations;
  List<TextInputFormatter>? inputFormat;

  // ignore: prefer_typing_uninitialized_variables
  var keyboardType;
  @override
  State<CommonTextfeild> createState() => _CommonTextfeildState();
}

class _CommonTextfeildState extends State<CommonTextfeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormat ?? [],
      maxLines: widget.maxLine,
      style: AppTextStyles.medium.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: AppColors.blackBGColor,
      ),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      cursorColor: Colors.black12,
      validator: widget.validations,
      cursorWidth: 1,
      obscureText: widget.obscuretext,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 22, horizontal: 14),
        fillColor: const Color(0xffF7F7F8),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        isDense: true,
        suffixIcon: widget.showicon
            ? IconButton(
                icon: widget.obscuretext
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.black45,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.black45,
                      ),
                onPressed: () {
                  setState(() {
                    widget.obscuretext = !widget.obscuretext;
                  });
                },
              )
            : null,
        hintText: widget.hinttext,
        hintStyle: AppTextStyles.medium.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: const Color(0xff535353),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CommonTextfeildfoucBorder extends StatefulWidget {
  CommonTextfeildfoucBorder({
    super.key,
    required this.obscuretext,
    required this.hinttext,
    required this.validations,
    required this.controller,
    required this.keyboardType,
    required this.showicon,
    required this.scanIcons,
    this.maxLine = 1,
    this.onChange,
    this.borderColor = AppColors.borderColor,
  });
  bool obscuretext;
  final String hinttext;
  final TextEditingController controller;
  final bool showicon;
  final Color borderColor;
  final bool scanIcons;

  final int? maxLine;
  Function(String)? onChange;
  // ignore: prefer_typing_uninitialized_variables
  final validations;

  // ignore: prefer_typing_uninitialized_variables
  var keyboardType;
  @override
  State<CommonTextfeildfoucBorder> createState() =>
      _CommonTextfeildfoucBorderState();
}

class _CommonTextfeildfoucBorderState extends State<CommonTextfeildfoucBorder> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine,
      style: AppTextStyles.medium.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: AppColors.blackBGColor,
      ),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      cursorColor: Colors.black12,
      validator: widget.validations,
      cursorWidth: 1,
      obscureText: widget.obscuretext,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        fillColor: const Color(0xffF7F7F8),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        isDense: true,
        suffixIcon: widget.showicon
            ? IconButton(
                icon: widget.obscuretext
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.black45,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.black45,
                      ),
                onPressed: () {
                  setState(() {
                    widget.obscuretext = !widget.obscuretext;
                  });
                },
              )
            : null,
        hintText: widget.hinttext,
        hintStyle: AppTextStyles.medium.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: const Color(0xff535353),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AddressTextField extends StatefulWidget {
  AddressTextField({
    super.key,
    required this.obscuretext,
    required this.hinttext,
    required this.validations,
    required this.controller,
    required this.keyboardType,
    required this.showicon,
    required this.scanIcons,
    this.maxLine = 1,
    this.onChange,
    this.borderColor = AppColors.borderColor,
  });
  bool obscuretext;
  final String hinttext;
  final TextEditingController controller;
  final bool showicon;
  final Color borderColor;
  final bool scanIcons;

  final int? maxLine;
  Function(String)? onChange;
  // ignore: prefer_typing_uninitialized_variables
  final validations;

  // ignore: prefer_typing_uninitialized_variables
  var keyboardType;
  @override
  State<AddressTextField> createState() => _AddressTextFieldState();
}

class _AddressTextFieldState extends State<AddressTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine,
      style: AppTextStyles.medium.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: AppColors.blackBGColor,
      ),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      cursorColor: Colors.black12,
      validator: widget.validations,
      cursorWidth: 1,
      obscureText: widget.obscuretext,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        fillColor: const Color(0xffF7F7F8),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(
            "assets/icons/dollar.svg",
            colorFilter: const ColorFilter.mode(
              Color(0xff535353),
              BlendMode.srcIn,
            ),
          ),
        ),
        hintText: widget.hinttext,
        hintStyle: AppTextStyles.medium.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: const Color(0xff535353),
        ),
      ),
    );
  }
}
