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
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: vendorAnalysisController.isLoading.value == true ?
          LoadingHelperWidget.loadingHelperWidget(context: context,height: 930.h(context)) :
          CustomScrollView(
            slivers: [

              MainPageAppBarHelperWidget(
                centerTitle: false,
                title: "Analytics",
              ),


              vendorAnalysisController.vendorMyProfileDetailsResponseModel.value.data?.type == "null" ?
              SliverFillRemaining(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.center,
                      textAlign: TextAlign.center,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black48,
                      text: "Access Restricted",
                    ),


                    SpaceHelperWidget.v(20.h(context)),

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.center,
                      textAlign: TextAlign.center,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textColor: ColorUtils.black48,
                      text: "Only subscribed members can see this feature",
                    ),

                    SpaceHelperWidget.v(20.h(context)),

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.center,
                      textAlign: TextAlign.center,
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      textColor: ColorUtils.black48,
                      text: "Subscribe now to unlock this feature.",
                    ),


                  ],
                ),
              ) :
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 20),
                
                      // Monthly Revenue
                      sectionTitle("Monthly Revenue (\$)"),
                      buildBarChart(
                        vendorAnalysisController: vendorAnalysisController
                      ),
                
                      SizedBox(height: 20),
                
                      // Client Satisfaction
                      sectionTitle("Client Satisfaction"),
                      buildLineChart(
                        vendorAnalysisController: vendorAnalysisController,
                      ),
                
                      SizedBox(height: 20),
                
                      // Service Popularity
                      sectionTitle("Service Popularity"),
                      buildPieChart(
                        vendorAnalysisController: vendorAnalysisController,
                      ),
                
                      SizedBox(height: 20),
                
                      // Booking Trends
                      sectionTitle("Booking Trends"),
                      buildBlueTrendChart(
                        vendorAnalysisController: vendorAnalysisController,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -------------- SECTION TITLE ----------------
  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Text("This year"),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
      ],
    );
  }

  // ---------------- BAR CHART ----------------
  Widget buildBarChart({required VendorAnalysisController vendorAnalysisController}) {
    return Obx(() => Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 12),
      decoration: cardBox(),
      height: 360,
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
          barGroups: vendorAnalysisController.monthlyRevenue
              .asMap()
              .map((i, val) => MapEntry(
            i,
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: val,
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
    ));
  }

  // ---------------- CLIENT SATISFACTION LINE CHART ----------------
  Widget buildLineChart({required VendorAnalysisController vendorAnalysisController}) {
    return Obx(() => Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 12),
      decoration: cardBox(),
      height: 360,
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
                  if (spot.x == 3) {
                    return FlDotCirclePainter(
                        radius: 6,
                        color: Colors.blue,
                        strokeWidth: 0);
                  }
                  return FlDotCirclePainter(radius: 0);
                },
              ),
              spots: vendorAnalysisController.clientSatisfaction
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value))
                  .toList(),
            ),
          ],
        ),
      ),
    ));
  }

  // ---------------- PIE CHART ----------------
  Widget buildPieChart({required VendorAnalysisController vendorAnalysisController}) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 12),
      decoration: cardBox(),
      height: 360,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: [
                PieChartSectionData(
                    value: 35, color: Color(0xFF7B57C7), radius: 60),
                PieChartSectionData(
                    value: 25, color: Color(0xFF447DFF), radius: 60),
                PieChartSectionData(
                    value: 15, color: Color(0xFFE74A2A), radius: 60),
                PieChartSectionData(
                    value: 20, color: Color(0xFFFFB74D), radius: 60),
                PieChartSectionData(
                    value: 5, color: Color(0xFF10C980), radius: 60),
              ],
            ),
          ),

        ],
      ),
    );
  }

  // ---------------- BLUE BOOKING LINE CHART ----------------
  Widget buildBlueTrendChart({required VendorAnalysisController vendorAnalysisController}) {
    return Obx(() => Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 12),
      decoration: cardBox(),
      height: 360,
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
                  if (spot.x == 10) {
                    return FlDotCirclePainter(
                        radius: 6,
                        color: Color(0xFFE74A2A),
                        strokeWidth: 0);
                  }
                  return FlDotCirclePainter(radius: 0);
                },
              ),
              spots: vendorAnalysisController.bookingTrends
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value))
                  .toList(),
            ),
          ],
        ),
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