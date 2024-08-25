import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payuung_pribadi/utilities/asset_constant.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary(
      {Key? key,
      this.isWithArrow = false,
      required this.text,
      required this.onTap,
      this.isActive = true,
      this.bgColor = kColorPrimary,
      this.textColor = kColorNeutral600})
      : super(key: key);
  final bool isWithArrow;
  final String text;
  final VoidCallback onTap;
  final bool isActive;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isActive ? bgColor : kColorPrimary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(100)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isActive ? onTap : () {},
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TStyle.paragraphSmallSemiBold.copyWith(
                    color: isActive ? textColor : kColorNeutral400,
                  ),
                  textAlign: TextAlign.center,
                ),
                isWithArrow
                    ? Container(
                        margin: const EdgeInsets.only(left: 4),
                        child: SvgPicture.asset(
                          AssetConstant.icArrowRight,
                          color: kColorNeutral600,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
