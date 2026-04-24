import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class VendorAnalysisView extends StatelessWidget {
  VendorAnalysisView({super.key});
  @override
  Widget build(BuildContext context) {
    final VendorAnalysisController vendorAnalysisController = Get.put(VendorAnalysisController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, onPopInvoked) {
        ExitFormTheAppDialogBox().exitFormTheAppDialogBox(context: context);
      },
      child: Scaffold(
        body: Obx(() {
          final bool isLocked = vendorAnalysisController.vendorMyProfileDetailsResponseModel.value.data?.type == null;
          return SafeArea(
            child: Container(
              height: 930.h(context),
              width: 428.w(context),
              color: ColorUtils.white255,
              child: vendorAnalysisController.isLoading.value ?
              LoadingHelperWidget.loadingHelperWidget(context: context, height: 930.h(context)) :
              Stack(
                children: [
                  /// ---------------- MAIN CONTENT ----------------
                  IgnorePointer(
                    ignoring: isLocked,
                    child: CustomScrollView(
                      physics: isLocked ?
                      const NeverScrollableScrollPhysics() :
                      const BouncingScrollPhysics(),
                      slivers: [

                        MainPageAppBarHelperWidget(
                          centerTitle: false,
                          title: "Analytics",
                        ),

                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: buildStatCard(
                                        vendorAnalysisController:
                                        vendorAnalysisController,
                                        context: context,
                                        title: 'Total Booking',
                                        value:
                                        '${vendorAnalysisController.vendorAnalysisResponseModel.value.data?.totalBookingCount ?? "0"}',
                                      ),
                                    ),
                                    SpaceHelperWidget.h(16.w(context)),
                                    Expanded(
                                      child: buildStatCard(
                                        vendorAnalysisController:
                                        vendorAnalysisController,
                                        context: context,
                                        title: 'Total Earnings',
                                        value:
                                        'R${vendorAnalysisController.vendorAnalysisResponseModel.value.data?.totalEarnings ?? "0"}',
                                      ),
                                    ),
                                  ],
                                ),

                                SpaceHelperWidget.v(20.h(context)),

                                buildBarChart(
                                  vendorAnalysisController: vendorAnalysisController,
                                  context: context,
                                ),

                                SpaceHelperWidget.v(20.h(context)),

                                buildLineChart(
                                  vendorAnalysisController: vendorAnalysisController,
                                  context: context,
                                ),

                                SpaceHelperWidget.v(20.h(context)),

                                buildPieChart(
                                  vendorAnalysisController: vendorAnalysisController,
                                  context: context,
                                ),

                                SpaceHelperWidget.v(20.h(context)),

                                buildBlueTrendChart(
                                  vendorAnalysisController: vendorAnalysisController,
                                  context: context,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// ---------------- BLUR OVERLAY ----------------
                  if (isLocked)...[
                    Positioned.fill(
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.hpm(context)),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [

                                    Icon(Icons.lock, size: 80.r(context), color: Colors.white),

                                    SpaceHelperWidget.v(20.h(context)),

                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.center,
                                      textAlign: TextAlign.center,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      textColor: ColorUtils.black48,
                                      text: "Access Restricted",
                                    ),


                                    SpaceHelperWidget.v(12.h(context)),

                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.center,
                                      textAlign: TextAlign.center,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.black48,
                                      text: "Only subscribed members can see this feature",
                                    ),

                                    SpaceHelperWidget.v(12.h(context)),

                                    TextHelperClass.headingTextWithoutWidth(
                                      context: context,
                                      alignment: Alignment.center,
                                      textAlign: TextAlign.center,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500,
                                      textColor: ColorUtils.black48,
                                      text: "Subscribe now to unlock this feature.",
                                    ),

                                    SpaceHelperWidget.v(20.h(context)),

                                    ButtonHelperWidget.customButtonWidgetAdventPro(
                                      context: context,
                                      onPressed: () async {
                                        Get.off(()=>VendorProfileSubscriptionView(),preventDuplicates: false);
                                      },
                                      text: "Subscribe Now",
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]

                ],
              ),
            ),
          );
        }),
      ),
    );
  }




  Widget buildStatCard({
    required BuildContext context,
    required String title,
    required String value,
    required VendorAnalysisController vendorAnalysisController,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.hpm(context),vertical: 14.vpm(context)),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.r(context)),
          border: Border.all(width: 1,color: ColorUtils.gray197)
      ),
      child: Column(
        children: [
          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black64,
            text: title,
          ),

          SpaceHelperWidget.v(12.h(context)),


          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black64,
            text: value,
          ),
        ],
      ),
    );
  }

  // ---------------- BAR CHART ----------------
  Widget buildBarChart({required VendorAnalysisController vendorAnalysisController,required BuildContext context}) {
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(vertical: 13.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white247,
        borderRadius: BorderRadius.circular(20.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textColor: ColorUtils.black48,
                  text: 'Monthly Revenue (\$)',
                ),
              ),


              Expanded(
                child: CustomDropdownHelperClass(
                  value: vendorAnalysisController.eventManageYear.value,
                  items: [2025,2026,2027,2028,2029,2030],
                  onChanged: (value) async {
                    vendorAnalysisController.eventManageYear.value = value!;
                    vendorAnalysisController.isLoading.value = true;
                    vendorAnalysisController.pieSections.clear();
                    vendorAnalysisController.servicePopularity.clear();
                    await vendorAnalysisController.getVendorAnalyticController(
                      subscriptionYear: value.toString(),
                      orderYear: value.toString(),
                      context: context,
                      bookingYear: value.toString(),
                    );
                  },
                  hintText: "select",
                ),
              ),

            ],
          ),



          SpaceHelperWidget.v(20.h(context)),


          SizedBox(
              height: 450.h(context),
              child: BarChart(
                BarChartData(
                  maxY: 320,
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.grey.shade300,
                      strokeWidth: 1,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(),         // REMOVE top axis
                    rightTitles: AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, _) => Text(
                          ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
                          [value.toInt()],
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 50,
                        getTitlesWidget: (value, _) =>
                            Text(value.toInt().toString(), style: TextStyle(fontSize: 10)),
                      ),
                    ),
                  ),
                  barGroups: vendorAnalysisController.vendorAnalysisResponseModel.value.data?.monthlyRevenue
                      ?.asMap()
                      .map((i, val) => MapEntry(
                    i,
                    BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: (double.parse(val.amount.toString()) / 1000),
                          width: 10,
                          color: Color(0xFFE74A2A),
                          borderRadius: BorderRadius.circular(4),
                        )
                      ],
                    ),
                  ))
                      .values
                      .toList(),
                ),
              ),
          )
        ],
      ),
    ));
  }

  // ---------------- CLIENT SATISFACTION LINE CHART ----------------
  Widget buildLineChart({required VendorAnalysisController vendorAnalysisController,required BuildContext context}) {
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(vertical: 13.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white247,
        borderRadius: BorderRadius.circular(20.r(context)),
      ),
      child: Column(
        children: [

          Row(
            children: [

              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textColor: ColorUtils.black48,
                  text: 'Client Satisfaction',
                ),
              ),


              Expanded(
                child: CustomDropdownHelperClass(
                  value: vendorAnalysisController.eventManageYear.value,
                  items: [2025,2026,2027,2028,2029,2030],
                  onChanged: (value) async {
                    vendorAnalysisController.eventManageYear.value = value!;
                    vendorAnalysisController.isLoading.value = true;
                    vendorAnalysisController.pieSections.clear();
                    vendorAnalysisController.servicePopularity.clear();
                    await vendorAnalysisController.getVendorAnalyticController(
                      subscriptionYear: value.toString(),
                      orderYear: value.toString(),
                      context: context,
                      bookingYear: value.toString(),
                    );
                  },
                  hintText: "select",
                ),
              ),

            ],
          ),


          SpaceHelperWidget.v(20.h(context)),

          SizedBox(
            height: 450.h(context),
            child: LineChart(
              LineChartData(
                maxY: 320,
                minY: 0,
                borderData: FlBorderData(
                  show: false,
                ),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade300,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: defaultTitles(),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: Color(0xFFFF6F61),
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Color(0xFFFF6F61).withOpacity(.25),
                    ),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, a, b, c) {
                        if (spot.x == DateTime.now().month - 1) {
                          return FlDotCirclePainter(
                              radius: 6,
                              color: Colors.blue,
                              strokeWidth: 0);
                        }
                        return FlDotCirclePainter(radius: 0);
                      },
                    ),
                    spots: vendorAnalysisController.vendorAnalysisResponseModel.value.data!.clientSatisfaction
                        !.asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), double.parse(e.value.count.toString())))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  // ---------------- PIE CHART ----------------
  Widget buildPieChart({required VendorAnalysisController vendorAnalysisController,required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white247,
        borderRadius: BorderRadius.circular(20.r(context)),
      ),
      child: Column(
        children: [

          Row(
            children: [

              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textColor: ColorUtils.black48,
                  text: 'Service Popularity',
                ),
              ),


              Expanded(
                child: CustomDropdownHelperClass(
                  value: vendorAnalysisController.eventManageYear.value,
                  items: [2025,2026,2027,2028,2029,2030],
                  onChanged: (value) async {
                    vendorAnalysisController.eventManageYear.value = value!;
                    vendorAnalysisController.isLoading.value = true;
                    vendorAnalysisController.pieSections.clear();
                    vendorAnalysisController.servicePopularity.clear();
                    await vendorAnalysisController.getVendorAnalyticController(
                      subscriptionYear: value.toString(),
                      orderYear: value.toString(),
                      context: context,
                      bookingYear: value.toString(),
                    );
                  },
                  hintText: "select",
                ),
              ),

            ],
          ),



          SpaceHelperWidget.v(20.h(context)),


          SizedBox(
            height: 300.h(context),
            child: PieChart(
              PieChartData(sections: vendorAnalysisController.pieSections),
            ),
          ),

          SpaceHelperWidget.v(12.h(context)),

          Column(
            children: List.generate(vendorAnalysisController.servicePopularity.length, (index) {
              return Row(
                children: [
                  SizedBox(
                    width: 8,
                    height: 8,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: vendorAnalysisController.servicePopularity[index].textColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('${vendorAnalysisController.servicePopularity[index].title}: ${vendorAnalysisController.servicePopularity[index].persentage}%'),
                ],
              );
            }),
          )


        ],
      ),
    );
  }

  // ---------------- BLUE BOOKING LINE CHART ----------------
  Widget buildBlueTrendChart({required VendorAnalysisController vendorAnalysisController,required BuildContext context}) {
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(vertical: 13.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white247,
        borderRadius: BorderRadius.circular(20.r(context)),
      ),
      child: Column(
        children: [

          Row(
            children: [

              Expanded(
                child: TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textColor: ColorUtils.black48,
                  text: 'Booking Trends',
                ),
              ),


              Expanded(
                child: CustomDropdownHelperClass(
                  value: vendorAnalysisController.eventManageYear.value,
                  items: [2025,2026,2027,2028,2029,2030],
                  onChanged: (value) async {
                    vendorAnalysisController.eventManageYear.value = value!;
                    vendorAnalysisController.isLoading.value = true;
                    vendorAnalysisController.pieSections.clear();
                    vendorAnalysisController.servicePopularity.clear();
                    await vendorAnalysisController.getVendorAnalyticController(
                      subscriptionYear: value.toString(),
                      orderYear: value.toString(),
                      context: context,
                      bookingYear: value.toString(),
                    );
                  },
                  hintText: "select",
                ),
              ),

            ],
          ),



          SpaceHelperWidget.v(20.h(context)),


          SizedBox(
            height: 450.h(context),
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                maxY: 320,
                minY: 0,
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade300,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: defaultTitles(),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: Color(0xFF4A90E2),
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Color(0xFF4A90E2).withOpacity(.25),
                    ),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, a, b, c) {
                        if (spot.x == DateTime.now().month -1) {
                          return FlDotCirclePainter(
                              radius: 6,
                              color: Color(0xFFE74A2A),
                              strokeWidth: 0);
                        }
                        return FlDotCirclePainter(radius: 0);
                      },
                    ),
                    spots: vendorAnalysisController.vendorAnalysisResponseModel.value.data!.bookingTrends
                        !.asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), double.parse(e.value.count.toString())))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  // ------------- widget Builders ---------------
  FlTitlesData defaultTitles() => FlTitlesData(
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, _) => Text(
              ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug",
                "Sep", "Oct", "Nov", "Dec"][value.toInt()],
              style: TextStyle(fontSize: 10))),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 28,
        interval: 50,
        getTitlesWidget: (value, meta) => Text(
          value.toInt().toString(),
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        ),
      ),
    ),
  );

  BoxDecoration cardBox() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 1)
      ],
    );
  }

}