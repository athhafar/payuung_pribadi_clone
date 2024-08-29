import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/bloc/profile/profile_bloc.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class BottomSheetLamaBekerja extends StatelessWidget {
  BottomSheetLamaBekerja({Key? key}) : super(key: key);

  List<String> lamaBekerjaList = [
    'Kurang dari 1 tahun',
    '1 - 2 tahun',
    '2 - 3 tahun',
    '3 - 5 tahun',
    '5 - 7 tahun',
    '7 - 10 tahun',
    'Lebih dari 10 tahun',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16)),
          color: kColorWhite),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 12),
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                    color: kColorNeutral300,
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: lamaBekerjaList.length,
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        context
                            .read<ProfileBloc>()
                            .add(SelectLamaBekerja(lamaBekerjaList[index]));
                        Get.back();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 24,
                            ),
                            child: Text(
                              lamaBekerjaList[index],
                              style: TStyle.paragraphMediumRegular,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            height: 1,
                            color: kColorNeutral200,
                          )
                        ],
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
