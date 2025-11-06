import 'package:flutter/material.dart';
import 'package:marketplaceapp/utils/utils..dart';

class ChooseView extends StatelessWidget {
  const ChooseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 930.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: ColorUtils.white251,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
          child: CustomScrollView(
            slivers: [








            ],
          ),
        ),
      ),
    );
  }
}
