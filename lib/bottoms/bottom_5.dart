import 'package:flutter/material.dart';

List about = [
  'Elektron navbat',
  'Dokumentlar',
  'Savat',
  'Do`stingizni taklif qilish',
  'Chat',
  'Bizning ofislar',
  'Avtokredit bo`yicha ariza'
];

class BottomFive extends StatelessWidget {
  const BottomFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: about.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    about[index],
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
