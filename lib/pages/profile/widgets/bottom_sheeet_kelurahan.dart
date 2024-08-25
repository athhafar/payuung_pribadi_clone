import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/controller/profile/alamat_pribadi_controller.dart';
import 'package:payuung_pribadi/controller/profile/biodata_diri_controller.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class BottomSheeetKelurahan extends StatelessWidget {
  BottomSheeetKelurahan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AlamatPribadiController controller = Get.find();

    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        color: kColorWhite,
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 12),
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                  color: kColorNeutral300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.kelurahanList.length,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                      controller.kelurahanController.text =
                          controller.kelurahanList[index];
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 24,
                          ),
                          child: Text(
                            controller.kelurahanList[index],
                            style: TStyle.paragraphMediumRegular,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          height: 1,
                          color: kColorNeutral200,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
