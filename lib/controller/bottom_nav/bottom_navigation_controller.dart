import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var isPanelOpen = false.obs; // Track panel open state

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void setPanelOpen(bool isOpen) {
    isPanelOpen.value = isOpen;
  }
}
