import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/buttons/button_action.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class BottomSheetList extends StatelessWidget {
  const BottomSheetList({Key? key, required this.label, required this.listItem})
      : super(key: key);
  final String label;
  final List<String> listItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: kColorWhite,
      ),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
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
            Container(
              margin: const EdgeInsets.only(left: 16, right: 24),
              child: Row(
                children: [
                  ButtonAction(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.close)),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      label,
                      style: TStyle.paragraphMediumSemiBold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listItem.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.back(result: listItem[index].toString());
                          },
                          child: Container(
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text(
                              listItem[index],
                              textAlign: TextAlign.start,
                              style: TStyle.paragraphXSmallSemiBold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: Get.width,
                        color: kColorNeutral200,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
