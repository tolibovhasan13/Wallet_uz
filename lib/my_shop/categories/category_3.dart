import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/my_shop/my_shop.dart';
import 'package:wallet_uz/my_shop/popular_detail.dart';
import 'package:wallet_uz/my_shop/provider/add_favourite.dart';


List<Popular> categoryDetails3 = [
  Popular(
    img:
        'https://kattabozor.s3.eu-central-1.amazonaws.com/ri/5a2188c3b09efa7413d8755df5e70040db32e1c2dee0f622c117873a0340e7a7_g7esyS_640l.jpg',
    name: 'ARTEL Artel UA 32 H1200',
    summa: '2 960 000',
  ),
  Popular(
    img:
        'https://mediapark.uz/upload/file/mp/products/TV/Artel32AH90G.jpg',
    name: 'ARTEL Artel AH90G 32',
    summa: '2 750 000',
  ),
  Popular(
    img:
        'https://mediapark.uz/upload/file/mp/products/TV/Samsung_43N7100.jpg',
    name: 'SAMSUNG Samsung 43N 7100 Smart 43',
    summa: '2 760 000',
  ),
  Popular(
    img:
        'https://radius.uz/upload/iblock/1ad/3dampcydmbs29lnkx0xepa6r9jqk1rzn.jpeg',
    name: 'SAMSUNG Samsung 32N5300',
    summa: '3 200 000',
  ),
];


class Category3 extends StatefulWidget {
  const Category3({ Key? key }) : super(key: key);

  @override
  State<Category3> createState() => _Category3State();
}

class _Category3State extends State<Category3> {
  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<AddFavorite>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Televizorlar'),
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
              itemCount: categoryDetails3.length,
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
                            name: categoryDetails3[index].name,
                            img: categoryDetails3[index].img,
                            summa: categoryDetails3[index].summa,
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
                              tag: categoryDetails3[index].img,
                              child: Image.network(
                                categoryDetails3[index].img,
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
                                  categoryDetails3[index].name,
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
                                  '${categoryDetails3[index].summa}so`m',
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