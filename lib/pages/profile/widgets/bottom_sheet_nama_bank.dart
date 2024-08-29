import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/bloc/profile/profile_bloc.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class BottomSheetNamaBank extends StatelessWidget {
  BottomSheetNamaBank({Key? key}) : super(key: key);

  List<String> namaBankList = [
    'Bank Negara Indonesia (BNI)',
    'Bank Rakyat Indonesia (BRI)',
    'Bank Mandiri',
    'Bank Central Asia (BCA)',
    'Bank CIMB Niaga',
    'Bank Danamon',
    'Bank Permata',
    'Bank Negara Indonesia Syariah (BNI Syariah)',
    'Bank Muamalat',
    'Bank BTPN',
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
                itemCount: namaBankList.length,
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        context.read<ProfileBloc>().add(
                              SelectNamaBank(namaBankList[index]),
                            );
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
                              namaBankList[index],
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
