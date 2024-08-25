import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/buttons/button_action.dart';
import 'package:payuung_pribadi/buttons/button_primary.dart';
import 'package:payuung_pribadi/controller/profile/alamat_pribadi_controller.dart';
import 'package:payuung_pribadi/controller/profile/biodata_diri_controller.dart';
import 'package:payuung_pribadi/controller/profile/informasi_perusahaan_controller.dart';
import 'package:payuung_pribadi/controller/profile/informasi_pribadi_controller.dart';
import 'package:payuung_pribadi/pages/profile/widgets/alamat_pribadi_widget.dart';
import 'package:payuung_pribadi/pages/profile/widgets/biodata_diri_widget.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_jenis_kelamin.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_pendidikan.dart';
import 'package:payuung_pribadi/pages/profile/widgets/informasi_perusahaan_widget.dart';
import 'package:payuung_pribadi/pages/profile/widgets/tabbar_profile_card.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/constant.dart';
import 'package:payuung_pribadi/utilities/typography.dart';
import 'package:collection/collection.dart';
import 'package:payuung_pribadi/widgets/check_box_costum.dart';
import 'package:payuung_pribadi/widgets/date_picker_costum.dart';

class InformasiPribadiPage extends StatelessWidget {
  InformasiPribadiPage({super.key});

  InformasiPribadiController controller = Get.put(InformasiPribadiController());
  BiodataDiriController biodataDiriController =
      Get.put(BiodataDiriController());
  AlamatPribadiController alamatPribadiController =
      Get.put(AlamatPribadiController());
  InformasiPerusahaanController informasiPerusahaanController =
      Get.put(InformasiPerusahaanController());

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
          Obx(
            () => controller.isSelectedIndex.value == 0
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: ButtonPrimary(
                      text: 'Selanjutnya',
                      onTap: () {
                        controller.isSelectedIndex.value = 1;
                        biodataDiriController.saveBiodata();
                      },
                    ),
                  )
                : controller.isSelectedIndex.value == 1
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Obx(() => CheckBoxCustom(
                                      check:
                                          alamatPribadiController.isCheck.value,
                                      onTap: () {
                                        alamatPribadiController.isCheck.value =
                                            !alamatPribadiController
                                                .isCheck.value;
                                      },
                                    )),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Expanded(
                                  child: Text(
                                    "Alamat Domisili Sama Dengan Alamat Pada KTP",
                                    style: TStyle.paragraphSmallMedium,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ButtonPrimary(
                                    text: 'Sebelumnya',
                                    onTap: () {
                                      controller.isSelectedIndex.value = 1;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                Expanded(
                                  child: ButtonPrimary(
                                    text: 'Selanjutnya',
                                    onTap: () {
                                      alamatPribadiController.saveAlamat();
                                      controller.isSelectedIndex.value = 2;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: ButtonPrimary(
                                text: 'Sebelumnya',
                                onTap: () {
                                  controller.isSelectedIndex.value = 1;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: ButtonPrimary(
                                  text: 'Simpan',
                                  onTap: () {
                                    informasiPerusahaanController
                                        .saveInformasiPerusahaan();
                                  }),
                            ),
                          ],
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
