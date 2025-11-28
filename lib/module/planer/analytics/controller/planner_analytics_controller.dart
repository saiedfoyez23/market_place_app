import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerAnalyticsController extends GetxController {

  // Static data - can be made reactive if needed
  final RxInt eventsManaged = 234.obs;
  final RxInt activeClients = 87.obs;
  final RxInt vendorPartnerships = 45.obs;
  final RxDouble totalEarnings = 342500.0.obs;
  final RxDouble rating = 3.5.obs;
  final RxInt reviewCount = 24.obs;

  RxInt eventManageYear = DateTime.now().year.obs;
  RxInt revenueGrowthYear = DateTime.now().year.obs;
  RxInt vendorCategoryYear = DateTime.now().year.obs;

  // Event distribution data
  final List<Map<String, dynamic>> eventTypes = [
    {'name': 'Weddings', 'count': 12, 'percentage': 70.0},
    {'name': 'Corporate', 'count': 12, 'percentage': 70.0},
    {'name': 'Birthday', 'count': 12, 'percentage': 70.0},
    {'name': 'Other', 'count': 12, 'percentage': 70.0},
  ];

  // Monthly events data for bar chart
  final List<BarChartGroupData> eventsBarData = [
    // Jan to Dec placeholders - adjust heights as per image (approximate)
    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 50,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 150,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 100,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 200,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 250,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 300,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 220,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 7, barRods: [BarChartRodData(toY: 180,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 8, barRods: [BarChartRodData(toY: 120,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 9, barRods: [BarChartRodData(toY: 160,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 10, barRods: [BarChartRodData(toY: 200,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 11, barRods: [BarChartRodData(toY: 140,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
  ];

  // Pie chart data for vendor categories
  final List<PieChartSectionData> pieSections = [
    PieChartSectionData(value: 25, color: Colors.purple, title: '25%', radius: 60),
    PieChartSectionData(value: 33, color: Colors.green, title: '33%', radius: 60),
    PieChartSectionData(value: 20, color: Colors.orange, title: '20%', radius: 60),
    PieChartSectionData(value: 15, color: Colors.red, title: '15%', radius: 60),
    PieChartSectionData(value: 7, color: Colors.blue, title: '7%', radius: 60),
  ];

  // Revenue growth bar data (similar to events)
  final List<BarChartGroupData> revenueBarData = [
    // Similar approximate data
    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 100,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 150,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 200,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 250,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 300,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 280,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 220,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 7, barRods: [BarChartRodData(toY: 180,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 8, barRods: [BarChartRodData(toY: 160,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 9, barRods: [BarChartRodData(toY: 120,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 10, barRods: [BarChartRodData(toY: 140,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
    BarChartGroupData(x: 11, barRods: [BarChartRodData(toY: 100,width: 10, color: ColorUtils.orange119, borderRadius: BorderRadius.circular(4),)]),
  ];

  // Top vendors data
  final List<Map<String, dynamic>> topVendors = [
    {'name': 'Elegant Catering Co.', 'projects': 8, 'rating': 4.8},
    {'name': 'Elegant Catering Co.', 'projects': 8, 'rating': 4.8},
    {'name': 'Elegant Catering Co.', 'projects': 8, 'rating': 4.8},
    {'name': 'Elegant Catering Co.', 'projects': 8, 'rating': 4.8},
    {'name': 'Elegant Catering Co.', 'projects': 8, 'rating': 4.8},
  ];

  Rx<PlannerAnalyticTab> selectedTab = PlannerAnalyticTab.revenueTrends.obs;

  void changeTab(PlannerAnalyticTab status) {
    selectedTab.value = status;
  }


}

enum PlannerAnalyticTab {revenueTrends, eventTypes, topVendors}