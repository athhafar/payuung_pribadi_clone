import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payuung_pribadi/utilities/asset_constant.dart';
import 'package:payuung_pribadi/utilities/colors.dart';

class CheckBoxCustom extends StatelessWidget {
  const CheckBoxCustom(
      {Key? key,
      required this.check,
      required this.onTap,
      this.size = 20,
      this.bgColor = kColorPrimary})
      : super(key: key);
  final bool check;
  final VoidCallback onTap;
  final double size;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation) =>
            FadeTransition(
              opacity: animation,
              child: child,
            ),
        duration: const Duration(milliseconds: 100),
        child: Container(
            key: ValueKey<bool>(check),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: check ? bgColor : kColorWhite,
                          borderRadius: BorderRadius.circular(6),
                          border: check
                              ? null
                              : Border.all(color: kColorNeutral300)),
                    ),
                    check
                        ? SvgPicture.asset(AssetConstant.icCheck)
                        : const SizedBox()
                  ],
                ),
              ),
            )));
  }
}
