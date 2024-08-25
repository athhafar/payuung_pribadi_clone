import 'package:path/path.dart';
import 'package:payuung_pribadi/models/informasi_perusahaan_model.dart';
import 'package:payuung_pribadi/pages/profile/widgets/informasi_perusahaan_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:payuung_pribadi/models/biodata_model.dart';
import 'package:payuung_pribadi/models/alamat_pribadi_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('biodata.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 3, // Mengubah versi database untuk memicu onUpgrade
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const textType = 'TEXT NOT NULL';

    // Tabel biodata
    await db.execute('''
CREATE TABLE biodata (
  namaLengkap $textType,
  tanggalLahir $textType,
  jenisKelamin $textType,
  email $textType,
  noHp $textType,
  pendidikan $textType,
  statusPernikahan $textType
  )
''');

    // Tabel alamat_pribadi
    await db.execute('''
CREATE TABLE alamat_pribadi (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nik $textType,
  alamat $textType,
  provinsi $textType,
  kota $textType,
  kecamatan $textType,
  kelurahan $textType,
  kodePos $textType,
  photoPath $textType
  )
''');

    // Tabel informasi_perusahaan baru
    await db.execute('''
CREATE TABLE informasi_perusahaan (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  namaUsaha $textType,
  alamatUsaha $textType,
  jabatan $textType,
  lamaBekerja $textType,
  sumberPendapatan $textType,
  pendapatanKotorPertahun $textType,
  namaBank $textType,
  cabangBank $textType,
  nomorRekening $textType,
  namaPemilikRekening $textType
  )
''');
  }

  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 3) {
      // Hapus tabel informasi_perusahaan yang lama
      await db.execute('DROP TABLE IF EXISTS informasi_perusahaan');

      // Buat ulang tabel informasi_perusahaan dengan struktur baru
      await db.execute('''
CREATE TABLE informasi_perusahaan (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  namaUsaha TEXT NOT NULL,
  alamatUsaha TEXT NOT NULL,
  jabatan TEXT NOT NULL,
  lamaBekerja TEXT NOT NULL,
  sumberPendapatan TEXT NOT NULL,
  pendapatanKotorPertahun TEXT NOT NULL,
  namaBank TEXT NOT NULL,
  cabangBank TEXT NOT NULL,
  nomorRekening TEXT NOT NULL,
  namaPemilikRekening TEXT NOT NULL
  )
''');
    }
  }

  // Biodata Methods
  Future<void> insertBiodata(Biodata biodata) async {
    final db = await instance.database;
    await db.delete('biodata');
    await db.insert('biodata', biodata.toMap());
  }

  Future<Biodata?> getBiodata() async {
    final db = await instance.database;

    final maps = await db.query('biodata');

    if (maps.isNotEmpty) {
      return Biodata.fromMap(maps.first);
    } else {
      return null; // Mengembalikan null jika tidak ada data yang ditemukan
    }
  }

  Future<void> clearBiodata() async {
    final db = await instance.database;
    await db.delete('biodata');
  }

  // Alamat Pribadi Methods
  Future<void> insertAlamat(AlamatPribadiModel alamat) async {
    final db = await instance.database;
    await db.delete('alamat_pribadi');
    await db.insert('alamat_pribadi', alamat.toMap());
  }

  Future<AlamatPribadiModel?> getAlamat() async {
    final db = await instance.database;

    final maps = await db.query('alamat_pribadi');

    if (maps.isNotEmpty) {
      return AlamatPribadiModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<void> clearAlamat() async {
    final db = await instance.database;
    await db.delete('alamat_pribadi');
  }

  // Informasi Perusahaan Methods

  Future<void> insertInformasiPerusahaan(InformasiPerusahaanModel info) async {
    final db = await instance.database;
    await db.delete('informasi_perusahaan');
    await db.insert('informasi_perusahaan', info.toMap());
  }

  Future<InformasiPerusahaanModel?> getInformasiPerusahaan() async {
    final db = await instance.database;

    final maps = await db.query('informasi_perusahaan');

    if (maps.isNotEmpty) {
      return InformasiPerusahaanModel.fromMap(maps.first);
    } else {
      return null; // Mengembalikan null jika tidak ada data yang ditemukan
    }
  }

  Future<void> clearInformasiPerusahaan() async {
    final db = await instance.database;
    await db.delete('informasi_perusahaan');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
