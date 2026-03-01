import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplaceapp/utils/utils.dart';

class SearchableDropdownOverlay<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final TextEditingController searchController;
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
    required this.searchController,
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
    return CompositedTransformTarget(
      link: controller.layerLink,
      child: OverlayPortal(
        controller: controller.overlayController,
        overlayChildBuilder: (_) {
          if(controller.filteredItems.isEmpty == true) {
            controller.init(items: items, itemToString: itemToString);
          }
          return _overlay(context);
        },
        child: InkWell(
          //onTap: controller.toggle,
          child: Column(
            children: [

              TextFormFieldWidget.build(
                context: context,
                fillColor: ColorUtils.white255,
                hintText: "Search...",
                onTap: controller.toggle,
                suffixIcon: Obx(() => Icon(
                  controller.isOpen.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                )),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 14.vpm(context)),
                controller: searchController,
                onChanged: controller.filter,
                keyboardType: TextInputType.emailAddress,
              ),

              // Container(
              //   width: width,
              //   padding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 14.vpm(context)),
              //   decoration: BoxDecoration(
              //     color: fillColor,
              //     borderRadius: BorderRadius.circular(borderRadius),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         value != null ? itemToString?.call(value!) ?? value.toString() : hintText,
              //         style: GoogleFonts.poppins(
              //           fontSize: 18.sp(context),
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       Obx(() => Icon(
              //         controller.isOpen.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              //       )),
              //     ],
              //   ),
              // ),
            ],
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
          offset: Offset(0, 65.h(context)),
          showWhenUnlinked: false,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Container(
              width: width ?? 438.sp(context),
              constraints: const BoxConstraints(maxHeight: 300),
              padding: EdgeInsets.all(8.r(context)),
              child: Column(
                children: [

                  // TextFormFieldWidget.build(
                  //   context: context,
                  //   fillColor: ColorUtils.white255,
                  //   hintText: "Search...",
                  //   prefixIcon: Icon(Icons.search),
                  //   controller: controller.searchController,
                  //   onChanged: controller.filter,
                  //   keyboardType: TextInputType.emailAddress,
                  // ),

                  // TextField(
                  //   controller: controller.searchController,
                  //   onChanged: controller.filter,
                  //   decoration: const InputDecoration(
                  //     hintText: "Search...",
                  //     prefixIcon: Icon(Icons.search),
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),

                  //SpaceHelperWidget.v(8.h(context)),
                  
                  Expanded(
                    child: Obx(() => ListView.builder(
                      itemCount: controller.filteredItems.length,
                      itemBuilder: (_, index) {
                        final item = controller.filteredItems[index];
                        return InkWell(
                          onTap: () {
                            onChanged(item);
                            controller.close();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(12.r(context)),
                            child: itemBuilder != null
                                ? itemBuilder!(item)
                                : Text(
                              itemToString?.call(item) ?? item.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 18.sp(context),
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