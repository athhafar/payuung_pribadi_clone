import 'package:flutter/material.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class FilterKategoriPilihanCard extends StatelessWidget {
  const FilterKategoriPilihanCard({
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
                  "Whislist",
                  style: TStyle.paragraphXSmallMedium,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: kColorPrimary, shape: BoxShape.circle),
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    '0',
                    style: TStyle.paragraphXSmallRegular.copyWith(
                      color: kColorWhite,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
