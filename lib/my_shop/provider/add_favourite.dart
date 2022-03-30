import 'package:flutter/cupertino.dart';

class Favorite {
  final String name;
  final String img;
  final String summa;

  Favorite({
    required this.name,
    required this.img,
    required this.summa,
  });
}

class CartClass{
  final String name;
  final String img;
  final String summa;
  
  CartClass({
    required this.name,
    required this.img,
    required this.summa
  });
}

class AddFavorite extends ChangeNotifier {
  List<Favorite> favouriteList = [];

  void addFavourite(Favorite favorite) {
    favouriteList.add(favorite);
    notifyListeners();
  }

   List<CartClass> cartList = [];

  void addToCart(CartClass cartClass){
    cartList.add(cartClass);
    notifyListeners();
  }
}
