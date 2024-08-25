import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class ExploreWelnessCard extends StatelessWidget {
  const ExploreWelnessCard({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  final String image;
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.2,
              child: Image.network(
                image,
                width: Get.width * 0.3,
              ),
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              title,
              style: TStyle.paragraphSmallRegular,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              desc,
              style: TStyle.paragraphSmallRegular,
            )
          ],
        ),
      ),
    );
  }
}
