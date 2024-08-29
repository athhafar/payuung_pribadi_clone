part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class BiodataDiriLoading extends ProfileState {}

class BiodataDiriLoaded extends ProfileState {
  final Biodata biodata;

  BiodataDiriLoaded(this.biodata);
}

class BiodataDiriError extends ProfileState {
  final String message;

  BiodataDiriError(this.message);
}

class AlmatLoading extends ProfileState {}

class AlamatLoaded extends ProfileState {
  final AlamatPribadiModel alamat;

  AlamatLoaded(this.alamat);
}

class AlamatError extends ProfileState {
  final String message;

  AlamatError(this.message);
}

class InformasiPerusahaanLoading extends ProfileState {}

class InformasiPerusahaanLoaded extends ProfileState {
  final InformasiPerusahaanModel informasiPerusahaanModel;

  InformasiPerusahaanLoaded(this.informasiPerusahaanModel);
}

class InformasiPerusahaanError extends ProfileState {
  final String message;

  InformasiPerusahaanError(this.message);
}

class PendidikanSelected extends ProfileState {
  final String pendidikan;
  PendidikanSelected(this.pendidikan);
}

class JenisKelaminSelected extends ProfileState {
  final String jenisKelamin;
  JenisKelaminSelected(this.jenisKelamin);
}

class StatusPernikahanSelected extends ProfileState {
  final String statusPernikahan;
  StatusPernikahanSelected(this.statusPernikahan);
}

class Provinsi extends ProfileState {
  final String provinsi;
  Provinsi(this.provinsi);
}

class Kota extends ProfileState {
  final String kota;
  Kota(this.kota);
}

class Kecamatan extends ProfileState {
  final String kecamatan;
  Kecamatan(this.kecamatan);
}

class Kelurahan extends ProfileState {
  final String kelurahan;
  Kelurahan(this.kelurahan);
}

class PhotoInitial extends ProfileState {}

class PhotoLoaded extends ProfileState {
  final String filePath;
  PhotoLoaded(this.filePath);
}

class PhotoDeleted extends ProfileState {}

class Jabatan extends ProfileState {
  final String jabatan;
  Jabatan(this.jabatan);
}

class LamaBekerja extends ProfileState {
  final String lamaBekerja;
  LamaBekerja(this.lamaBekerja);
}

class SumberPendapatan extends ProfileState {
  final String sumberPendapatan;
  SumberPendapatan(this.sumberPendapatan);
}

class PendapatanPerTahun extends ProfileState {
  final String pendapatanPerTahun;
  PendapatanPerTahun(this.pendapatanPerTahun);
}

class NamaBank extends ProfileState {
  final String namaBank;
  NamaBank(this.namaBank);
}

class TabInitial extends ProfileState {}

class TabLoaded extends ProfileState {
  final int selectedIndex;
  final List<String> tabList;

  TabLoaded({required this.selectedIndex, required this.tabList});
}
