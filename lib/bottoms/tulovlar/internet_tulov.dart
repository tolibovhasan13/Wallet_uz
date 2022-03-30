import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/provider/add_to_history.dart';

class InternetTulov extends StatefulWidget {
  const InternetTulov({Key? key}) : super(key: key);

  @override
  State<InternetTulov> createState() => _InternetTulovState();
}

TextEditingController numberController = TextEditingController();
TextEditingController internetSummaController = TextEditingController();

class _InternetTulovState extends State<InternetTulov> {
  @override
  Widget build(BuildContext context) {
    var history = Provider.of<AddHistory>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet uchun'),
        centerTitle: true,
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
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Colors.grey,
                height: 1.2,
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Login'),
                    labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: TextField(
                  controller: internetSummaController,
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
                if (numberController.text.isEmpty ||
                    internetSummaController.text.isEmpty) {
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
                  numberController.text = '';
                  internetSummaController.text = '';

                    history.addHistory(
                    Controllers(
                      controller1: numberController.text,
                       controller2: internetSummaController.text,
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
