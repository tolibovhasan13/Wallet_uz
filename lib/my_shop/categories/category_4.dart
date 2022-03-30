import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/my_shop/my_shop.dart';
import 'package:wallet_uz/my_shop/popular_detail.dart';
import 'package:wallet_uz/my_shop/provider/add_favourite.dart';


List<Popular> categoryDetails4 = [
  Popular(
    img:
        'https://www.notebookcheck-ru.com/uploads/tx_nbc2/2075799-n0_02.jpg',
    name: 'ACER TravelMate',
    summa: '4 850 000',
  ),
  Popular(
    img:
        'https://www.creditasia.uz/upload/iblock/314/noutbuk-acer-aspire-3-a315-57g-76wk-nx-hzrer-006.webp',
    name: 'ACER Aspire A315',
    summa: '4 100 000',
  ),
   Popular(
    img:
        'https://notebook.uz/wa-data/public/shop/products/41/12/1241/images/3494/3494.750@2x.png',
    name: 'HP Notebook HP 250 G7 N5030',
    summa: '4 100 000',
  ),
];


class Category4 extends StatefulWidget {
  const Category4({ Key? key }) : super(key: key);

  @override
  State<Category4> createState() => _Category4State();
}

class _Category4State extends State<Category4> {
  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<AddFavorite>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noutbuklar'),
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
              itemCount: categoryDetails4.length,
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
                            name: categoryDetails4[index].name,
                            img: categoryDetails4[index].img,
                            summa: categoryDetails4[index].summa,
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
                              tag: categoryDetails4[index].img,
                              child: Image.network(
                                categoryDetails4[index].img,
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
                                  categoryDetails4[index].name,
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
                                  '${categoryDetails4[index].summa}so`m',
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