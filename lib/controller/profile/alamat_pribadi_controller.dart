import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payuung_pribadi/models/alamat_pribadi_model.dart';
import 'package:payuung_pribadi/utilities/database_helper.dart';

class AlamatPribadiController extends GetxController {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  var listTextEditingAkunRequired = <TextEditingController>[].obs;
  var isAllFormValid = false.obs;

  var pickerPhoto = ImagePicker().obs;
  var filePathPhoto = "".obs;
  var deletePhoto = false.obs;

  // Controllers for text fields
  final TextEditingController nikController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kotaController = TextEditingController();
  final TextEditingController kecamatanController = TextEditingController();
  final TextEditingController kelurahanController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadAlamat();

    listTextEditingAkunRequired.value = [
      nikController,
      alamatController,
      provinsiController,
      kotaController,
      kecamatanController,
      kelurahanController,
      kodePosController,
    ];

    for (int i = 0; i < listTextEditingAkunRequired.length; i++) {
      listTextEditingAkunRequired[i].addListener(() {
        listTextEditingAkunRequired.every((element) => element.text.isNotEmpty
            ? isAllFormValid.value = true
            : isAllFormValid.value = false);
      });
    }
  }

  Future<void> changePhoto({bool camera = false}) async {
    final pickedFile = await pickerPhoto.value
        .pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);

    if (pickedFile != null) {
      filePathPhoto.value = pickedFile.path;
    } else {
      print('No image selected.');
    }
  }

  Future<void> saveAlamat() async {
    final alamatModel = AlamatPribadiModel(
      nik: nikController.text,
      alamat: alamatController.text,
      provinsi: provinsiController.text,
      kota: kotaController.text,
      kecamatan: kecamatanController.text,
      kelurahan: kelurahanController.text,
      kodePos: kodePosController.text,
      photoPath: filePathPhoto.value,
    );

    print('Saving biodata: ${alamatModel.toMap()}');

    await dbHelper.insertAlamat(alamatModel);
    Get.snackbar('Success', 'Biodata saved successfully!');
  }

  Future<void> loadAlamat() async {
    final alamatModel = await dbHelper.getAlamat();
    if (alamatModel != null) {
      nikController.text = alamatModel.nik;
      alamatController.text = alamatModel.alamat;
      provinsiController.text = alamatModel.provinsi;
      kotaController.text = alamatModel.kota;
      kecamatanController.text = alamatModel.kecamatan;
      kelurahanController.text = alamatModel.kelurahan;
      kodePosController.text = alamatModel.kodePos;
      filePathPhoto.value = alamatModel.photoPath ?? '';
    } else {
      print('No data found for the given ID.');
    }
  }

  @override
  void onClose() {
    nikController.dispose();
    alamatController.dispose();
    provinsiController.dispose();
    kotaController.dispose();
    kecamatanController.dispose();
    kelurahanController.dispose();
    kodePosController.dispose();
    super.onClose();
  }

  var isCheck = true.obs;
  List<String> provinsiList = ['DKI JAKARTA', 'JAKARTA'];
  List<String> kotaList = ['JAKARTA TIMUR', 'JAKARTA TIMURR'];
  List<String> kecamatanList = ['PASAR REBO', 'PASAR REBOO'];
  List<String> kelurahanList = ['PEKAYON', 'PEKAYOON'];
}
