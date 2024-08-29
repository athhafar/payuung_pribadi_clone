part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class LoadBiodataDiri extends ProfileEvent {}

class SaveBiodataDiri extends ProfileEvent {
  final Biodata data;

  SaveBiodataDiri(this.data);
}

class LoadAlamatPribadi extends ProfileEvent {}

class SaveAlamatPribadi extends ProfileEvent {
  final AlamatPribadiModel data;

  SaveAlamatPribadi(this.data);
}

class LoadInformasiPerusahaan extends ProfileEvent {}

class SaveInformasiPerusahaan extends ProfileEvent {
  final InformasiPerusahaanModel data;

  SaveInformasiPerusahaan(this.data);
}

class SelectPendidikan extends ProfileEvent {
  final String pendidikan;
  SelectPendidikan(this.pendidikan);
}

class SelectJenisKelamin extends ProfileEvent {
  final String jenisKelamin;
  SelectJenisKelamin(this.jenisKelamin);
}

class SelectStatusPernikahan extends ProfileEvent {
  final String statusPernikahan;
  SelectStatusPernikahan(this.statusPernikahan);
}

class SelectProvinsi extends ProfileEvent {
  final String provinsi;
  SelectProvinsi(this.provinsi);
}

class SelectKota extends ProfileEvent {
  final String kota;
  SelectKota(this.kota);
}

class SelectKecamatan extends ProfileEvent {
  final String kecamatan;
  SelectKecamatan(this.kecamatan);
}

class SelectKelurahan extends ProfileEvent {
  final String kelurahan;
  SelectKelurahan(this.kelurahan);
}

class LoadPhoto extends ProfileEvent {}

class ChangePhoto extends ProfileEvent {
  final bool camera;

  ChangePhoto({this.camera = false});
}

class DeletePhoto extends ProfileEvent {}

class SelectJabatan extends ProfileEvent {
  final String jabatan;
  SelectJabatan(this.jabatan);
}

class SelectLamaBekerja extends ProfileEvent {
  final String lamaBekerja;
  SelectLamaBekerja(this.lamaBekerja);
}

class SelectSumberPendapatan extends ProfileEvent {
  final String sumberPendapatan;
  SelectSumberPendapatan(this.sumberPendapatan);
}

class SelectPendapatanPerTahun extends ProfileEvent {
  final String pendapatanPerTahun;
  SelectPendapatanPerTahun(this.pendapatanPerTahun);
}

class SelectNamaBank extends ProfileEvent {
  final String namaBank;
  SelectNamaBank(this.namaBank);
}

class SelectTab extends ProfileEvent {
  final int index;

  SelectTab(this.index);
}
