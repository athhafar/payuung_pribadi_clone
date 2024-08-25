import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/buttons/button_action.dart';
import 'package:payuung_pribadi/routes/route_name.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/helper.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top + 16,
                bottom: 22,
                left: 16,
                right: 16),
            child: Row(
              children: [
                ButtonAction(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios_new_rounded)),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  "Profile",
                  style: TStyle.mobileHeading4Medium,
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kcolorPrimaryPurple50,
                        border: Border.all(
                          width: 1.0,
                          color: kColorPrimary,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          Helper.getInitialName('Atha Farrel'),
                          style: TStyle.mobileHeading5SemiBold.copyWith(
                            color: kColorPrimary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Athallah Farel",
                            style: TStyle.mobileHeading5SemiBold,
                          ),
                          Text(
                            "Masuk dengan Google",
                            style: TStyle.paragraphSmallMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32.0,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: kColorWhite,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: kColorBlack.withOpacity(0.06),
                            offset: const Offset(8, 10),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(
                              RouteName.informasiPribadi,
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: kColorLightGrey,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                Text(
                                  "Informasi Pribadi",
                                  style: TStyle.paragraphSmallMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
