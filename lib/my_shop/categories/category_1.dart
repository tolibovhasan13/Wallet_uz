import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/my_shop/my_shop.dart';
import 'package:wallet_uz/my_shop/popular_detail.dart';
import 'package:wallet_uz/my_shop/provider/add_favourite.dart';

List<Popular> categoryDetails = [
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
    img: 'https://assets.asaxiy.uz/product/items/desktop/5e15bd7823f1f.PNG',
    name: 'ARTEL Mikroto`lqinlik Pech',
    summa: '1 200 000',
  ),
];

class Category1 extends StatefulWidget {
  const Category1({Key? key}) : super(key: key);

  @override
  State<Category1> createState() => _Category1State();
}

class _Category1State extends State<Category1> {
  @override
  Widget build(BuildContext context) {
     var favorite = Provider.of<AddFavorite>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maishiy texnika'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemCount: categoryDetails.length,
              itemBuilder: (BuildContext context, index) {
                // ignore: sized_box_for_whitespace
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                          value: favorite,
                          child: PopularDetail(
                            name: categoryDetails[index].name,
                            img: categoryDetails[index].img,
                            summa: categoryDetails[index].summa,
                          ),
                        ),
                      ),
                    );
                  },
                  // ignore: sized_box_for_whitespace
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: 100,
                      height: 150,
                      child: Column(
                        children: [
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: 80,
                            height: 80,
                            child: Hero(
                              tag: categoryDetails[index].img,
                              child: Image.network(
                                categoryDetails[index].img,
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  categoryDetails[index].name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${categoryDetails[index].summa}so`m',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
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
        ],
      ),
    );
  }
}
