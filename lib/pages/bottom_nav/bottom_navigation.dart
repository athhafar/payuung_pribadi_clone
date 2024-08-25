import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/controller/bottom_nav/bottom_navigation_controller.dart';
import 'package:payuung_pribadi/pages/home/home_page.dart';
import 'package:payuung_pribadi/pages/test_page.dart';
import 'package:payuung_pribadi/utilities/asset_constant.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/typography.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BottomNavigationPage extends StatelessWidget {
  final PanelController _panelController = PanelController();
  final BottomNavigationController controller =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            // Switch between pages based on selectedIndex
            return controller.selectedIndex.value == 0
                ? HomePage()
                : TestPage();
          }),
          // SlidingUpPanel
          SlidingUpPanel(
            boxShadow: [],
            color: kColorWhite,
            border: Border.all(
              color: kColorNeutral200,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            controller: _panelController,
            minHeight: 100.0,
            maxHeight: 200.0,
            onPanelSlide: (double position) {
              // Update panel state
              controller.setPanelOpen(position > 0.5);
            },
            panel: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Obx(() => Expanded(
                      child: MasonryGridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 20,
                        itemCount: controller.isPanelOpen.value ? 5 : 3,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          List<Widget> items = [
                            _bottomNavItem(AssetConstant.icHome, 'Beranda', 0),
                            _bottomNavItem(AssetConstant.icSearch, 'Cari', 1),
                            _bottomNavItem(
                                AssetConstant.icCart, 'Keranjang', 2),
                            if (controller.isPanelOpen.value)
                              _bottomNavItem(AssetConstant.icTransaction,
                                  'Daftar Transaksi', 3),
                            if (controller.isPanelOpen.value)
                              _bottomNavItem(
                                  AssetConstant.icVoucher, 'Voucher Saya', 4),
                            if (controller.isPanelOpen.value)
                              _bottomNavItem(
                                  AssetConstant.icMaps, 'Alamat Pengiriman', 5),
                            if (controller.isPanelOpen.value)
                              _bottomNavItem(AssetConstant.icFriendship,
                                  'Daftar Teman', 6),
                          ];
                          return items[index];
                        },
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavItem(String icon, String label, int index) {
    return Obx(() => GestureDetector(
          onTap: () {
            controller.setSelectedIndex(index);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(icon,
                  color: controller.selectedIndex.value == index
                      ? kColorPrimary
                      : kColorGrey),
              Text(
                label,
                style: TStyle.paragraphSmallRegular.copyWith(
                  color: controller.selectedIndex.value == index
                      ? kColorPrimary
                      : kColorGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
