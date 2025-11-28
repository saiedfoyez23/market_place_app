import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerAnalyticsView extends StatelessWidget {
  PlannerAnalyticsView({super.key});

  final PlannerAnalyticsController plannerAnalyticsController = Get.put(PlannerAnalyticsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>SafeArea(
        child: Container(
          height: 930.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: ColorUtils.white255,
          ),
          child: CustomScrollView(
            slivers: [


              MainPageAppBarHelperWidget(
                centerTitle: true,
                title: "Analytics",
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    children: [
                      // Top Stats Row
                      Row(
                        children: [
                          Expanded(
                            child: buildStatCard(
                              context: context,
                              title: 'Events Managed',
                              value: '${plannerAnalyticsController.eventsManaged.value}',
                            ),
                          ),

                          SpaceHelperWidget.h(16.w(context)),


                          Expanded(
                            child: buildStatCard(
                              context: context,
                              title: 'Active Clients',
                              value: '${plannerAnalyticsController.activeClients.value}',
                            ),
                          ),
                        ],
                      ),

                      SpaceHelperWidget.v(16.h(context)),


                      Row(
                        children: [
                          Expanded(
                            child: buildStatCard(
                              context: context,
                              title: 'Vendor Partnerships',
                              value: '${plannerAnalyticsController.vendorPartnerships.value}',
                            ),
                          ),

                          SpaceHelperWidget.h(16.w(context)),

                          Expanded(
                            child: buildStatCard(
                              context: context,
                              title: 'Total Earnings',
                              value: '\$${plannerAnalyticsController.totalEarnings.value}',
                            ),
                          ),
                        ],
                      ),


                      SpaceHelperWidget.v(24.h(context)),

                      // Rating Card
                      buildRatingCard(context: context,controller: plannerAnalyticsController),

                      SpaceHelperWidget.v(24.h(context)),


                      // Tab Buttons

                      buildTabs(context: context),


                      plannerAnalyticsController.selectedTab.value == PlannerAnalyticTab.eventTypes ?
                      Column(
                        children: [
                          SpaceHelperWidget.v(24.h(context)),
                          // Event Distribution (for Event Types tab)
                          buildEventDistribution(controller: plannerAnalyticsController,context: context),
                        ],
                      ) :
                      SizedBox.shrink(),



                      plannerAnalyticsController.selectedTab.value == PlannerAnalyticTab.revenueTrends ?
                      Column(
                        children: [
                          SpaceHelperWidget.v(24.h(context)),
                          // Charts Section (Events Managed, Vendor Usage, Revenue Growth)
                          buildChartsSection(controller: plannerAnalyticsController,context: context),
                        ],
                      ) :
                      SizedBox.shrink(),


                      plannerAnalyticsController.selectedTab.value == PlannerAnalyticTab.topVendors ?
                      Column(
                        children: [
                          SpaceHelperWidget.v(24.h(context)),
                          // Top Vendors List
                          buildTopVendorsList(controller: plannerAnalyticsController,context: context),
                        ],
                      ) :
                      SizedBox.shrink(),


                      SpaceHelperWidget.v(24.h(context)),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildStatCard({
    required BuildContext context,
    required String title,
    required String value,
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
            fontSize: 18,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black64,
            text: title,
          ),

          SpaceHelperWidget.v(12.h(context)),


          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            fontSize: 26,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black64,
            text: value,
          ),
        ],
      ),
    );
  }

  Widget buildRatingCard({required PlannerAnalyticsController controller,required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white247,
        borderRadius: BorderRadius.circular(20.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              
              Icon(Icons.star_border_outlined,size: 50.r(context),color: ColorUtils.black64,),

              SpaceHelperWidget.h(12.w(context)),

              Expanded(
                child: Column(
                  children: [

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black48,
                      text: 'Your Rating',
                    ),

                    SpaceHelperWidget.v(8.h(context)),

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      textColor: ColorUtils.black48,
                      text: 'Client satisfaction score',
                    ),

                  ],
                ),
              )


            ],
          ),


          SpaceHelperWidget.v(16.h(context)),


          Row(
            children: [

              Column(
                children: [

                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.center,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    textColor: ColorUtils.black64,
                    text: '${controller.rating.value}',
                  ),

                  SpaceHelperWidget.v(10.h(context)),

                  Obx(() {
                    int fullStars = controller.rating.value.floor();
                    double fractional = controller.rating.value - fullStars;
                    bool showHalf = fractional > 0.0; // Show half star if there's any fraction

                    return Row(
                      children: [
                        ...List.generate(fullStars, (index) => Icon(
                          Icons.star,
                          color: ColorUtils.yellow199,
                          size: 32.r(context),
                        )),
                        if (showHalf)
                          Icon(
                            Icons.star_half,
                            color: ColorUtils.yellow199,
                            size: 32.r(context),
                          ),
                        ...List.generate(5 - fullStars - (showHalf ? 1 : 0), (index) => Icon(
                          Icons.star_border,
                          color: ColorUtils.yellow199,
                          size: 32.r(context),
                        )),
                      ],
                    );
                  }),

                  SpaceHelperWidget.v(10.h(context)),

                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.center,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    textColor: ColorUtils.black64,
                    text: 'Based on ${controller.reviewCount.value} reviews',
                  ),




                ],
              ),

              SpaceHelperWidget.h(12.w(context)),

              Expanded(
                child:  TextHelperClass.headingTextWithoutWidth(
                  context: context,
                  alignment: Alignment.centerLeft,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  textColor: ColorUtils.black48,
                  text: 'Clients love your attention to detail and professionalism',
                ),
              )


            ],
          ),

        ],
      ),
    );
  }


  Widget buildTabs({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(child: tabItem(status: PlannerAnalyticTab.revenueTrends,title: "Revenue Trends",context: context)),
        Expanded(child: tabItem(status: PlannerAnalyticTab.eventTypes,title: "Event Types",context: context)),
        Expanded(child: tabItem(status: PlannerAnalyticTab.topVendors,title: "Top Vendors",context: context)),
      ],
    );
  }

  Widget tabItem({required String title,required PlannerAnalyticTab status,required BuildContext context}) {
    bool isSelected = plannerAnalyticsController.selectedTab.value == status;
    return InkWell(
      onTap: () {
        plannerAnalyticsController.changeTab(status);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.center,
            textAlign: TextAlign.center,
            fontSize: 17,
            fontWeight: isSelected == true ? FontWeight.w600 : FontWeight.w500,
            textColor: isSelected == true ? ColorUtils.orange119 : ColorUtils.black64,
            text: title,
          ),
          SpaceHelperWidget.v(4.h(context)),
          if (isSelected)
            Container(
              height: 3.h(context),
              color: ColorUtils.orange119,
            )
        ],
      ),
    );
  }

  Widget buildEventDistribution({required PlannerAnalyticsController controller,required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white247,
        borderRadius: BorderRadius.circular(20.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: 'Event Distribution',
          ),

          SpaceHelperWidget.v(8.h(context)),

          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black48,
            text: 'Events managed by category',
          ),

          SpaceHelperWidget.v(16.h(context)),
          ...controller.eventTypes.map((event) => Container(
            margin: EdgeInsets.only(bottom: 22.bpm(context)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black48,
                          text: "${event['name']}",
                        ),
                        SpaceHelperWidget.h(7.w(context)),

                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          containerColor: ColorUtils.blue219,
                          padding: EdgeInsets.symmetric(vertical: 2.vpm(context),horizontal: 8.h(context)),
                          textAlign: TextAlign.start,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          borderRadius: BorderRadius.circular(6.r(context)),
                          textColor: ColorUtils.blue71,
                          text: "${event['count']} events",
                        ),
                      ],
                    ),


                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black48,
                      text: "${event['percentage']}%",
                    ),



                  ],
                ),

                SpaceHelperWidget.v(8.h(context)),

                LinearProgressIndicator(
                  value: (event['percentage'] / 100),
                  backgroundColor: ColorUtils.white217,
                  minHeight: 8.h(context),
                  valueColor: const AlwaysStoppedAnimation<Color>(ColorUtils.blue96),
                ),
                
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget buildChartsSection({required PlannerAnalyticsController controller,required BuildContext context}) {
    return Column(
      children: [
        // Events Managed Bar Chart
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 14.hpm(context)),
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
                      text: 'Events Managed',
                    ),
                  ),


                  Expanded(
                    child: CustomDropdownHelperClass(
                      value: controller.eventManageYear.value,
                      items: [2025,2026,2027,],
                      onChanged: (value) {
                        controller.eventManageYear.value = value!;
                      },
                      hintText: "select",
                    ),
                  ),

                ],
              ),

              

              SpaceHelperWidget.v(16.h(context)),


              SizedBox(
                  height: 450.h(context),
                  child: BarChart(
                    BarChartData(
                      barGroups: controller.eventsBarData,
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: Colors.grey.shade300,
                          strokeWidth: 1,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        rightTitles: AxisTitles(),
                        topTitles: AxisTitles(),
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
                      borderData: FlBorderData(show: false),
                    ),
                  ))
            ],
          ),
        ),

        SpaceHelperWidget.v(16.h(context)),

        // Vendor Category Usage Pie Chart


        Container(
          padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 14.hpm(context)),
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
                      text: 'Vendor Category Usage',
                    ),
                  ),

                  SpaceHelperWidget.h(30.w(context)),


                  Expanded(
                    child: CustomDropdownHelperClass(
                      value: controller.vendorCategoryYear.value,
                      items: [2025,2026,2027,],
                      onChanged: (value) {
                        controller.vendorCategoryYear.value = value!;
                      },
                      hintText: "select",
                    ),
                  ),

                ],
              ),
              

              SpaceHelperWidget.v(16.h(context)),

              SizedBox(
                height: 300.h(context),
                child: PieChart(
                  PieChartData(sections: controller.pieSections),
                ),
              ),

              SpaceHelperWidget.v(12.h(context)),

              const Column(
                children: [

                  Row(
                    children: [
                      const SizedBox(width: 8, height: 8, child: DecoratedBox(decoration: BoxDecoration(color: Colors.purple, shape: BoxShape.circle))),
                      const SizedBox(width: 8),
                      Text('Photography: 25%'),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 8, height: 8, child: DecoratedBox(decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle))),
                      const SizedBox(width: 8),
                      Text('Catering: 33%'),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 8, height: 8, child: DecoratedBox(decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle))),
                      const SizedBox(width: 8),
                      Text('Decor: 20%'),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 8, height: 8, child: DecoratedBox(decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle))),
                      const SizedBox(width: 8),
                      Text('Venue: 15%'),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 8, height: 8, child: DecoratedBox(decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle))),
                      const SizedBox(width: 8),
                      Text('Entertainment: 5%'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        SpaceHelperWidget.v(16.h(context)),


        Container(
          padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 14.hpm(context)),
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
                      text: 'Revenue Growth',
                    ),
                  ),


                  Expanded(
                    child: CustomDropdownHelperClass(
                      value: controller.revenueGrowthYear.value,
                      items: [2025,2026,2027,],
                      onChanged: (value) {
                        controller.revenueGrowthYear.value = value!;
                      },
                      hintText: "select",
                    ),
                  ),

                ],
              ),



              SpaceHelperWidget.v(16.h(context)),


              SizedBox(
                  height: 450.h(context),
                  child: BarChart(
                    BarChartData(
                      barGroups: controller.revenueBarData,
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: Colors.grey.shade300,
                          strokeWidth: 1,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        rightTitles: AxisTitles(),
                        topTitles: AxisTitles(),
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
                      borderData: FlBorderData(show: false),
                    ),
                  ))
            ],
          ),
        ),

        SpaceHelperWidget.v(16.h(context)),

      ],
    );
  }

  Widget buildTopVendorsList({required PlannerAnalyticsController controller,required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 14.hpm(context)),
      decoration: BoxDecoration(
        color: ColorUtils.white247,
        borderRadius: BorderRadius.circular(20.r(context)),
      ),
      child: Column(
        children: [
          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textColor: ColorUtils.black48,
            text: "Top Partnerships",
          ),

          SpaceHelperWidget.v(8.h(context)),

          TextHelperClass.headingTextWithoutWidth(
            context: context,
            alignment: Alignment.centerLeft,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.black48,
            text: "Your most collaborated Planer",
          ),

          SpaceHelperWidget.v(16.h(context)),

          ...controller.topVendors.map((vendor) => Container(
            margin: EdgeInsets.only(bottom: 15.bpm(context)),
            padding: EdgeInsets.symmetric(vertical: 8.vpm(context),horizontal: 14.hpm(context)),
            decoration: BoxDecoration(
              color: ColorUtils.white255,
              border: Border.all(color: ColorUtils.white215,width: .75),
              borderRadius: BorderRadius.circular(12.r(context)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        textColor: ColorUtils.black64,
                        text: '${vendor['name']}',
                      ),

                      SpaceHelperWidget.v(8.h(context)),


                      TextHelperClass.headingTextWithoutWidth(
                        context: context,
                        alignment: Alignment.centerLeft,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textColor: ColorUtils.black96,
                        text: '${vendor['projects']} projects together',
                      ),

                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star_border_sharp, size: 20.r(context)),

                    SpaceHelperWidget.h(5.w(context)),

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textColor: ColorUtils.black64,
                      text: vendor['rating'].toString(),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}