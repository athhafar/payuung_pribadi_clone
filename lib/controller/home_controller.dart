import 'package:get/get.dart';
import 'package:payuung_pribadi/models/explore_welness_model.dart';
import 'package:payuung_pribadi/models/menu_model.dart';
import 'package:payuung_pribadi/utilities/asset_constant.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  List<String> listTab = [
    "Payung Karyawan",
    'Payung Pribadi',
  ];

  List<MenuModel> listProdukKeuangan = [
    MenuModel(title: 'Urun', icon: AssetConstant.icPerson),
    MenuModel(title: 'Pembiayaan Porsi Haji', icon: AssetConstant.icPray),
    MenuModel(title: 'Financial Check Up', icon: AssetConstant.icMoney),
    MenuModel(title: 'Asuransi Mobil', icon: AssetConstant.icAsuransiCar),
    MenuModel(title: 'Asuransi Properti', icon: AssetConstant.icAsuransi),
  ];

  List<MenuModel> listKategoriPilihan = [
    MenuModel(title: 'Hobi', icon: AssetConstant.icHobi),
    MenuModel(title: 'Merchandise', icon: AssetConstant.icTshirt),
    MenuModel(title: 'Gaya Hidup Sehat', icon: AssetConstant.icHeart),
    MenuModel(title: 'Konseling & Rohani', icon: AssetConstant.icChat),
    MenuModel(title: 'Self Development', icon: AssetConstant.icBrain),
    MenuModel(title: 'Perencanaan Keuangan', icon: AssetConstant.icWallet),
    MenuModel(title: 'Konstultasi', icon: AssetConstant.icMask),
    MenuModel(title: 'Lihat Semua', icon: AssetConstant.icMenu),
  ];

  List<ExploreWelnessModel> listExploreWelness = [
    ExploreWelnessModel(
      title: 'Voucher Digital Indomaret Rp 25.000',
      desc: 'Rp. 25.000',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Logo_Indomaret.png/1280px-Logo_Indomaret.png',
    ),
    ExploreWelnessModel(
      title: 'Voucher Digital Grab Transport Rp 20.000',
      desc: 'Rp. 20.000',
      image: 'https://statik.tempo.co/data/2019/02/26/id_822517/822517_720.jpg',
    ),
    ExploreWelnessModel(
      title: 'Voucher Digital Grab Transport Rp 50.000',
      desc: 'Rp. 50.000',
      image: 'https://statik.tempo.co/data/2019/02/26/id_822517/822517_720.jpg',
    ),
    ExploreWelnessModel(
      title: 'Voucher Digital Indomaret Rp 50.000',
      desc: 'Rp. 50.000',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Logo_Indomaret.png/1280px-Logo_Indomaret.png',
    ),
    ExploreWelnessModel(
      title: 'Voucher Digital Indomaret Rp 75.000',
      desc: 'Rp. 75.000',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Logo_Indomaret.png/1280px-Logo_Indomaret.png',
    ),
    ExploreWelnessModel(
      title: 'Voucher Digital Grab Transport Rp 75.000',
      desc: 'Rp. 75.000',
      image: 'https://statik.tempo.co/data/2019/02/26/id_822517/822517_720.jpg',
    ),
  ];
}
