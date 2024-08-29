import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/bloc/profile/profile_bloc.dart';
import 'package:payuung_pribadi/buttons/button_primary.dart';
import 'package:payuung_pribadi/controller/profile/informasi_pribadi_controller.dart';
import 'package:payuung_pribadi/models/informasi_perusahaan_model.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_jabatan.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_lama_bekerja.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_nama_bank.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_pendapatan_kotor.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_sumber_pendapatan.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/constant.dart';
import 'package:payuung_pribadi/utilities/typography.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InformasiPerusahaanWidget extends StatefulWidget {
  InformasiPerusahaanWidget({
    super.key,
  });

  @override
  State<InformasiPerusahaanWidget> createState() =>
      _InformasiPerusahaanWidgetState();
}

class _InformasiPerusahaanWidgetState extends State<InformasiPerusahaanWidget> {
  final TextEditingController namaUsahaController = TextEditingController();
  final TextEditingController alamatUsahaController = TextEditingController();
  final TextEditingController jabatanController = TextEditingController();
  final TextEditingController lamaBekerjaController = TextEditingController();
  final TextEditingController sumberPendapatanController =
      TextEditingController();
  final TextEditingController pendapatanKotorPertahunController =
      TextEditingController();
  final TextEditingController namaBankController = TextEditingController();
  final TextEditingController cabangBankController = TextEditingController();
  final TextEditingController nomorRekeningController = TextEditingController();
  final TextEditingController namaPemilikRekeningController =
      TextEditingController();

  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    context.read<ProfileBloc>().add(LoadInformasiPerusahaan());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is InformasiPerusahaanLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is InformasiPerusahaanLoaded) {
          final informasiPerusahaan = state.informasiPerusahaanModel;
          namaUsahaController.text = informasiPerusahaan.namaUsaha;
          alamatUsahaController.text = informasiPerusahaan.alamatUsaha;
          jabatanController.text = informasiPerusahaan.jabatan;
          lamaBekerjaController.text = informasiPerusahaan.lamaBekerja;
          sumberPendapatanController.text =
              informasiPerusahaan.sumberPendapatan;
          pendapatanKotorPertahunController.text =
              informasiPerusahaan.pendapatanKotorPertahun;
          namaBankController.text = informasiPerusahaan.namaBank;
          cabangBankController.text = informasiPerusahaan.cabangBank;
          nomorRekeningController.text = informasiPerusahaan.nomorRekening;
          namaPemilikRekeningController.text =
              informasiPerusahaan.namaPemilikRekening;
        } else if (state is Jabatan) {
          jabatanController.text = state.jabatan;
        } else if (state is LamaBekerja) {
          lamaBekerjaController.text = state.lamaBekerja;
        } else if (state is SumberPendapatan) {
          sumberPendapatanController.text = state.sumberPendapatan;
        } else if (state is PendapatanPerTahun) {
          pendapatanKotorPertahunController.text = state.pendapatanPerTahun;
        } else if (state is NamaBank) {
          namaBankController.text = state.namaBank;
        }
        InformasiPribadiController controller =
            Get.put(InformasiPribadiController());
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
                    controller: namaUsahaController,
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
                    controller: alamatUsahaController,
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
                        controller: jabatanController,
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
                        controller: lamaBekerjaController,
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
                        controller: sumberPendapatanController,
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
                        controller: pendapatanKotorPertahunController,
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
                        controller: namaBankController,
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
                    controller: cabangBankController,
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
                    controller: nomorRekeningController,
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
                    controller: namaPemilikRekeningController,
                    // enabled: false,
                    style: TStyle.paragraphSmallRegular,
                    textCapitalization: TextCapitalization.words,
                    decoration: kDefaultDecoration.copyWith(
                        hintText: 'Masukkan Nama Pemilik Rekening'),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
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
                                context.read<ProfileBloc>().add(
                                      SaveInformasiPerusahaan(
                                        InformasiPerusahaanModel(
                                          namaUsaha: namaUsahaController.text,
                                          alamatUsaha:
                                              alamatUsahaController.text,
                                          jabatan: jabatanController.text,
                                          lamaBekerja:
                                              lamaBekerjaController.text,
                                          sumberPendapatan:
                                              sumberPendapatanController.text,
                                          pendapatanKotorPertahun:
                                              pendapatanKotorPertahunController
                                                  .text,
                                          namaBank: namaBankController.text,
                                          cabangBank: cabangBankController.text,
                                          nomorRekening:
                                              namaPemilikRekeningController
                                                  .text,
                                          namaPemilikRekening:
                                              namaPemilikRekeningController
                                                  .text,
                                        ),
                                      ),
                                    );
                                Get.back();
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
