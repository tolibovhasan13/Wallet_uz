import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/bottoms/tulovlar/internet_tulov.dart';
import 'package:wallet_uz/bottoms/tulovlar/mobil_tulov.dart';
import 'package:wallet_uz/provider/add_to_history.dart';



class BottomThird extends StatefulWidget {
  const BottomThird({Key? key}) : super(key: key);

  @override
  State<BottomThird> createState() => _BottomThirdState();
}

class _BottomThirdState extends State<BottomThird> {
  @override
  Widget build(BuildContext context) {
    List tulov = [
      'Mobil operatorlar',
      'Internet',
    ];

    List tulovNavigator = const [
      MobilTulov(),
      InternetTulov(),
    ];
    
    var history = Provider.of<AddHistory>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 10, left: 15),
                child: Text(
                  'To`lovlar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView.builder(
                itemCount: tulov.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider.value(
                            value: history,
                            child: tulovNavigator[index],
                            ),
                        ),
                      );
                    },
                    title: Text(
                      tulov[index],
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
