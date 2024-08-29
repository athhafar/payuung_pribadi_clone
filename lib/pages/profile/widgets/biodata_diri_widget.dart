import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/bloc/profile/profile_bloc.dart';
import 'package:payuung_pribadi/buttons/button_primary.dart';
import 'package:payuung_pribadi/controller/profile/informasi_pribadi_controller.dart';
import 'package:payuung_pribadi/models/biodata_model.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_jenis_kelamin.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_pendidikan.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_status_nikah.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/constant.dart';
import 'package:payuung_pribadi/utilities/typography.dart';
import 'package:payuung_pribadi/widgets/date_picker_costum.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BiodataDiriWidget extends StatefulWidget {
  @override
  State<BiodataDiriWidget> createState() => _BiodataDiriWidgetState();
}

class _BiodataDiriWidgetState extends State<BiodataDiriWidget> {
  RefreshController refreshController = RefreshController();
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController pendidikanController = TextEditingController();
  final TextEditingController statusPernikahanController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadBiodataDiri());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is BiodataDiriError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is BiodataDiriLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BiodataDiriLoaded) {
          final biodata = state.biodata;
          namaLengkapController.text = biodata.namaLengkap;
          tanggalLahirController.text = biodata.tanggalLahir;
          jenisKelaminController.text = biodata.jenisKelamin;
          emailController.text = biodata.email;
          noHpController.text = biodata.noHp;
          pendidikanController.text = biodata.pendidikan;
          statusPernikahanController.text = biodata.statusPernikahan;
        } else if (state is PendidikanSelected) {
          pendidikanController.text = state.pendidikan;
        } else if (state is JenisKelaminSelected) {
          jenisKelaminController.text = state.jenisKelamin;
        } else if (state is StatusPernikahanSelected) {
          statusPernikahanController.text = state.statusPernikahan;
        }

        InformasiPribadiController controller =
            Get.put(InformasiPribadiController());
        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          controller: refreshController,
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 1000));
            context.read<ProfileBloc>().add(LoadBiodataDiri());
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
                    controller: namaLengkapController,
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
                      tanggalLahirController.text = data;
                    },
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
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
                        controller: jenisKelaminController,
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
                    controller: emailController,
                    style: TStyle.paragraphSmallRegular,
                    decoration:
                        kDefaultDecoration.copyWith(hintText: 'Alamat Email'),
                  ),
                  const SizedBox(height: 12.0),
                  Text("* No. HP", style: TStyle.paragraphXSmallRegular),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: noHpController,
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
                        controller: pendidikanController,
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
                  Text("STATUS PERNIKAHAN",
                      style: TStyle.paragraphXSmallRegular),
                  const SizedBox(height: 4.0),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.bottomSheet(BottomSheetStatusNikah());
                      },
                      child: TextFormField(
                        controller: statusPernikahanController,
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
                  ButtonPrimary(
                    text: 'Selanjutnya',
                    onTap: () {
                      final biodata = Biodata(
                        namaLengkap: namaLengkapController.text,
                        tanggalLahir: tanggalLahirController.text,
                        jenisKelamin: jenisKelaminController.text,
                        email: emailController.text,
                        noHp: noHpController.text,
                        pendidikan: pendidikanController.text,
                        statusPernikahan: statusPernikahanController.text,
                      );
                      context.read<ProfileBloc>().add(SaveBiodataDiri(biodata));
                      controller.isSelectedIndex.value = 1;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
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
