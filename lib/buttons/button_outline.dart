// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../utilities/utilities.dart';

// class ButtonOutline extends StatelessWidget {
//   const ButtonOutline(
//       {Key? key,
//       this.isWithArrow = false,
//       required this.text,
//       required this.onTap,
//       this.isActive = true,
//         this.color = kColorNeutral300,
//       this.icon = ""})
//       : super(key: key);

//   final bool isWithArrow;
//   final String text;
//   final VoidCallback onTap;
//   final bool isActive;
//   final String icon;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: isActive ? kColorWhite : Color(0xFFE5E5E5),
//           borderRadius: BorderRadius.circular(100),
//           border: Border.all(color: color)),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: isActive ? onTap : () {},
//           borderRadius: BorderRadius.circular(100),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 icon.isEmpty
//                     ? const SizedBox()
//                     : Container(
//                         margin: const EdgeInsets.only(right: 8),
//                         child: SvgPicture.asset(
//                           icon,
//                           width: 16,
//                         )),
//                 AutoSizeText(
//                   text,
//                   textAlign: TextAlign.center,
//                   maxLines: 1,
//                   maxFontSize: 12,
//                   style: TStyle.paragraphSmallSemiBold.copyWith(
//                       color: color == kColorNeutral300 ? isActive ? kColorNeutral600 : kColorNeutral400 : color),
//                 ),
//                 isWithArrow
//                     ? Container(
//                         margin: const EdgeInsets.only(left: 4),
//                         child: SvgPicture.asset(
//                           AssetConstant.icArrowRight,
//                           color: kColorNeutral600,
//                         ),
//                       )
//                     : const SizedBox()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
