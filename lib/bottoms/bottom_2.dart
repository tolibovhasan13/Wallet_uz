import 'package:flutter/material.dart';

List perevod = [
  'QR skanerlash',
  'Ekspess o`tkazma',
  'Mablag` yig`ish',
  'O`z kartanggiz orasi va hisob',
  'Kartaga',
  'Rekvizitlar uchun to`lovlar',
  'Oltin toj',
  'Konversiya',
  'Xalqaro o`tkazmalar'
];

class BottomSecond extends StatelessWidget {
  const BottomSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  'O`tkazmalar',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView.builder(
                itemCount: perevod.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    onTap: (){},
                    title: Text(
                      perevod[index],
                      style: const TextStyle(
                        fontSize: 17,
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
