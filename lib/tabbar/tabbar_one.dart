import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Ads {
  final String name;
  final String imgUrl;
  final Color adsColor;

  Ads({
    required this.name,
    required this.imgUrl,
    required this.adsColor,
  });
}

List<Ads> ads = [
  Ads(
    name: 'Avtokredit',
    imgUrl:
        'https://e7.pngegg.com/pngimages/549/490/png-clipart-2016-chevrolet-malibu-2017-chevrolet-malibu-2018-chevrolet-malibu-car-chevrolet-compact-car-sedan.png',
    adsColor: Colors.pink,
  ),
  Ads(
    name: 'Open Budget',
    imgUrl:
        'https://www.internationalbudget.org/themes/custom/ibp/assets/img/ibp-obs-share-image.png',
    adsColor: Colors.lightGreen,
  ),
  Ads(
    name: 'Mikro qarz',
    imgUrl:
        'https://w1.pngwing.com/pngs/40/455/png-transparent-cartoon-money-wallet-money-clip-handbag-clothing-leather-brown-coin-purse.png',
    adsColor: Colors.red,
  ),
  Ads(
    name: 'HUMO pay',
    imgUrl: 'http://humocard.uz/upload/iblock/982/card.png',
    adsColor: Colors.purple,
  ),
  Ads(
    name: 'Konvertatsiya',
    imgUrl:
        'https://zamin.uz/uploads/posts/2018-01/1515835757_photo_2017-09-23_07-21-19.jpg',
    adsColor: Colors.green,
  ),
];

class TabbarOne extends StatefulWidget {
  const TabbarOne({Key? key}) : super(key: key);

  @override
  State<TabbarOne> createState() => _TabbarOneState();
}

class _TabbarOneState extends State<TabbarOne> {
  bool isclick = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
        Container(
          width: 300,
          height: 150,
          color: Colors.blue,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ads.length,
            itemBuilder: (BuildContext context, ind) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: Container(
                  width: 130,
                  decoration: BoxDecoration(
                    color: ads[ind].adsColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 120,
                        height: 100,
                        child: Image.network(
                          ads[ind].imgUrl,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              const Text(''),
                        ),
                      ),
                      Text(
                        ads[ind].name,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.maxFinite,
          height: 780,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Kartalar',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isclick = !isclick;
                            });
                          },
                          icon: FaIcon(
                            (isclick == true)
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: 28,
                            color: Colors.grey[700],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle,
                            size: 30,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    'https://uzoplata.com/wp-content/uploads/2020/10/humocard1.png',
                  ),
                ),
                title: Text(
                  (isclick == true) ? '0 uzs' : '*****',
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Humo **0001',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                height: 2,
                color: Colors.grey,
              ),
              ListTile(
                onTap: () {},
                title: Row(
                  children: [
                    Text(
                      'Hamma kartalarni ko`rish',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey[700],
                    )
                  ],
                ),
                trailing: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: const Color(0xFFF3F2F7),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 3, right: 3),
                  child: ListTile(
                    onTap: () {},
                    title: const Text(
                      'Karta buyurtma berish',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    subtitle: const Text(
                      'Bizning ilovamizda ko`proq qulayliklarga ega bo`lish uchun SQB kartalariga buyurtma bering',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 15, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F2F7),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                      left: 3,
                      right: 3,
                    ),
                    child: ListTile(
                        onTap: () {},
                        title: const Text(
                          'Kartaga o`tkazish',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        subtitle: const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            'Karta nomeri yoki telefon nomer',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                        trailing: const FaIcon(
                          FontAwesomeIcons.creditCard,
                          size: 30,
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
              ListTile(
                title: Row(
                  children: const [
                    Text(
                      'Kreditlar',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 14,
                    )
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 1.3,
                color: Colors.grey,
              ),
              ListTile(
                title: Row(
                  children: const [
                    Text(
                      'Depozitlar va hisoblar',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 14,
                    )
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle,
                    size: 28,
                  ),
                ),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Text(
                      'Mening moliyaviy ahvolim',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 14,
                    )
                  ],
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.pencilAlt)),
              ),
              Container(
                width: double.infinity,
                height: 30,
                color: const Color(0xFFF3F2F7),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Text(
                      'Valyutalar kursi',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 14,
                    )
                  ],
                ),
              ),
              ListTile(
                title: const Text(
                  'Hisob raqam',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
