import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/my_shop/provider/add_favourite.dart';

class PopularDetail extends StatefulWidget {
  const PopularDetail({
    Key? key,
    required this.name,
    required this.img,
    required this.summa,
  }) : super(key: key);
  final String name;
  final String img;
  final String summa;

  @override
  State<PopularDetail> createState() => _PopularDetailState();
}

class _PopularDetailState extends State<PopularDetail> {
  @override
  Widget build(BuildContext context) {
    var favourite = Provider.of<AddFavorite>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              if (favourite.favouriteList.contains(widget.name)) {
                var snackBar = SnackBar(
                  content: Text(widget.name + ' sevimliylarga qo`shilgan'),
                  duration: const Duration(milliseconds: 1000),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                favourite.addFavourite(
                  Favorite(
                    name: widget.name,
                    img: widget.img,
                    summa: widget.summa,
                  ),
                );
                var snackBar = SnackBar(
                  content: Text(widget.name + ' sevimliylarga qo`shildi'),
                  duration: const Duration(milliseconds: 1000),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: 200,
            height: 250,
            child: Hero(
              tag: widget.img,
              child: Image.network(
                widget.img,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) => const Text(''),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mahsulot',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Narxi: ' + widget.summa.toString() + ' so`m',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Mahsulot haqida qisqacha:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
                child: const Text('Xarid qilish'),
                onPressed: () {
                  // favourite.addToCart(
                  //   CartClass(
                  //     name: widget.name,
                  //     img: widget.img,
                  //     summa: widget.summa,
                  //   ),
                  // );
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Error',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 21,
                        ),
                      ),
                      content: Text(
                        widget.name +
                            ' ni sotib olishingiz uchun mablag`ingiz yetarli emas!',
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK', style: TextStyle(fontSize: 16),),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
