import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/appbars/appbar_calendar.dart';
import 'package:wallet_uz/appbars/appbar_notif.dart';
import 'package:wallet_uz/appbars/user_settings.dart';
import 'package:wallet_uz/bottoms/bottom_2.dart';
import 'package:wallet_uz/bottoms/bottom_3.dart';
import 'package:wallet_uz/bottoms/bottom_4.dart';
import 'package:wallet_uz/bottoms/bottom_5.dart';
import 'package:wallet_uz/bottoms/bottom_home.dart';
import 'package:wallet_uz/my_shop/provider/add_favourite.dart';
import 'package:wallet_uz/provider/add_to_history.dart';
import 'package:wallet_uz/provider/register_data.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.name,
    required this.phone,
    required this.email,
  }) : super(key: key);
  String name;
  String phone;
  String email;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = [
    ChangeNotifierProvider.value(
      value: AddFavorite(),
      child: const BottomHome(),
    ),
    const BottomSecond(),
    ChangeNotifierProvider.value(
        value: AddHistory(), child: const BottomThird(),
        ),
    ChangeNotifierProvider.value(
      value: AddHistory(),
      child: const BottomFour(),
    ),
    const BottomFive()
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_element, non_constant_identifier_names
  void DialogShow(String title, Widget content, BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black38,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
          content: content,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void progressAlert(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black54,
      barrierLabel: 'Label',
      barrierDismissible: false,
      pageBuilder: (_, __, ___) => Center(
        child: Container(
          color: Colors.transparent,
          child: Material(
            color: Colors.transparent,
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 40,
              height: 40,
              child: const Center(
                child: CircularProgressIndicator(
                  // color: Color(0xFF88B3F3),
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> alertPop() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        // Navigator.canPop(context);
        Navigator.pop(context);
      },
    );
  }

  @override
  void initState() {
    checkConnectionOn(context);
    super.initState();
  }

  late bool isConnect;

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<RegisterData>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          elevation: 0,
          // ignore: avoid_unnecessary_containers
          title: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF3B63C2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: '  Qidiruv',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          leading: Center(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: counter,
                      child: const UserSettings(),
                    ),
                  ),
                );
              },
              icon: const FaIcon(FontAwesomeIcons.user),
            ),
          ),
          actions: [
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppCalendar(),
                    ),
                  );
                },
                child: const FaIcon(FontAwesomeIcons.calendar),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppBarNotif(),
                    ),
                  );
                },
                child: const FaIcon(FontAwesomeIcons.bell),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        body: MyHomePage._widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Bosh sahifa',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.exchangeAlt),
              label: 'O`tkazmalar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payments),
              label: 'To`lovlar',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.clock),
              label: 'Tarix',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Boshqalar',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Future<void> checkConnectionOn(BuildContext context) async {
    final StreamSubscription<InternetConnectionStatus> listener =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            alertPop();
            isConnect = true;
            progressAlert(context);
            break;
          case InternetConnectionStatus.disconnected:
            isConnect = false;
            DialogShow(
                'Error', const Text('Internet bilan muammo mavjud', style: TextStyle(fontSize: 16),), context);
            break;
        }
      },
    );
    await Future<void>.delayed(const Duration(seconds: 10));
    await listener.cancel();
  }
}
