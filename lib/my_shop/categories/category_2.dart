import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/my_shop/my_shop.dart';
import 'package:wallet_uz/my_shop/popular_detail.dart';
import 'package:wallet_uz/my_shop/provider/add_favourite.dart';


List<Popular> categoryDetails2 = [
  Popular(
    img:
        'https://www.miuzbekistan.com/uploads/1/CM4o6BDXQeww0b9SsKx3bpOgBVqzsoxm.png',
    name: 'XIAOMI Redmi Note 8 32 GB',
    summa: '2 700 000',
  ),
   Popular(
    img: 'https://mediapark.uz/upload/file/mp/products/smartfony/644.jpg',
    name: 'SAMSUNG Galaxy A51 64 Gb',
    summa: '3 440 000',
  ),
   Popular(
    img: 'https://www.creditasia.uz/upload/iblock/c1a/smartfon-samsung-galaxy-a32-sm-a325f-ds-64gb-light-violet.jpg',
    name: 'SAMSUNG Galaxy A32 64 Gb',
    summa: '2 540 000',
  ),
  Popular(
    img: 'https://i01.appmifile.com/webfile/globalimg/Cindy/J15SGreen.png',
    name: 'XIAOMI Redmi Note 9 64 GB',
    summa: '1 840 000',
  ),
  Popular(
    img: 'https://cdn.movertix.com/media/catalog/product/cache/image/1230x/s/a/samsung-galaxy-a41-dual-sim-en-negro-de-64gb-y-4gb-ram-sm-a415f-ds.jpg',
    name: 'Samsung Galaxy A41',
    summa: '2 050 000',
  ),
];


class Category2 extends StatefulWidget {
  const Category2({ Key? key }) : super(key: key);

  @override
  State<Category2> createState() => _Category2State();
}

class _Category2State extends State<Category2> {
  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<AddFavorite>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telefonlar'),
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
              itemCount: categoryDetails2.length,
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
                            name: categoryDetails2[index].name,
                            img: categoryDetails2[index].img,
                            summa: categoryDetails2[index].summa,
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
                              tag: categoryDetails2[index].img,
                              child: Image.network(
                                categoryDetails2[index].img,
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
                                  categoryDetails2[index].name,
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
                                  '${categoryDetails2[index].summa}so`m',
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