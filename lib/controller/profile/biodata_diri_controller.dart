import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:payuung_pribadi/models/biodata_model.dart';
import 'package:payuung_pribadi/utilities/database_helper.dart';
import 'package:intl/intl.dart';

class BiodataDiriController extends GetxController {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  void onInit() {
    super.onInit();
    loadBiodata();
  }

  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController pendidikanController = TextEditingController();
  final TextEditingController statusPernikahanController =
      TextEditingController();

  Future<void> saveBiodata() async {
    final biodata = Biodata(
      namaLengkap: namaLengkapController.text,
      tanggalLahir: tanggalLahirController.text,
      jenisKelamin: jenisKelaminController.text,
      email: emailController.text,
      noHp: noHpController.text,
      pendidikan: pendidikanController.text,
      statusPernikahan: statusPernikahanController.text,
    );

    print('Saving biodata: ${biodata.toMap()}');

    await dbHelper.insertBiodata(biodata);

    Get.snackbar('Success', 'Biodata saved successfully!');
  }

  Future<void> loadBiodata() async {
    final biodata = await dbHelper.getBiodata();
    if (biodata != null) {
      namaLengkapController.text = biodata.namaLengkap;
      tanggalLahirController.text = biodata.tanggalLahir;
      jenisKelaminController.text = biodata.jenisKelamin;
      emailController.text = biodata.email;
      noHpController.text = biodata.noHp;
      pendidikanController.text = biodata.pendidikan;
      statusPernikahanController.text = biodata.statusPernikahan;
      print('Loaded biodata: ${biodata.toMap()}'); // Logging untuk debug
    } else {
      print('No biodata found.');
    }
  }

  final List<String> genders = ['Laki Laki', 'Perempuan'];

  final List<String> pendidikan = [
    'S1',
    'S2',
    'S3',
    'Diploma',
    'SMA',
    'SMP',
    'SD'
  ];

  final List<String> statusPernikahan = [
    'Belum Menikah',
    'Menikah',
    'Janda',
    'Duda'
  ];
  DateTime? parseDate(String dateString) {
    try {
      final dateFormat = DateFormat('dd-MM-yyyy');
      return dateFormat.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  @override
  void onClose() {
    namaLengkapController.dispose();
    tanggalLahirController.dispose();
    jenisKelaminController.dispose();
    emailController.dispose();
    noHpController.dispose();
    pendidikanController.dispose();
    statusPernikahanController.dispose();
    super.onClose();
  }
}
