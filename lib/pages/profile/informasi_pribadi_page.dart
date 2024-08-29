import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/buttons/button_action.dart';
import 'package:payuung_pribadi/controller/profile/informasi_pribadi_controller.dart';
import 'package:payuung_pribadi/pages/profile/widgets/alamat_pribadi_widget.dart';
import 'package:payuung_pribadi/pages/profile/widgets/biodata_diri_widget.dart';
import 'package:payuung_pribadi/pages/profile/widgets/informasi_perusahaan_widget.dart';
import 'package:payuung_pribadi/pages/profile/widgets/tabbar_profile_card.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';
import 'package:collection/collection.dart';

class InformasiPribadiPage extends StatelessWidget {
  InformasiPribadiPage({super.key});

  InformasiPribadiController controller = Get.put(InformasiPribadiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: Column(
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
                    child: Icon(Icons.arrow_back_ios_new_rounded)),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  "Informasi Pribadi",
                  style: TStyle.mobileHeading4Medium,
                ),
              ],
            ),
          ),
          Obx(
            () => Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.listTab
                    .mapIndexed(
                      (index, element) => TabBarProfileCard(
                        title: controller.listTab[index],
                        isActive: controller.isSelectedIndex.value == index,
                        onTap: () {
                          if (index == controller.isSelectedIndex.value) {
                          } else {
                            controller.isSelectedIndex.value = index;
                          }
                        },
                        isFirstIndex: index == 0,
                        isLastIndex: index == controller.listTab.length - 1,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Obx(
            () => controller.isSelectedIndex.value == 0
                ? Expanded(
                    child: BiodataDiriWidget(),
                  )
                : controller.isSelectedIndex.value == 1
                    ? Expanded(
                        child: AlamatPribadiWidget(),
                      )
                    : Expanded(
                        child: InformasiPerusahaanWidget(),
                      ),
          ),
        ],
      ),
    );
  }
}
