// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/my_shop/provider/add_favourite.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sevimliylar'),
        centerTitle: true,
      ),
      body: Consumer<AddFavorite>(
        builder: (context, todo, child) {
          return todo.favouriteList.isNotEmpty
              ? GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                  ),
                  itemCount: todo.favouriteList.length,
                  itemBuilder: (BuildContext context, index) {
                    // ignore: sized_box_for_whitespace
                    return GestureDetector(
                      onTap: () {},
                      // ignore: sized_box_for_whitespace
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 20, left: 10, right: 10),
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
                                child: Image.network(
                                  todo.favouriteList[index].img,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Text(''),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      todo.favouriteList[index].name,
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
                                      '${todo.favouriteList[index].summa}so`m',
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
                )
              : const Center(
                  child: Image(
                    image: AssetImage('images/isEmpty.png'),
                  ),
                );
        },
      ),
    );
  }
}
