import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daroon_user/app/modules/user/user_home/model/doctor_specialty_model.dart';
import 'package:daroon_user/global/constants/size_config.dart';

class UserDoctorSpecialtyContainer extends StatelessWidget {
  const UserDoctorSpecialtyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 3,
        crossAxisCount: 4,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: doctorSpecialtyModel.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .07,
              width: MediaQuery.of(context).size.height * 0.07,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffebf4ff),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: SvgPicture.asset(
                  doctorSpecialtyModel[index].imageUrl,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.004,
            ),
            Text(
              doctorSpecialtyModel[index].title,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                color: const Color(0xff1C1B1F),
                fontSize: SizeConfig.heightMultiplier * 1.6,
              ),
            ),
          ],
        );
      },
    );
  }
}
