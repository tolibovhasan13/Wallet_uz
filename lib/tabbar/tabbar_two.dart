import 'package:flutter/material.dart';
import 'package:wallet_uz/my_shop/my_shop.dart';



class TabbarTwo extends StatefulWidget {
  const TabbarTwo({ Key? key }) : super(key: key);

  @override
  State<TabbarTwo> createState() => _TabbarTwoState();
}

class _TabbarTwoState extends State<TabbarTwo> {
  @override
  Widget build(BuildContext context) {
    return const MyShop();
  }
}