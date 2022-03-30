import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/bottoms/bottom_3.dart';
import 'package:wallet_uz/provider/add_to_history.dart';

class MobilTulov extends StatefulWidget {
  const MobilTulov({Key? key}) : super(key: key);

  @override
  State<MobilTulov> createState() => _MobilTulovState();
}

TextEditingController loginController = TextEditingController();
TextEditingController summaController = TextEditingController();

class _MobilTulovState extends State<MobilTulov> {
  @override
  Widget build(BuildContext context) {
    var history = Provider.of<AddHistory>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobil operatorlar'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              ChangeNotifierProvider.value(
                value: history,
                child: const BottomThird(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Hisobdan chiqarish kartasi',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Humo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  '**0001',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                leading: const CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    'https://uzoplata.com/wp-content/uploads/2020/10/humocard1.png',
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 15,
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 1.2,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  maxLength: 9,
                  controller: loginController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text('998'),
                    prefixStyle: TextStyle(color: Colors.black, fontSize: 17),
                    labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                    label: Text('Telefon raqam'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: TextField(
                  controller: summaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Summa'),
                    labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(20),
              color: CupertinoColors.activeBlue,
              child: const Text('Davom ettirish'),
              onPressed: () {
                if (loginController.text.isEmpty ||
                    summaController.text.isEmpty) {
                  showDialog(
                      context: context,
                      barrierColor: Colors.black38,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Error',
                            style: TextStyle(color: Colors.red),
                          ),
                          content: const Text(
                            'Iltimos hamma maydonlarni to`ldiring',
                            style: TextStyle(fontSize: 18),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'OK',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        );
                      });
                } else {
                  showDialog(
                      context: context,
                      barrierColor: Colors.black38,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Successfull',
                            style: TextStyle(color: Colors.green),
                          ),
                          content: const Text(
                            'To`lov muafaqiyatli amalga oshirildi',
                            style: TextStyle(fontSize: 18),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'OK',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        );
                      });
                  loginController.text = '';
                  summaController.text = '';

                  String login = loginController.text;
                  String summa = loginController.text;

                  history.addHistory(
                    Controllers(
                      // controller1: loginController.text,
                      // controller2: summaController.text,

                      controller1: login,
                      controller2: summa,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
