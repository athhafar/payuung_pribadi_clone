import 'package:flutter/material.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class FilterExploreWelnessCard extends StatelessWidget {
  const FilterExploreWelnessCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kColorLightGrey, borderRadius: BorderRadius.circular(100)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.only(left: 8, right: 4),
            child: Row(
              children: [
                Text(
                  "Terpopuler",
                  style: TStyle.paragraphXSmallMedium,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
