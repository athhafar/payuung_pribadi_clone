import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/controller/profile/informasi_perusahaan_controller.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_jabatan.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_lama_bekerja.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_nama_bank.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_pendapatan_kotor.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_sumber_pendapatan.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/constant.dart';
import 'package:payuung_pribadi/utilities/typography.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InformasiPerusahaanWidget extends StatelessWidget {
  InformasiPerusahaanWidget({
    super.key,
  });

  InformasiPerusahaanController controller =
      Get.put(InformasiPerusahaanController());
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
              Text(
                "NAMA USAHA / PERUSAHAAN",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(
                height: 4.0,
              ),
              TextFormField(
                controller: controller.namaUsahaController,
                // enabled: false,
                style: TStyle.paragraphSmallRegular,
                textCapitalization: TextCapitalization.words,
                decoration: kDefaultDecoration.copyWith(
                    hintText: 'Masukkan Nama Usaha'),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "ALAMAT USAHA / PERUSAHAAN",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(
                height: 4.0,
              ),
              TextFormField(
                controller: controller.alamatUsahaController,
                // enabled: false,
                style: TStyle.paragraphSmallRegular,
                textCapitalization: TextCapitalization.words,
                decoration: kDefaultDecoration.copyWith(
                    hintText: 'Masukkan Alamat Usaha'),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "JABATAN",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(BottomSheetjabatanList());
                  },
                  child: TextFormField(
                    enabled: false,
                    controller: controller.jabatanController,
                    style: TStyle.paragraphSmallRegular,
                    textCapitalization: TextCapitalization.words,
                    decoration: kDefaultDecoration.copyWith(
                      hintText: 'Pilih  Jabatan',
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
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "LAMA BEKERJA",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(BottomSheetLamaBekerja());
                  },
                  child: TextFormField(
                    enabled: false,
                    controller: controller.lamaBekerjaController,
                    style: TStyle.paragraphSmallRegular,
                    textCapitalization: TextCapitalization.words,
                    decoration: kDefaultDecoration.copyWith(
                      hintText: 'Pilih Lama Bekerja ',
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
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "SUMBER PENDAPATAN",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      BottomSheetSumberPendapatan(),
                    );
                  },
                  child: TextFormField(
                    enabled: false,
                    controller: controller.sumberPendapatanController,
                    style: TStyle.paragraphSmallRegular,
                    textCapitalization: TextCapitalization.words,
                    decoration: kDefaultDecoration.copyWith(
                      hintText: 'Pilih Sumber Pendapatan',
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
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "PENDAPATAN KOTOR PERTAHUN",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      BottomSheetPendapatanKotor(),
                    );
                  },
                  child: TextFormField(
                    enabled: false,
                    controller: controller.pendapatanKotorPertahunController,
                    style: TStyle.paragraphSmallRegular,
                    textCapitalization: TextCapitalization.words,
                    decoration: kDefaultDecoration.copyWith(
                      hintText: 'Pilih Pendapatan Kotor Pertahun',
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
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "NAMA BANK",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(BottomSheetNamaBank());
                  },
                  child: TextFormField(
                    enabled: false,
                    controller: controller.namaBankController,
                    style: TStyle.paragraphSmallRegular,
                    textCapitalization: TextCapitalization.words,
                    decoration: kDefaultDecoration.copyWith(
                      hintText: 'Pilih Nama Bank',
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
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "CABANG BANK",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(
                height: 4.0,
              ),
              TextFormField(
                controller: controller.cabangBankController,
                // enabled: false,
                style: TStyle.paragraphSmallRegular,
                textCapitalization: TextCapitalization.words,
                decoration: kDefaultDecoration.copyWith(
                    hintText: 'Masukkan Cabang Bank'),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "NOMOR REKENING",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(
                height: 4.0,
              ),
              TextFormField(
                controller: controller.nomorRekeningController,
                // enabled: false,
                style: TStyle.paragraphSmallRegular,
                textCapitalization: TextCapitalization.words,
                decoration: kDefaultDecoration.copyWith(
                    hintText: 'Masukkan Nomer Rekening'),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "NAMA PEMILIK REKENING",
                style: TStyle.paragraphXSmallRegular,
              ),
              const SizedBox(
                height: 4.0,
              ),
              TextFormField(
                controller: controller.namaPemilikRekeningController,
                // enabled: false,
                style: TStyle.paragraphSmallRegular,
                textCapitalization: TextCapitalization.words,
                decoration: kDefaultDecoration.copyWith(
                    hintText: 'Masukkan Nama Pemilik Rekening'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
