import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import untuk DateFormat
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/constant.dart';
import 'package:payuung_pribadi/utilities/typography.dart';

class DatePickerCostume extends StatelessWidget {
  const DatePickerCostume({
    super.key,
    this.onChanged,
    required this.firstDate,
    required this.lastDate,
    this.hintText,
    this.initialDate,
  });

  final ValueChanged<String>? onChanged;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? initialDate;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DateTimePicker(
          initialValue: initialDate.toString(),
          style: TStyle.paragraphSmallRegular,
          decoration: kDefaultDecoration.copyWith(
            hintText: hintText,
            suffixIcon: const Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.calendar_month_rounded,
                color: kColorNeutral700,
              ),
            ),
          ),
          type: DateTimePickerType.date,
          dateLabelText: 'Pilih Tanggal',
          fieldLabelText: 'Tanggal',
          dateMask: 'dd-MM-yyyy',
          firstDate: firstDate,
          lastDate: lastDate,
          timeLabelText: "Jam",
          onChanged: (val) {
            if (onChanged != null) {
              onChanged!(val);
            }
          },
        ),
      ],
    );
  }
}
