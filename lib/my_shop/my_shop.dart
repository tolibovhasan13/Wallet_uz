import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/my_shop/categories/category_1.dart';
import 'package:wallet_uz/my_shop/categories/category_2.dart';
import 'package:wallet_uz/my_shop/categories/category_3.dart';
import 'package:wallet_uz/my_shop/categories/category_4.dart';
import 'package:wallet_uz/my_shop/fovoritePage.dart';
import 'package:wallet_uz/my_shop/popular_detail.dart';
import 'package:wallet_uz/my_shop/provider/add_favourite.dart';



class Popular {
  final String img;
  final String name;
  final String summa;

  Popular({required this.img, required this.name, required this.summa});
}

List<Popular> popularList = [
  Popular(
    img:
        'https://www.miuzbekistan.com/uploads/1/CM4o6BDXQeww0b9SsKx3bpOgBVqzsoxm.png',
    name: 'XIAOMI Redmi Note 8 32 GB',
    summa: '2 700 000',
  ),
  Popular(
    img:
        'https://olcha.uz/image/600x600/products/II6OZIigCY68RyQPKUo1zNz0qICCEwNFsjGCCvfcNF0HPicb1GGgykLJn4uz.jpeg',
    name: 'ARTEL Dazmol ART-SI-0809A',
    summa: '980 000',
  ),
  Popular(
    img: 'https://assets.asaxiy.uz/product/items/desktop/5e15bd1f6cab6.PNG',
    name: 'Samsung Mikroto`lqinlik Pech',
    summa: '900 000',
  ),
  Popular(
    img: 'https://assets.asaxiy.uz/product/items/desktop/5e15bd2101656.PNG',
    name: 'ARTEL Mikroto`lqinlik Pech',
    summa: '1 100 000',
  ),
  Popular(
    img: 'https://assets.asaxiy.uz/product/items/desktop/5e15bd7823f1f.PNG',
    name: 'ARTEL Mikroto`lqinlik Pech',
    summa: '1 200 000',
  ),
  Popular(
    img:
        'https://storage2.alifshop.uz/files?k1=93e27b9c-0ce3-4455-9e7b-584537640aee&k2=3a34529ad96d0d90b1119985c9f11aa7435c9d415a8f0205e24a0f731568da74f4aae2cab9c17677e54b463da2325d56ee4423adbb27a575c6bda1dc1b394f01',
    name: 'ARTEL Kondetsioner Iceberg Art',
    summa: '4 150 000',
  ),
  Popular(
    img:
        'https://idea.uz/storage/products/August2020/AlNs4QxusOkxZqXq8Jz3-medium.jpg',
    name: 'ARTEL Kondetsioner Iceberg Art plus',
    summa: '4 350 000',
  ),
  Popular(
    img: 'https://mediapark.uz/upload/file/mp/products/smartfony/644.jpg',
    name: 'SAMSUNG Galaxy A51 64 Gb',
    summa: '3 440 000',
  ),
  Popular(
    img:
        'https://kattabozor.s3.eu-central-1.amazonaws.com/ri/5a2188c3b09efa7413d8755df5e70040db32e1c2dee0f622c117873a0340e7a7_g7esyS_640l.jpg',
    name: 'ARTEL Artel UA 32 H1200',
    summa: '2 960 000',
  ),
  Popular(
    img:
        'https://zoodmall.com/cdn-cgi/image/w=500,fit=contain,f=auto/https://mediapark.uz/upload/file/mp/products/kondicionery/Artel_Grand_12HDG.jpg',
    name: 'ARTEL Kondetsioner Grand Art',
    summa: '4 170 000',
  ),
];

class Catecories {
  final FaIcon icon;
  final String name;
  final Color color;

  Catecories({
    required this.icon,
    required this.name,
    required this.color,
  });
}

List<Catecories> categories = [
  Catecories(
    icon: const FaIcon(
      FontAwesomeIcons.home,
      size: 40,
    ),
    name: 'Maishiy texnikalar',
    color: Colors.purple,
  ),
  Catecories(
    icon: const FaIcon(
      FontAwesomeIcons.mobile,
      size: 40,
    ),
    name: 'Telefonlar',
    color: Colors.yellow,
  ),
  Catecories(
    icon: const FaIcon(
      FontAwesomeIcons.tv,
      size: 40,
    ),
    name: 'Televizorlar',
    color: Colors.yellowAccent,
  ),
  Catecories(
    icon: const FaIcon(
      FontAwesomeIcons.laptop,
      size: 40,
    ),
    name: 'Kompyuter va planshetlat',
    color: Colors.blue,
  ),
];

List categoryPages = const [
  Category1(),
  Category2(),
  Category3(),
  Category4(),
];

class MyShop extends StatefulWidget {
  const MyShop({Key? key}) : super(key: key);

  @override
  State<MyShop> createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<AddFavorite>(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.users,
                  size: 23,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.clock,
                  size: 23,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider.value(
                        value: favorite,
                        child: const FavoritePage(),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.favorite_border,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.maxFinite,
            height: 600,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Ommabop mahsulotlat',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Hammasi'),
                      ),
                    ),
                  ],
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: 600,
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularList.length,
                    itemBuilder: (BuildContext context, index) {
                      // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        // ignore: sized_box_for_whitespace
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChangeNotifierProvider.value(
                                  value: favorite,
                                  child: PopularDetail(
                                    name: popularList[index].name,
                                    img: popularList[index].img,
                                    summa: popularList[index].summa,
                                  ),
                                ),
                              ),
                            );
                          },
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            width: 150,
                            height: 200,
                            child: Column(
                              children: [
                                // ignore: sized_box_for_whitespace
                                Container(
                                  width: 100,
                                  height: 120,
                                  child: Hero(
                                    tag: popularList[index].img,
                                    child: Image.network(
                                      popularList[index].img,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Text(''),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        popularList[index].name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        '${popularList[index].summa}so`m',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.start,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ommabop kategoriyalar',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Hammasi',
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: 450,
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChangeNotifierProvider.value(
                                value: favorite,
                                child: categoryPages[index],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                            children: [
                              Container(
                                width: 110,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: categories[index].color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: categories[index].icon,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // ignore: sized_box_for_whitespace
                              Container(
                                width: 100,
                                child: Text(
                                  categories[index].name,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
