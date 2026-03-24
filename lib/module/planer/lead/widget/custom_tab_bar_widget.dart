import 'package:flutter/material.dart';
import 'package:marketplaceapp/utils/utils.dart';


class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final Function(BuildContext context,int index) onTap;


  @override
  Widget build(BuildContext context) {
    final tabs = ["New", "Contacted", "Qualified", "Cancel"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(tabs.length, (index) {
        return InkWell(
          onTap: () {
            onTap(context,index);
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
                fontWeight: selectedIndex == index ? FontWeight.w600 : FontWeight.w500,
                textColor: selectedIndex == index ? ColorUtils.orange119 : ColorUtils.black64,
                text: tabs[index],
              ),
              SpaceHelperWidget.v(4.h(context)),
              if (selectedIndex == index)
                Container(
                  height: 3.h(context),
                  width: 20.w(context),
                  color: ColorUtils.orange119,
                )
            ],
          ),
        );
      }),
    );
  }
}
