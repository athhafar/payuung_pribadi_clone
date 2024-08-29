import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/bloc/profile/profile_bloc.dart';
import 'package:payuung_pribadi/buttons/button_primary.dart';
import 'package:payuung_pribadi/controller/profile/informasi_pribadi_controller.dart';
import 'package:payuung_pribadi/models/alamat_pribadi_model.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheeet_kelurahan.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_kecamatan.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_kota.dart';
import 'package:payuung_pribadi/pages/profile/widgets/bottom_sheet_provinsi.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/constant.dart';
import 'package:payuung_pribadi/utilities/typography.dart';
import 'package:payuung_pribadi/widgets/check_box_costum.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AlamatPribadiWidget extends StatefulWidget {
  const AlamatPribadiWidget({Key? key}) : super(key: key);

  @override
  State<AlamatPribadiWidget> createState() => _AlamatPribadiWidgetState();
}

class _AlamatPribadiWidgetState extends State<AlamatPribadiWidget> {
  final RefreshController _refreshController = RefreshController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _provinsiController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();
  final TextEditingController _kecamatanController = TextEditingController();
  final TextEditingController _kelurahanController = TextEditingController();
  final TextEditingController _kodePosController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Trigger initial load of data
    context.read<ProfileBloc>().add(LoadAlamatPribadi());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        // Handle state changes if needed
      },
      builder: (context, state) {
        if (state is AlmatLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AlamatLoaded) {
          final alamat = state.alamat;
          _nikController.text = alamat.nik;
          _alamatController.text = alamat.alamat;
          _provinsiController.text = alamat.provinsi;
          _kotaController.text = alamat.kota;
          _kecamatanController.text = alamat.kecamatan;
          _kelurahanController.text = alamat.kelurahan;
          _kodePosController.text = alamat.kodePos;
        } else if (state is Provinsi) {
          _provinsiController.text = state.provinsi;
        } else if (state is Kota) {
          _kotaController.text = state.kota;
        } else if (state is Kecamatan) {
          _kecamatanController.text = state.kecamatan;
        } else if (state is Kelurahan) {
          _kelurahanController.text = state.kelurahan;
        }
        InformasiPribadiController controller =
            Get.put(InformasiPribadiController());
        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          controller: _refreshController,
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 1000));
            _refreshController.refreshCompleted();
          },
          onLoading: () async {
            await Future.delayed(const Duration(milliseconds: 1000));
            _refreshController.loadComplete();
          },
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocConsumer<ProfileBloc, ProfileState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is PhotoLoaded && state.filePath.isNotEmpty) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.005,
                            right: MediaQuery.of(context).size.height * 0.007,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: state.filePath.contains("http")
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
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    state.filePath,
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
                                            ),
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
                                                    File(state.filePath),
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
                                            ),
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
                    },
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    "* NIK",
                    style: TStyle.paragraphXSmallRegular,
                  ),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: _nikController,
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
                    controller: _alamatController,
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
                        controller: _provinsiController,
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
                        controller: _kotaController,
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
                        controller: _kecamatanController,
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
                        controller: _kelurahanController,
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
                    controller: _kodePosController,
                    style: TStyle.paragraphSmallRegular,
                    decoration: kDefaultDecoration.copyWith(
                        hintText: 'Masukkan Kode Pos'),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CheckBoxCustom(
                              check: true,
                              onTap: () {},
                            ),
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
                                text: 'Simpan',
                                onTap: () {
                                  context.read<ProfileBloc>().add(
                                        SaveAlamatPribadi(
                                          AlamatPribadiModel(
                                            nik: _nikController.text,
                                            alamat: _alamatController.text,
                                            provinsi: _provinsiController.text,
                                            kota: _kotaController.text,
                                            kecamatan:
                                                _kecamatanController.text,
                                            kelurahan:
                                                _kelurahanController.text,
                                            kodePos: _kodePosController.text,
                                            photoPath: '',
                                          ),
                                        ),
                                      );
                                  controller.isSelectedIndex.value = 2;
                                },
                              ),
                            ),
                          ],
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

  void _showPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Ambil Foto'),
                onTap: () {
                  context.read<ProfileBloc>().add(ChangePhoto(camera: true));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pilih dari Galeri'),
                onTap: () {
                  context.read<ProfileBloc>().add(ChangePhoto());
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
