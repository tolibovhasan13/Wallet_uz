import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/provider/register_data.dart';


class Settings {
  final FaIcon icon;
  final String name;
  final Color color;

  Settings({
    required this.icon,
    required this.name,
    required this.color,
  });
}

List<Settings> user = [
  Settings(
      icon: const FaIcon(
        FontAwesomeIcons.bell,
        color: Colors.white,
      ),
      name: 'Bildirishnoma',
      color: Colors.green),
  Settings(
      icon: const FaIcon(
        FontAwesomeIcons.lock,
        color: Colors.white,
      ),
      name: 'Xavsizlik',
      color: Colors.yellow),
  Settings(
      icon: const FaIcon(
        FontAwesomeIcons.language,
        color: Colors.white,
      ),
      name: 'Tilni uzgartirish',
      color: Colors.red),
  Settings(
      icon: const FaIcon(
        FontAwesomeIcons.bars,
        color: Colors.white,
      ),
      name: 'Interfeys sozlamalari',
      color: Colors.blue),
  Settings(
      icon: const FaIcon(
        FontAwesomeIcons.exclamation,
        color: Colors.white,
      ),
      name: 'Ilova haqida',
      color: Colors.purple),
  Settings(
      icon: const FaIcon(
        FontAwesomeIcons.phone,
        color: Colors.white,
      ),
      name: 'Raqmni o`zgartirish',
      color: Colors.redAccent),
  Settings(
      icon: const FaIcon(
        FontAwesomeIcons.arrowRight,
        color: Colors.white,
      ),
      name: 'Akkauntdan chiqish',
      color: Colors.lightGreen),
];

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sozlamalar'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Consumer<RegisterData>(
            builder: (context, todo, child) {
              return Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage('images/user.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    todo.nameR == '' ? 'Tolibov Hasan' : todo.nameR,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.phoneR == '' ? '+998 99 999 99 99' : todo.phoneR,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                       'Siz aniqlangan foydalanuvchisiz',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                  trailing: const Image(
                    width: 40,
                    height: 40,
                    image: NetworkImage(
                      'https://www.qrcode-monkey.com/img/blog/qrcode-classic-blue.png',
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
          Flexible(
            child: ListView.builder(
                itemExtent: 70,
                itemCount: user.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    child: Center(
                      child: ListTile(
                        onTap: () {},
                        title: Text(user[index].name),
                        leading: Container(
                          decoration: BoxDecoration(
                            color: user[index].color,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: user[index].icon,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
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
