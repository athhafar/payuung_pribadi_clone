import 'package:flutter/material.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

InputDecoration kDefaultDecoration = InputDecoration(
  labelStyle: TStyle.paragraphSmallMedium.copyWith(color: kColorNeutral400),
  filled: true,
  fillColor: kColorWhite,
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: kColorNeutral200,
      ),
      borderRadius: BorderRadius.circular(10)),
  disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: kColorNeutral200,
      ),
      borderRadius: BorderRadius.circular(10)),
  hintStyle: TStyle.paragraphXSmallRegular.copyWith(color: kColorNeutral400),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kColorNeutral200),
      borderRadius: BorderRadius.circular(10)),
);
