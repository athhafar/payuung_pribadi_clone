import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class TabBarProfileCard extends StatelessWidget {
  const TabBarProfileCard({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.isFirstIndex,
    required this.isLastIndex,
  });

  final String title;
  final bool isActive;
  final VoidCallback onTap;
  final bool isFirstIndex;
  final bool isLastIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isFirstIndex
          ? CrossAxisAlignment.start
          : isLastIndex
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            isFirstIndex
                ? const SizedBox()
                : Container(
                    width: 40,
                    height: 3,
                    color: isActive
                        ? kColorPrimary
                        : kColorPrimary.withOpacity(0.4),
                  ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isActive ? kColorPrimary : kColorPrimary.withOpacity(0.4),
              ),
              margin: EdgeInsets.only(
                  right: isLastIndex ? 16 : 0, left: isFirstIndex ? 4 : 0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    padding: const EdgeInsets.only(top: 6),
                    width: 40,
                    height: 40,
                    child: Text(
                      isFirstIndex
                          ? '1'
                          : isLastIndex
                              ? '3'
                              : '2',
                      style: TStyle.mobileHeading5Medium.copyWith(
                        color: kColorWhite,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            isLastIndex
                ? SizedBox()
                : Container(
                    width: 40,
                    height: 3,
                    color: isActive
                        ? kColorPrimary
                        : kColorPrimary.withOpacity(0.4),
                  ),
          ],
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(
          title,
          style: TStyle.paragraphSmallRegular.copyWith(color: kColorPrimary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
