import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return HomePage();
}
}
class HomePage extends StatelessWidget {
  final List<String> items = new List<String>.generate(20, (i) => "Items ${i+1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Swipe to dismiss"),),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,int index){
          return new Dismissible(
            key: new Key(items[index]), 
            onDismissed: (direction){
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Item dismissed."),
                ));
            },
            background: new Container(
              color: Colors.red,
            ),
            child: new ListTile(
              title: Text("${items[index]}"),
            )
            );
        }
        ),
    );
  }
}