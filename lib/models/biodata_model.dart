class Biodata {
  String namaLengkap;
  String tanggalLahir;
  String jenisKelamin;
  String email;
  String noHp;
  String pendidikan;
  String statusPernikahan;

  Biodata({
    required this.namaLengkap,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.email,
    required this.noHp,
    required this.pendidikan,
    required this.statusPernikahan,
  });

  Map<String, dynamic> toMap() {
    return {
      'namaLengkap': namaLengkap,
      'tanggalLahir': tanggalLahir,
      'jenisKelamin': jenisKelamin,
      'email': email,
      'noHp': noHp,
      'pendidikan': pendidikan,
      'statusPernikahan': statusPernikahan,
    };
  }

  factory Biodata.fromMap(Map<String, dynamic> map) {
    return Biodata(
      namaLengkap: map['namaLengkap'],
      tanggalLahir: map['tanggalLahir'],
      jenisKelamin: map['jenisKelamin'],
      email: map['email'],
      noHp: map['noHp'],
      pendidikan: map['pendidikan'],
      statusPernikahan: map['statusPernikahan'],
    );
  }
}
