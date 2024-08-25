import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:payuung_pribadi/models/informasi_perusahaan_model.dart';
import 'package:payuung_pribadi/utilities/database_helper.dart';

class InformasiPerusahaanController extends GetxController {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  // Inisialisasi TextEditingController untuk setiap field
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

  @override
  void onInit() {
    super.onInit();
    loadInformasiPerusahaan(); // Load data saat controller diinisialisasi
  }

  // Method untuk menyimpan informasi perusahaan
  Future<void> saveInformasiPerusahaan() async {
    final info = InformasiPerusahaanModel(
      namaUsaha: namaUsahaController.text,
      alamatUsaha: alamatUsahaController.text,
      jabatan: jabatanController.text,
      lamaBekerja: lamaBekerjaController.text,
      sumberPendapatan: sumberPendapatanController.text,
      pendapatanKotorPertahun: pendapatanKotorPertahunController.text,
      namaBank: namaBankController.text,
      cabangBank: cabangBankController.text,
      nomorRekening: nomorRekeningController.text,
      namaPemilikRekening: namaPemilikRekeningController.text,
    );

    print('Saving informasi perusahaan: ${info.toMap()}');
    await dbHelper.insertInformasiPerusahaan(info);
    Get.snackbar('Success', 'Informasi perusahaan saved successfully!');
  }

  // Method untuk memuat informasi perusahaan yang tersimpan
  Future<void> loadInformasiPerusahaan() async {
    final info = await dbHelper.getInformasiPerusahaan();
    if (info != null) {
      namaUsahaController.text = info.namaUsaha;
      alamatUsahaController.text = info.alamatUsaha;
      jabatanController.text = info.jabatan;
      lamaBekerjaController.text = info.lamaBekerja;
      sumberPendapatanController.text = info.sumberPendapatan;
      pendapatanKotorPertahunController.text = info.pendapatanKotorPertahun;
      namaBankController.text = info.namaBank;
      cabangBankController.text = info.cabangBank;
      nomorRekeningController.text = info.nomorRekening;
      namaPemilikRekeningController.text = info.namaPemilikRekening;
    }
  }

  @override
  void dispose() {
    // Dispose semua controller untuk menghindari memory leaks
    namaUsahaController.dispose();
    alamatUsahaController.dispose();
    jabatanController.dispose();
    lamaBekerjaController.dispose();
    sumberPendapatanController.dispose();
    pendapatanKotorPertahunController.dispose();
    namaBankController.dispose();
    cabangBankController.dispose();
    nomorRekeningController.dispose();
    namaPemilikRekeningController.dispose();
    super.dispose();
  }

  List<String> jabatanList = [
    'Manajer',
    'Supervisor',
    'Staff',
    'Administrasi',
    'Teknisi',
    'Marketing',
    'Akuntan',
    'Asisten',
    'Desainer',
    'Pengembang'
  ];

  List<String> lamaBekerjaList = [
    'Kurang dari 1 tahun',
    '1 - 2 tahun',
    '2 - 3 tahun',
    '3 - 5 tahun',
    '5 - 7 tahun',
    '7 - 10 tahun',
    'Lebih dari 10 tahun',
  ];

  List<String> sumberPendapatanList = [
    'Gaji Tetap',
    'Bisnis',
    'Investasi',
    'Penghasilan Sampingan',
    'Honorarium',
    'Hasil Sewa',
    'Lainnya',
  ];

  List<String> pendapatanKotorList = [
    '< 50 Juta',
    '50 Juta - 100 Juta',
    '100 Juta - 200 Juta',
    '200 Juta - 500 Juta',
    '500 Juta - 1 Miliar',
    '1 Miliar - 2 Miliar',
    '> 2 Miliar',
  ];

  List<String> namaBankList = [
    'Bank Negara Indonesia (BNI)',
    'Bank Rakyat Indonesia (BRI)',
    'Bank Mandiri',
    'Bank Central Asia (BCA)',
    'Bank CIMB Niaga',
    'Bank Danamon',
    'Bank Permata',
    'Bank Negara Indonesia Syariah (BNI Syariah)',
    'Bank Muamalat',
    'Bank BTPN',
  ];
}
