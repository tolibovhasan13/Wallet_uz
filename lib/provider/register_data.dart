import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

class RegisterData extends ChangeNotifier{
  String nameR = '';
  String phoneR = '';
  String emailR = '';

  void getRdata(String name, String phone, String email){
    nameR = name;
    phoneR = phone;
    emailR = email;
    notifyListeners();
  }
}