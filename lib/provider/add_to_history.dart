import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:provider/provider.dart';


class Controllers{
  final String controller1;
  final String controller2;

  Controllers({
    required this.controller1,
    required this.controller2
  });
}

class AddHistory extends ChangeNotifier{
  
  List<Controllers> historyArray = [];

  void addHistory(Controllers controllers){
    historyArray.add(controllers);
    notifyListeners();
  }
}