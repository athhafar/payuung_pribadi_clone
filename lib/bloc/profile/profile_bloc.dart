import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:payuung_pribadi/models/alamat_pribadi_model.dart';
import 'package:payuung_pribadi/models/biodata_model.dart';
import 'package:payuung_pribadi/models/informasi_perusahaan_model.dart';
import 'package:payuung_pribadi/utilities/database_helper.dart';
import 'package:sqflite/sqflite.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DatabaseHelper dbHelper;
  final ImagePicker _picker = ImagePicker();

  ProfileBloc(this.dbHelper) : super(ProfileInitial()) {
    on<LoadBiodataDiri>((event, emit) async {
      emit(BiodataDiriLoading());
      try {
        final biodata = await dbHelper.getBiodata();
        if (biodata != null) {
          emit(BiodataDiriLoaded(biodata));
        } else {
          emit(BiodataDiriError('No biodata found.'));
        }
      } catch (e) {
        print("Error loading biodata: $e");
        emit(BiodataDiriError('Failed to load biodata.'));
      }
    });

    on<SaveBiodataDiri>((event, emit) async {
      try {
        final biodata = event.data;
        await dbHelper.insertBiodata(biodata);
        Get.snackbar('Success', 'Biodata saved successfully!');
        emit(BiodataDiriLoaded(biodata));
      } catch (e) {
        print("Error saving biodata: $e");
        emit(BiodataDiriError('Failed to save biodata.'));
      }
    });

    on<LoadAlamatPribadi>((event, emit) async {
      emit(BiodataDiriLoading());
      try {
        final alamat = await dbHelper.getAlamat();
        if (alamat != null) {
          emit(AlamatLoaded(alamat));
        } else {
          emit(AlamatError('No Alamat found.'));
        }
      } catch (e) {
        print("Error loading Alamat : $e");
        emit(AlamatError('Failed to load Alamat.'));
      }
    });

    on<SaveAlamatPribadi>((event, emit) async {
      try {
        final alamat = event.data;
        await dbHelper.insertAlamat(alamat);
        Get.snackbar('Success', 'Alamat saved successfully!');
        emit(AlamatLoaded(alamat));
      } catch (e) {
        print("Error saving alamat : $e");
        emit(BiodataDiriError('Failed to save alamat.'));
      }
    });

    on<LoadInformasiPerusahaan>((event, emit) async {
      emit(InformasiPerusahaanLoading());
      try {
        final inforomasiPerusahaan = await dbHelper.getInformasiPerusahaan();
        if (inforomasiPerusahaan != null) {
          emit(InformasiPerusahaanLoaded(inforomasiPerusahaan));
        } else {
          emit(InformasiPerusahaanError('Informasi Perusahaan Not found.'));
        }
      } catch (e) {
        print("Error loading Informasi Perusahaan : $e");
        emit(AlamatError('Failed to load Informasi Perusahaan.'));
      }
    });

    on<SaveInformasiPerusahaan>((event, emit) async {
      try {
        final informasiPerusahaan = event.data;
        await dbHelper.insertInformasiPerusahaan(informasiPerusahaan);
        Get.snackbar('Success', 'Informasi Perusahaan saved successfully!');
        emit(InformasiPerusahaanLoaded(informasiPerusahaan));
      } catch (e) {
        print("Error saving Informasi Perusahaan : $e");
        emit(InformasiPerusahaanError('Failed to save Informasi Perusahaan.'));
      }
    });

    on<SelectPendidikan>((event, emit) {
      emit(PendidikanSelected(event.pendidikan));
    });

    on<SelectJenisKelamin>((event, emit) {
      emit(JenisKelaminSelected(event.jenisKelamin));
    });

    on<SelectStatusPernikahan>((event, emit) {
      emit(StatusPernikahanSelected(event.statusPernikahan));
    });

    on<SelectProvinsi>((event, emit) {
      emit(Provinsi(event.provinsi));
    });

    on<SelectKota>((event, emit) {
      emit(Kota(event.kota));
    });

    on<SelectKecamatan>((event, emit) {
      emit(Kecamatan(event.kecamatan));
    });

    on<SelectKelurahan>((event, emit) {
      emit(Kelurahan(event.kelurahan));
    });

    on<LoadPhoto>((event, emit) {
      emit(PhotoInitial());
    });

    on<ChangePhoto>((event, emit) async {
      final pickedFile = await _picker.pickImage(
        source: event.camera ? ImageSource.camera : ImageSource.gallery,
      );

      if (pickedFile != null) {
        emit(PhotoLoaded(pickedFile.path));
      }
    });

    on<DeletePhoto>((event, emit) {
      emit(PhotoDeleted());
      emit(PhotoInitial());
    });

    on<SelectJabatan>((event, emit) {
      emit(Jabatan(event.jabatan));
    });

    on<SelectLamaBekerja>((event, emit) {
      emit(LamaBekerja(event.lamaBekerja));
    });

    on<SelectSumberPendapatan>((event, emit) {
      emit(SumberPendapatan(event.sumberPendapatan));
    });

    on<SelectPendapatanPerTahun>((event, emit) {
      emit(PendapatanPerTahun(event.pendapatanPerTahun));
    });

    on<SelectNamaBank>((event, emit) {
      emit(NamaBank(event.namaBank));
    });

    on<SelectTab>((event, emit) {
      if (state is TabLoaded) {
        final currentState = state as TabLoaded;
        emit(TabLoaded(
          selectedIndex: event.index,
          tabList: currentState.tabList,
        ));
      } else {
        emit(TabLoaded(
          selectedIndex: event.index,
          tabList: [
            "Biodata\nDiri",
            'Alamat\nPribadi',
            'Informasi\nPerusahaan',
          ],
        ));
      }
    });
  }
}
