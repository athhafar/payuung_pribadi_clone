import 'package:flutter/material.dart';
import 'package:payuung_pribadi/utilities/colors.dart';

extension FigmaDimention on double {
  double toFigmaHeight(double fontSize) {
    return this / fontSize;
  }
}

class TStyle {
  //HEADING 1 DESKTOP
  static TextStyle desktopHeading1Medium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 40,
      color: kColorNeutral700,
      height: 48.0.toFigmaHeight(40));
  static TextStyle desktopHeading1SemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 40,
      color: kColorNeutral700,
      height: 48.0.toFigmaHeight(40));
  static TextStyle desktopHeading1Bold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 40,
      color: kColorNeutral700,
      height: 48.0.toFigmaHeight(40));
  static TextStyle desktopHeading1ExtraBold = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 40,
      color: kColorNeutral700,
      height: 48.0.toFigmaHeight(40));

  //HEADING 2 DESKTOP
  static TextStyle desktopHeading2Medium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 36,
      color: kColorNeutral700,
      height: 44.0.toFigmaHeight(36));
  static TextStyle desktopHeading2SemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 36,
      color: kColorNeutral700,
      height: 44.0.toFigmaHeight(36));
  static TextStyle desktopHeading2Bold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 36,
      color: kColorNeutral700,
      height: 44.0.toFigmaHeight(36));
  static TextStyle desktopHeading2ExtraBold = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 36,
      color: kColorNeutral700,
      height: 44.0.toFigmaHeight(36));

  //HEADING 3 DESKTOP
  static TextStyle desktopHeading3Medium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 32,
      color: kColorNeutral700,
      height: 40.0.toFigmaHeight(32));
  static TextStyle desktopHeading3SemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 32,
      color: kColorNeutral700,
      height: 40.0.toFigmaHeight(32));
  static TextStyle desktopHeading3Bold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: kColorNeutral700,
      height: 40.0.toFigmaHeight(32));
  static TextStyle desktopHeading3ExtraBold = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 32,
      color: kColorNeutral700,
      height: 40.0.toFigmaHeight(32));

  //HEADING 4 DESKTOP
  static TextStyle desktopHeading4Medium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 28,
      color: kColorNeutral700,
      height: 36.0.toFigmaHeight(28));
  static TextStyle desktopHeading4SemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 28,
      color: kColorNeutral700,
      height: 36.0.toFigmaHeight(28));
  static TextStyle desktopHeading4Bold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 28,
      color: kColorNeutral700,
      height: 36.0.toFigmaHeight(28));
  static TextStyle desktopHeading4ExtraBold = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 28,
      color: kColorNeutral700,
      height: 36.0.toFigmaHeight(28));

  //HEADING 5 DESKTOP
  static TextStyle desktopHeading5Medium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: kColorNeutral700,
      height: 32.0.toFigmaHeight(24));
  static TextStyle desktopHeading5SemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      color: kColorNeutral700,
      height: 32.0.toFigmaHeight(24));
  static TextStyle desktopHeading5Bold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: kColorNeutral700,
      height: 32.0.toFigmaHeight(24));
  static TextStyle desktopHeading5ExtraBold = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 24,
      color: kColorNeutral700,
      height: 32.0.toFigmaHeight(24));

  //HEADING 6 DESKTOP
  static TextStyle desktopHeading6Medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: kColorNeutral700,
    height: 28.0.toFigmaHeight(20),
  );
  static TextStyle desktopHeading6SemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: kColorNeutral700,
    height: 28.0.toFigmaHeight(20),
  );
  static TextStyle desktopHeading6Bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: kColorNeutral700,
    height: 28.0.toFigmaHeight(20),
  );
  static TextStyle desktopHeading6ExtraBold = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: kColorNeutral700,
    height: 28.0.toFigmaHeight(20),
  );

  //HEADING 1 MOBILE
  static TextStyle mobileHeading1Medium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 36,
      color: kColorNeutral700,
      height: 44.0.toFigmaHeight(36));
  static TextStyle mobileHeading1SemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 36,
      color: kColorNeutral700,
      height: 44.0.toFigmaHeight(36));
  static TextStyle mobileHeading1Bold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 36,
      color: kColorNeutral700,
      height: 44.0.toFigmaHeight(36));
  static TextStyle mobileHeading1ExtraBold = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 36,
      color: kColorNeutral700,
      height: 44.0.toFigmaHeight(36));

  //HEADING 2 MOBILE
  static TextStyle mobileHeading2Medium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 32,
      color: kColorNeutral700,
      height: 40.0.toFigmaHeight(32));
  static TextStyle mobileHeading2SemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 32,
      color: kColorNeutral700,
      height: 40.0.toFigmaHeight(32));
  static TextStyle mobileHeading2Bold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: kColorNeutral700,
      height: 40.0.toFigmaHeight(32));
  static TextStyle mobileHeading2ExtraBold = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 32,
      color: kColorNeutral700,
      height: 40.0.toFigmaHeight(32));

  //HEADING 3 MOBILE
  static TextStyle mobileHeading3Medium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 28,
      color: kColorNeutral700,
      height: 36.0.toFigmaHeight(28));
  static TextStyle mobileHeading3SemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 28,
      color: kColorNeutral700,
      height: 36.0.toFigmaHeight(28));
  static TextStyle mobileHeading3Bold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 28,
      color: kColorNeutral700,
      height: 36.0.toFigmaHeight(28));
  static TextStyle mobileHeading3ExtraBold = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 28,
      color: kColorNeutral700,
      height: 36.0.toFigmaHeight(28));

  //HEADING 4 MOBILE
  static TextStyle mobileHeading4Medium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: kColorNeutral700,
      height: 32.0.toFigmaHeight(24));
  static TextStyle mobileHeading4SemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      color: kColorNeutral700,
      height: 32.0.toFigmaHeight(24));
  static TextStyle mobileHeading4Bold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: kColorNeutral700,
      height: 32.0.toFigmaHeight(24));
  static TextStyle mobileHeading4ExtraBold = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 24,
      color: kColorNeutral700,
      height: 32.0.toFigmaHeight(24));

  //HEADING 5 MOBILE
  static TextStyle mobileHeading5Medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: kColorNeutral700,
    height: 28.0.toFigmaHeight(20),
  );
  static TextStyle mobileHeading5SemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: kColorNeutral700,
    height: 28.0.toFigmaHeight(20),
  );
  static TextStyle mobileHeading5Bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: kColorNeutral700,
    height: 28.0.toFigmaHeight(20),
  );
  static TextStyle mobileHeading5ExtraBold = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: kColorNeutral700,
    height: 28.0.toFigmaHeight(20),
  );

  //HEADING 6 MOBILE
  static TextStyle mobileHeading6Medium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: kColorNeutral700,
      height: 24.0.toFigmaHeight(18));
  static TextStyle mobileHeading6SemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: kColorNeutral700,
      height: 24.0.toFigmaHeight(18));
  static TextStyle mobileHeading6Bold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: kColorNeutral700,
      height: 24.0.toFigmaHeight(18));
  static TextStyle mobileHeading6ExtraBold = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 18,
      color: kColorNeutral700,
      height: 24.0.toFigmaHeight(18));

  //PARAGRAPH LARGE
  static TextStyle paragraphLargeRegular = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: kColorNeutral700,
      height: 28.0.toFigmaHeight(18));
  static TextStyle paragraphLargeMedium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: kColorNeutral700,
      height: 28.0.toFigmaHeight(18));
  static TextStyle paragraphLargeSemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: kColorNeutral700,
      height: 28.0.toFigmaHeight(18));

  //PARAGRAPH MEDIUM
  static TextStyle paragraphMediumRegular = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: kColorNeutral700,
      height: 24.0.toFigmaHeight(16));
  static TextStyle paragraphMediumMedium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: kColorNeutral700,
      height: 24.0.toFigmaHeight(16));
  static TextStyle paragraphMediumSemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: kColorNeutral700,
      height: 24.0.toFigmaHeight(16));

  //PARAGRAPH SMALL
  static TextStyle paragraphSmallRegular = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(14));
  static TextStyle paragraphSmallMedium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(14));
  static TextStyle paragraphSmallSemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(14));
  static TextStyle paragraphSmallBold = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 14,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(14));

  //PARAGRAPH XSMALL
  static TextStyle paragraphXSmallRegular = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(12));
  static TextStyle paragraphXSmallMedium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(12));
  static TextStyle paragraphXSmallSemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(12));

  //PARAGRAPH XXSMALL
  static TextStyle paragraphXXSmallRegular = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(10));
  static TextStyle paragraphXXSmallMedium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(10));
  static TextStyle paragraphXXSmallSemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 10,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(10));
  static TextStyle paragraphXXSmallBold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 10,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(10));

  //PARAGRAPH XXXSMALL
  static TextStyle paragraphXXXSmallRegular = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 8,
      color: kColorNeutral700,
      height: 16.0.toFigmaHeight(8));
  static TextStyle paragraphXXXSmallMedium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 8,
      color: kColorNeutral700,
      height: 16.0.toFigmaHeight(8));
  static TextStyle paragraphXXXSmallSemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 8,
      color: kColorNeutral700,
      height: 16.0.toFigmaHeight(8));
  static TextStyle paragraphXXXSmallBold = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 8,
      color: kColorNeutral700,
      height: 16.0.toFigmaHeight(8));

  //OVERLINE
  static TextStyle overLine14 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(14));
  static TextStyle overLine12 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(12));
  static TextStyle overlineRegular = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: kColorNeutral700,
      height: 20.0.toFigmaHeight(10));
}
