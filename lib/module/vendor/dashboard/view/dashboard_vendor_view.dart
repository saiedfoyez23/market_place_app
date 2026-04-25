import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class DashboardVendorView extends StatelessWidget {
  DashboardVendorView({super.key,required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    DashboardVendorController dashboardVendorController = Get.put(DashboardVendorController(index: index,context: context));
    return Obx(()=>Scaffold(
      body: dashboardVendorController.pages[dashboardVendorController.selectedIndex.value],
      bottomNavigationBar: Obx(() {
        final controller = dashboardVendorController;

        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          child: Container(
            height: 74.h(context),
            width: 428.w(context),
            padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
            decoration: BoxDecoration(
              color: ColorUtils.white243,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(controller.items.length, (index) {
                final item = controller.items[index];
                final bool isSelected = controller.selectedIndex.value == index;

                /// 🔴 Only show badge for message item
                final bool isMessageItem = item['isMessage'] == true;

                /// 🔢 unread count from controller
                final int unreadCount = isMessageItem
                    ? controller.vendorMyProfileDetailsResponseModel.value.data?.unreadMessageCount ?? 0
                    : 0;

                return InkWell(
                  onTap: () {
                    controller.selectedIndex.value = index;

                    /// Optional: clear unread when opening messages
                    // if (isMessageItem) {
                    //   controller.unreadCount.value = 0;
                    // }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      /// 🔶 Top indicator
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 6.h(context),
                        width: 44.w(context),
                        decoration: isSelected ?
                        BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ColorUtils.orange42,
                              ColorUtils.orange119,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.r(context)),
                            bottomRight: Radius.circular(8.r(context)),
                          ),
                        ) : const BoxDecoration(color: Colors.transparent),
                      ),

                      SpaceHelperWidget.v(8.h(context)),

                      /// 🔔 ICON + BADGE
                      Stack(
                        clipBehavior: Clip.none,
                        children: [

                          /// Icon
                          isSelected ?
                          ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 24.h(context),
                            width: 24.w(context),
                            imageString: item['select'],
                          ) :
                          ImageHelperWidget.assetImageWidget(
                            context: context,
                            height: 24.h(context),
                            width: 24.w(context),
                            imageString: item['unselected'],
                          ),

                          /// 🔴 Badge
                          if (unreadCount > 0)
                            Positioned(
                              right: -12.rpm(context),
                              top: -12.tpm(context),
                              child: Container(
                                padding: EdgeInsets.all(4.r(context)),
                                constraints: BoxConstraints(
                                  minWidth: 20.w(context),
                                  minHeight: 20.h(context),
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.center,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorUtils.white255,
                                  text: unreadCount > 9 ? '9+' : unreadCount.toString(),
                                ),
                              ),
                            ),
                        ],
                      ),

                      SpaceHelperWidget.v(4.h(context)),

                      /// 📝 Label
                      isSelected ? TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.orange119,
                        text: item['label'],
                      ) : const SizedBox.shrink(),

                      SpaceHelperWidget.v(8.h(context)),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      }),
    ));
  }
}


class VendorDashboardPage extends StatelessWidget {
  const VendorDashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('🏠 Vendor Dashboard Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class VendorServicesPage extends StatelessWidget {
  const VendorServicesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('📅 Vendor Services Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class VendorBookingPage extends StatelessWidget {
  const VendorBookingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('💬 Vendor Booking Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class VendorMessagePage extends StatelessWidget {
  const VendorMessagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('🛒 Vendor Message Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}


class VendorAnalyticsPage extends StatelessWidget {
  const VendorAnalyticsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('💬 Vendor Analytics Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}


class VendorProfilePage extends StatelessWidget {
  const VendorProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('💬 Vendor Profile Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
