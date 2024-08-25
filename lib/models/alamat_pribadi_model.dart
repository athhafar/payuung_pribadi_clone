// lib/models/alamat_pribadi_model.dart

class AlamatPribadiModel {
  final String nik;
  final String alamat;
  final String provinsi;
  final String kota;
  final String kecamatan;
  final String kelurahan;
  final String kodePos;
  final String photoPath;

  AlamatPribadiModel({
    required this.nik,
    required this.alamat,
    required this.provinsi,
    required this.kota,
    required this.kecamatan,
    required this.kelurahan,
    required this.kodePos,
    required this.photoPath,
  });

  // Convert a model into a map
  Map<String, dynamic> toMap() {
    return {
      'nik': nik,
      'alamat': alamat,
      'provinsi': provinsi,
      'kota': kota,
      'kecamatan': kecamatan,
      'kelurahan': kelurahan,
      'kodePos': kodePos,
      'photoPath': photoPath,
    };
  }

  // Convert a map into a model
  factory AlamatPribadiModel.fromMap(Map<String, dynamic> map) {
    return AlamatPribadiModel(
      nik: map['nik'],
      alamat: map['alamat'],
      provinsi: map['provinsi'],
      kota: map['kota'],
      kecamatan: map['kecamatan'],
      kelurahan: map['kelurahan'],
      kodePos: map['kodePos'],
      photoPath: map['photoPath'],
    );
  }
}
