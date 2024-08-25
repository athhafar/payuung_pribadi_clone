import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi/buttons/button_action.dart';
import 'package:payuung_pribadi/controller/home_controller.dart';
import 'package:payuung_pribadi/pages/bottom_nav/bottom_navigation.dart';
import 'package:payuung_pribadi/pages/home/widgets/explore_welness_card.dart';
import 'package:payuung_pribadi/pages/home/widgets/filter_explore_welness_card.dart';
import 'package:payuung_pribadi/pages/home/widgets/filter_kategori_pilihan_card.dart';
import 'package:payuung_pribadi/pages/home/widgets/menu_card.dart';
import 'package:payuung_pribadi/routes/route_name.dart';
import 'package:payuung_pribadi/utilities/asset_constant.dart';
import 'package:payuung_pribadi/utilities/colors.dart';
import 'package:payuung_pribadi/utilities/helper.dart';
import 'package:payuung_pribadi/utilities/typography.dart';
import 'package:collection/collection.dart';
import 'package:payuung_pribadi/widgets/tab_bar_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  RefreshController refreshController = RefreshController();
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top + 8,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            width: Get.width,
            color: kColorPrimary,
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Pagi",
                        style: TStyle.paragraphLargeRegular.copyWith(
                          color: kColorWhite,
                        ),
                      ),
                      Text(
                        "Athallah Farel",
                        style: TStyle.mobileHeading5SemiBold.copyWith(
                          color: kColorWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonAction(
                      onTap: () {},
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            AssetConstant.icNotification,
                            width: 20,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: kColorSecondary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(
                          RouteName.profile,
                        );
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kcolorPrimaryPurple50,
                          border: Border.all(
                            width: 1.0,
                            color: kColorPrimary,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            Helper.getInitialName('Atha Farrel'),
                            style: TStyle.paragraphMediumSemiBold.copyWith(
                              color: kColorPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: Get.height * 0.13,
            left: 0,
            right: 0,
            bottom: 0,
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: refreshController,
              onRefresh: () async {
                await Future.delayed(const Duration(milliseconds: 1000));
                refreshController.refreshCompleted();
              },
              onLoading: () async {
                await Future.delayed(const Duration(milliseconds: 1000));
                refreshController.loadComplete();
              },
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  width: Get.width,
                  // height: Get.height,
                  decoration: const BoxDecoration(
                    color: kColorWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: softGrey,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.listTab
                                .mapIndexed(
                                  (index, element) => Expanded(
                                    child: TabbarCard(
                                      title: controller.listTab[index],
                                      isActive:
                                          controller.selectedIndex.value ==
                                              index,
                                      onTap: () {
                                        if (index ==
                                            controller.selectedIndex.value) {
                                        } else {
                                          controller.selectedIndex.value =
                                              index;
                                        }
                                      },
                                      isFirstIndex: index == 0,
                                      isLastIndex: index ==
                                          controller.listTab.length - 1,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        width: Get.width,
                        height: 1,
                        color: kColorNeutral200.withOpacity(0.5),
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Produk Keuangan',
                              style: TStyle.paragraphLargeSemiBold,
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: MasonryGridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.listProdukKeuangan.length,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 16,
                                  padding: EdgeInsets.zero,
                                  crossAxisCount: 4,
                                  itemBuilder: (context, index) {
                                    return MenuCard(
                                      icon: controller
                                          .listProdukKeuangan[index].icon,
                                      title:
                                          '${controller.listKategoriPilihan[index].title}\n',
                                      onTap: () {},
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Kategori Pilihan',
                                    style: TStyle.paragraphLargeSemiBold,
                                  ),
                                ),
                                FilterKategoriPilihanCard()
                              ],
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: MasonryGridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.listKategoriPilihan.length,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 32,
                                  padding: EdgeInsets.zero,
                                  crossAxisCount: 4,
                                  itemBuilder: (context, index) {
                                    return MenuCard(
                                      icon: controller
                                          .listKategoriPilihan[index].icon,
                                      title:
                                          '${controller.listKategoriPilihan[index].title}\n',
                                      onTap: () {},
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Explore Welness',
                                    style: TStyle.paragraphLargeSemiBold,
                                  ),
                                ),
                                FilterExploreWelnessCard()
                              ],
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            MasonryGridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.listExploreWelness.length,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                padding: EdgeInsets.zero,
                                crossAxisCount: 2,
                                itemBuilder: (context, index) {
                                  return ExploreWelnessCard(
                                    title: controller
                                        .listExploreWelness[index].title,
                                    desc: controller
                                        .listExploreWelness[index].desc,
                                    image: controller
                                        .listExploreWelness[index].image,
                                  );
                                }),
                                const SizedBox(
                                height: 32.0,
                                ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
