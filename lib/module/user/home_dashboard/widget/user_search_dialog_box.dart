import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class UserSearchDialogBox extends StatelessWidget {
  UserSearchDialogBox({super.key});

  final SearchUserController searchUserController = Get.put(SearchUserController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.r(context)),
      ),
      child: Obx(()=>Container(
        height: 930.h(context),
        width: 428.w(context),
        padding: EdgeInsets.symmetric(horizontal: 20.hpm(context),vertical: 20.vpm(context)),
        decoration: BoxDecoration(
          color: ColorUtils.white251,
        ),
        child: CustomScrollView(
          slivers: [

            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Search Field
                  TextFormFieldWidget.build(
                    context: context,
                    hintText: "Search Planner Or Category....",
                    controller: searchUserController.searchController.value,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) async {

                    },
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(
                        20.lpm(context),
                        14.5.tpm(context),
                        5.rpm(context),
                        14.5.bpm(context),
                      ),
                      child: ImageHelperWidget.assetImageWidget(
                        context: context,
                        height: 20.h(context),
                        width: 20.w(context),
                        imageString: ImageUtils.searchImage,
                      ),
                    ),
                  ),

                  SpaceHelperWidget.v(32.h(context)),

                  /// Sections
                  _buildSection(
                    title: "Popular Searches",
                    selected: "Clothing",
                  ),

                  const SizedBox(height: 20),

                  _buildSection(
                    title: "Suggested Planner",
                    selected: "Clothing",
                  ),

                  const SizedBox(height: 20),

                  _buildSection(
                    title: "Trending Categories",
                    selected: "Clothing",
                  ),

                  const SizedBox(height: 24),

                  /// Recent Search
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent Search",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Clear All"),
                      )
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          "https://i.pravatar.cc/150?img=3",
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          "Party Perfect",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }


  Widget _buildSection({
    required String title,
    required String selected,
  }) {
    final categories = [
      "All",
      "Furniture",
      "Clothing",
      "Electronics",
      "Food",
      "Clothing",
      "Others"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: categories.map((e) => _categoryChip(text: e, isSelected: e == selected,),).toList(),
        ),
      ],
    );
  }


  Widget _categoryChip({
    required String text,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffF3705A) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }


}
