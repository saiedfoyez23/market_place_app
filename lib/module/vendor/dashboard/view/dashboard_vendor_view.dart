import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class DashboardVendorView extends StatelessWidget {
  DashboardVendorView({super.key,required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    DashboardVendorController dashboardVendorController = Get.put(DashboardVendorController(index: index));
    return Obx(()=>Scaffold(
      body: dashboardVendorController.pages[dashboardVendorController.selectedIndex.value],
      bottomNavigationBar: Container(
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
          children: List.generate(dashboardVendorController.items.length, (index) {
            final item = dashboardVendorController.items[index];
            final bool isSelected = dashboardVendorController.selectedIndex.value == index;

            return InkWell(
              onTap: () {
                dashboardVendorController.selectedIndex.value = index;
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Optional orange underline above active icon
                  AnimatedContainer(
                      duration: Duration(milliseconds: 200),
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
                      ) :
                      BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.r(context)),
                          bottomRight: Radius.circular(8.r(context)),
                        ),
                      )
                  ),


                  SpaceHelperWidget.v(8.h(context)),



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


                  SpaceHelperWidget.v(4.h(context)),

                  isSelected ?
                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    textColor: isSelected ? ColorUtils.orange119 : ColorUtils.black64,
                    text: item['label'],
                  ) :
                  SizedBox.shrink(),

                  SpaceHelperWidget.v(8.h(context)),


                ],
              ),
            );
          }),
        ),
      ),
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
