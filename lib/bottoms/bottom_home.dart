// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/my_shop/provider/add_favourite.dart';
import 'package:wallet_uz/tabbar/tabbar_one.dart';
import 'package:wallet_uz/tabbar/tabbar_two.dart';

class BottomHome extends StatefulWidget {
  const BottomHome({Key? key}) : super(key: key);

  @override
  State<BottomHome> createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {
  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<AddFavorite>(context);
    return Column(
      children: [
        Container(
          color: Colors.blue,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[400],
              tabs: const [
                Tab(
                  child: Text(
                    'Mening bankim',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Magazin',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
         Flexible(
          child: TabBarView(
            children: [
              const TabbarOne(),
              ChangeNotifierProvider.value(
                value: favorite,
                child: const TabbarTwo()
                ),
            ],
          ),
        ),
      ],
    );
  }
}
