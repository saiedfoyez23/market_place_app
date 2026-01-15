import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

class SearchableDropdownOverlay<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;

  final String hintText;
  final double? width;
  final String Function(T)? itemToString;
  final Widget Function(T)? itemBuilder;

  final double borderRadius;
  final Color fillColor;
  final Color borderColor;

  final SearchableDropdownController<T> controller;

  const SearchableDropdownOverlay({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.controller,
    this.hintText = "Select",
    this.width,
    this.itemToString,
    this.itemBuilder,
    this.borderRadius = 10,
    this.fillColor = Colors.white,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    controller.init(items: items, itemToString: itemToString);

    return CompositedTransformTarget(
      link: controller.layerLink,
      child: OverlayPortal(
        controller: controller.overlayController,
        overlayChildBuilder: (_) => _overlay(context),
        child: GestureDetector(
          onTap: controller.toggle,
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: fillColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value != null
                      ? itemToString?.call(value!) ?? value.toString()
                      : hintText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Obx(() => Icon(
                  controller.isOpen.value
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _overlay(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: controller.close,
            behavior: HitTestBehavior.translucent,
          ),
        ),
        CompositedTransformFollower(
          link: controller.layerLink,
          offset: const Offset(0, 55),
          showWhenUnlinked: false,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Container(
              width: width ?? 438,
              constraints: const BoxConstraints(maxHeight: 300),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: controller.searchController,
                    onChanged: controller.filter,
                    decoration: const InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Obx(() => ListView.builder(
                      itemCount: controller.filteredItems.length,
                      itemBuilder: (_, index) {
                        final item =
                        controller.filteredItems[index];
                        return InkWell(
                          onTap: () {
                            onChanged(item);
                            controller.close();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: itemBuilder != null
                                ? itemBuilder!(item)
                                : Text(
                              itemToString?.call(item) ??
                                  item.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}