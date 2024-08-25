import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class Helper {
  static copyData({required String data}) async {
    await Clipboard.setData(ClipboardData(text: data)).then((value) {
      // setSnackbar("Berhasil Menyalin");
    });
  }

  static String getInitialName(String name) {
    String codeName = "";
    if (name.split(' ').length > 1) {
      if (name.split(' ')[1].isNotEmpty) {
        codeName = name.split(' ')[0][0] + name.split(' ')[1][0].toUpperCase();
      } else {
        codeName = name.split(' ')[0][0] + name.split(' ')[2][0].toUpperCase();
      }
    } else {
      codeName = name[0].toUpperCase();
    }
    return codeName.toUpperCase();
  }

  static setSnackbar(String message, {durations = 2}) {
    Get.snackbar(
      '',
      "",
      borderRadius: 8,
      titleText: const SizedBox(),
      margin: const EdgeInsets.all(16),
      messageText: Container(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          message,
          style: TStyle.paragraphSmallRegular.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      padding: const EdgeInsets.only(top: 4, bottom: 6, left: 16, right: 16),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: kColorBlack,
      duration: Duration(seconds: durations),
    );
  }
}
