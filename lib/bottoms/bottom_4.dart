import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/provider/add_to_history.dart';



class BottomFour extends StatefulWidget {
  const BottomFour({ Key? key }) : super(key: key);

  @override
  State<BottomFour> createState() => _BottomFourState();
}

class _BottomFourState extends State<BottomFour> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var history = Provider.of<AddHistory>(context);
    return Scaffold(
      body: Consumer<AddHistory>(
        builder: (context, todo, child){
          return ListView.builder(
        itemCount: todo.historyArray.length,
        itemBuilder: (BuildContext context, index){
          return ListTile(
            title: Text(todo.historyArray[index].controller1.toString()),
            subtitle: const Text('daadda'),
          );
        }
        );
        },
      ),
    );
  }
}