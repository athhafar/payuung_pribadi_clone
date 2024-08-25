import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class TabbarCard extends StatelessWidget {
  const TabbarCard({
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
    return Container(
      margin: EdgeInsets.only(right: isLastIndex ? 0 : 12),
      decoration: BoxDecoration(
        color: isActive ? kColorPrimary : softGrey,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              title,
              style: TStyle.paragraphSmallMedium.copyWith(
                color: isActive ? kColorWhite : kColorGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
