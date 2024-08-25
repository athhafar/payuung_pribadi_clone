class InformasiPerusahaanModel {
  final String namaUsaha;
  final String alamatUsaha;
  final String jabatan;
  final String lamaBekerja;
  final String sumberPendapatan;
  final String pendapatanKotorPertahun;
  final String namaBank;
  final String cabangBank;
  final String nomorRekening;
  final String namaPemilikRekening;

  InformasiPerusahaanModel({
    required this.namaUsaha,
    required this.alamatUsaha,
    required this.jabatan,
    required this.lamaBekerja,
    required this.sumberPendapatan,
    required this.pendapatanKotorPertahun,
    required this.namaBank,
    required this.cabangBank,
    required this.nomorRekening,
    required this.namaPemilikRekening,
  });

  Map<String, dynamic> toMap() {
    return {
      'namaUsaha': namaUsaha,
      'alamatUsaha': alamatUsaha,
      'jabatan': jabatan,
      'lamaBekerja': lamaBekerja,
      'sumberPendapatan': sumberPendapatan,
      'pendapatanKotorPertahun': pendapatanKotorPertahun,
      'namaBank': namaBank,
      'cabangBank': cabangBank,
      'nomorRekening': nomorRekening,
      'namaPemilikRekening': namaPemilikRekening,
    };
  }

  factory InformasiPerusahaanModel.fromMap(Map<String, dynamic> map) {
    return InformasiPerusahaanModel(
      namaUsaha: map['namaUsaha'],
      alamatUsaha: map['alamatUsaha'],
      jabatan: map['jabatan'],
      lamaBekerja: map['lamaBekerja'],
      sumberPendapatan: map['sumberPendapatan'],
      pendapatanKotorPertahun: map['pendapatanKotorPertahun'],
      namaBank: map['namaBank'],
      cabangBank: map['cabangBank'],
      nomorRekening: map['nomorRekening'],
      namaPemilikRekening: map['namaPemilikRekening'],
    );
  }
}
