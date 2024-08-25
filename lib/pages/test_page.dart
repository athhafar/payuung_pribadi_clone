import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'HALAMAN INI MASIH DALAM PEMBUATAN',
            style: TStyle.mobileHeading2Medium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
