import 'package:flutter/material.dart';
import 'package:shope_ab/utils/app_constant.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appMainColor,
      appBar: AppBar(title: Text("SHOP_AB"),
      backgroundColor:  AppConstant.appSecondColor,
      elevation: 0,
      centerTitle: true,),
    );
  }
}
