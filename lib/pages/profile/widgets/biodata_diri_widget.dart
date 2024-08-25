import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/controller/profile/biodata_diri_controller.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_jenis_kelamin.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_pendidikan.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_status_nikah.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/constant.dart';
import 'package:payuung_pribadi/utilities/typography.dart';
import 'package:payuung_pribadi/widgets/date_picker_costum.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BiodataDiriWidget extends StatelessWidget {
  final BiodataDiriController controller = Get.put(BiodataDiriController());
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
              Text("* NAMA LENGKAP", style: TStyle.paragraphXSmallRegular),
              const SizedBox(height: 4.0),
              TextFormField(
                controller: controller.namaLengkapController,
                style: TStyle.paragraphSmallRegular,
                textCapitalization: TextCapitalization.words,
                decoration:
                    kDefaultDecoration.copyWith(hintText: 'Nama Lengkap'),
              ),
              const SizedBox(height: 12.0),
              Text("* TANGGAL LAHIR", style: TStyle.paragraphXSmallRegular),
              const SizedBox(height: 4.0),
              DatePickerCostume(
                hintText: "Pilih Tanggal",
                onChanged: (data) {
                  controller.tanggalLahirController.text = data;
                },
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                initialDate: controller.tanggalLahirController.text.isNotEmpty
                    ? DateTime.parse(controller.tanggalLahirController.text)
                    : DateTime.now(),
              ),
              const SizedBox(height: 12.0),
              Text("* JENIS KELAMIN", style: TStyle.paragraphXSmallRegular),
              const SizedBox(height: 4.0),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(BottomSheetJenisKelamin());
                  },
                  child: TextFormField(
                    controller: controller.jenisKelaminController,
                    enabled: false,
                    style: TStyle.paragraphSmallRegular,
                    decoration: kDefaultDecoration.copyWith(
                        hintText: 'Masukkan Jenis Kelamin'),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text("* ALAMAT EMAIL", style: TStyle.paragraphXSmallRegular),
              const SizedBox(height: 4.0),
              TextFormField(
                controller: controller.emailController,
                style: TStyle.paragraphSmallRegular,
                decoration:
                    kDefaultDecoration.copyWith(hintText: 'Alamat Email'),
              ),
              const SizedBox(height: 12.0),
              Text("* No. HP", style: TStyle.paragraphXSmallRegular),
              const SizedBox(height: 4.0),
              TextFormField(
                controller: controller.noHpController,
                style: TStyle.paragraphSmallRegular,
                keyboardType: TextInputType.phone,
                decoration:
                    kDefaultDecoration.copyWith(hintText: 'Masukkan No Hp'),
              ),
              const SizedBox(height: 12.0),
              Text("PENDIDIKAN", style: TStyle.paragraphXSmallRegular),
              const SizedBox(height: 4.0),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(BottomSheetPendidikan());
                  },
                  child: TextFormField(
                    controller: controller.pendidikanController,
                    enabled: false,
                    style: TStyle.paragraphSmallRegular,
                    decoration: kDefaultDecoration.copyWith(
                      hintText: 'Pilih Status Pendidikan',
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
              Text("STATUS PERNIKAHAN", style: TStyle.paragraphXSmallRegular),
              const SizedBox(height: 4.0),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(BottomSheetStatusNikah());
                  },
                  child: TextFormField(
                    controller: controller.statusPernikahanController,
                    enabled: false,
                    style: TStyle.paragraphSmallRegular,
                    decoration: kDefaultDecoration.copyWith(
                      hintText: 'Pilih Status Pernikahan',
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
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
