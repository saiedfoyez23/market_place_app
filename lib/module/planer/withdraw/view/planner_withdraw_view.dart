import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplaceapp/module/module.dart';


class PlannerWithdrawView extends StatelessWidget {
  const PlannerWithdrawView({super.key});

  @override
  Widget build(BuildContext context) {
    final GetAllWithdrawController getAllWithdrawController = Get.put(GetAllWithdrawController(context: context));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'My Wallet',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Obx(() => getAllWithdrawController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Balance Card
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF6B4A), Color(0xFFFF8A65)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 24,
                    left: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Balance',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$23,105.00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 24,
                    right: 24,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Handle Withdraw
                        Get.snackbar('Withdraw', 'Withdraw feature coming soon');
                      },
                      icon: const Icon(Icons.account_balance_wallet, size: 18),
                      label: const Text('Withdraw'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFFFF6B4A),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Withdrawal History',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Text('All', style: TextStyle(fontWeight: FontWeight.w500)),
                      Icon(Icons.arrow_drop_down_rounded),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // List of Withdrawals
            Obx(() {
              final dataList = getAllWithdrawController.getAllWithdrawResponseModel.value.data?.withdrawList ?? [];
              if (dataList.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Text('No withdrawal history yet', style: TextStyle(color: Colors.grey)),
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: getAllWithdrawController.getAllWithdrawResponseModel.value.data?.withdrawList?.length,
                itemBuilder: (context, index) {
                  final item = dataList[index];
                  return _buildWithdrawItem(item);
                },
              );
            }),
          ],
        ),
      ),
      ),
    );
  }

  Widget _buildWithdrawItem(GetAllWithdrawResponseWithdrawList item) {
    final amount = item.amount; // Adjust if amount is in cents
    final status = item.status;

    Color statusColor = Colors.grey;
    if (status == 'completed') statusColor = Colors.green;
    if (status == 'pending') statusColor = Colors.orange;
    if (status == 'reject' || status == 'rejected') statusColor = Colors.red;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (item.method ?? 'Unknown').toUpperCase(),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatDate(item.createdAt),
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${NumberFormat('#,###.00').format(amount)}',
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                (item.status ?? 'Pending').toUpperCase(),
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return 'N/A';
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('MMM d, yyyy').format(date);
    } catch (e) {
      return dateStr;
    }
  }
}
