import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/buttons/button_primary.dart';
import 'package:payuung_pribadi/controller/profile/alamat_pribadi_controller.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheeet_kelurahan.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_kecamatan.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_kota.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_list.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_provinsi.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/constant.dart';
import 'package:payuung_pribadi/utilities/typography.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AlamatPribadiWidget extends StatelessWidget {
  AlamatPribadiWidget({super.key});

  final AlamatPribadiController controller = Get.put(AlamatPribadiController());
  RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      controller: refreshController,
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 1000));
        refreshController.refreshCompleted();
      },
      onLoading: () async {
        await Future.delayed(const Duration(milliseconds: 1000));
        refreshController.loadComplete();
      },
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                // Display photo if available
                if (controller.filePathPhoto.value.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.005,
                      right: MediaQuery.of(context).size.height * 0.007,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: controller.filePathPhoto.value.contains("http")
                          ? Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  _showPhotoOptions(context);
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: Center(
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: kColorPrimary,
                                            width: 2,
                                          ),
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              controller.filePathPhoto.value,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: kColorBlack,
                                        ),
                                        child: const Icon(
                                          Icons.camera_enhance_rounded,
                                          color: kColorWhite,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  _showPhotoOptions(context);
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: Center(
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: kColorPrimary,
                                            width: 2,
                                          ),
                                          image: DecorationImage(
                                            image: FileImage(
                                              File(controller
                                                  .filePathPhoto.value),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: kColorBlack,
                                        ),
                                        child: const Icon(
                                          Icons.camera_enhance_rounded,
                                          color: kColorWhite,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ),
                  );
                } else {
                  return ButtonPrimary(
                    text: 'Pilih Foto KTP',
                    onTap: () {
                      _showPhotoOptions(context);
                    },
                  );
                }
              }),
              const SizedBox(height: 12.0),
              Text(
                "* NIK",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(height: 4.0),
              TextFormField(
                controller: controller.nikController,
                // enabled: false,
                style: TStyle.paragraphSmallRegular,
                decoration:
                    kDefaultDecoration.copyWith(hintText: 'Masukkan NIK'),
              ),
              const SizedBox(height: 12.0),
              Text(
                "* ALAMAT SESUAI KTP",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(height: 4.0),
              TextFormField(
                controller: controller.alamatController,
                // enabled: false,
                style: TStyle.paragraphXSmallRegular,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 5,
                decoration: kDefaultDecoration.copyWith(
                  hintText: "Masukkan Alamat Sesuai KTP",
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                "* PROVINSI",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(height: 4.0),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      BottomSheetProvinsi(),
                    );
                  },
                  child: TextFormField(
                    controller: controller.provinsiController,
                    enabled: false,
                    style: TStyle.paragraphSmallRegular,
                    decoration: kDefaultDecoration.copyWith(
                      hintText: 'Pilih Provinsi',
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: kColorNeutral700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                "* KOTA / KABUPATEN",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(height: 4.0),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      BottomSheetKota(),
                    );
                  },
                  child: TextFormField(
                    controller: controller.kotaController,
                    enabled: false,
                    style: TStyle.paragraphSmallRegular,
                    decoration: kDefaultDecoration.copyWith(
                      hintText: 'Pilih Kota',
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: kColorNeutral700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                "* KECAMATAN",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(height: 4.0),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      BottomSheetKecamatan(),
                    );
                  },
                  child: TextFormField(
                    controller: controller.kecamatanController,
                    enabled: false,
                    style: TStyle.paragraphSmallRegular,
                    decoration: kDefaultDecoration.copyWith(
                      hintText: 'Pilih Kecamatan',
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: kColorNeutral700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                "* KELURAHAN",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(height: 4.0),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      BottomSheeetKelurahan(),
                    );
                  },
                  child: TextFormField(
                    controller: controller.kelurahanController,
                    enabled: false,
                    style: TStyle.paragraphSmallRegular,
                    decoration: kDefaultDecoration.copyWith(
                      hintText: 'Pilih Kelurahan',
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: kColorNeutral700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                "* KODE POS",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(height: 4.0),
              TextFormField(
                controller: controller.kodePosController,
                // enabled: false,
                style: TStyle.paragraphSmallRegular,
                decoration:
                    kDefaultDecoration.copyWith(hintText: 'Masukkan Kode POS'),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }

  void _showPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const BottomSheetList(
        label: "Masukkan Foto",
        listItem: <String>["Camera", "Galeri"],
      ),
    ).then((value) {
      if (value != null) {
        if (value == "Camera") {
          controller.changePhoto(camera: true);
        } else if (value == "Galeri") {
          controller.changePhoto();
        }
      }
    });
  }
}
