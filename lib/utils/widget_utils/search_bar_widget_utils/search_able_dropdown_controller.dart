import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchableDropdownController<T> extends GetxController {
  final OverlayPortalController overlayController = OverlayPortalController();
  final LayerLink layerLink = LayerLink();
  final TextEditingController searchController = TextEditingController();

  final RxList<T> filteredItems = <T>[].obs;
  final RxBool isOpen = false.obs;

  late List<T> items;
  late String Function(T)? itemToString;

  void init({
    required List<T> items,
    String Function(T)? itemToString,
  }) {
    this.items = items;
    this.itemToString = itemToString;
    filteredItems.assignAll(items);
  }

  void toggle() {
    isOpen.toggle();
    overlayController.toggle();
  }

  void close() {
    isOpen.value = false;
    overlayController.hide();
  }

  void filter(String value) {
    filteredItems.assignAll(
      items.where((e) =>
          (itemToString?.call(e) ?? e.toString())
              .toLowerCase()
              .contains(value.toLowerCase())),
    );
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}