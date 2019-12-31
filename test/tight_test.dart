import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tight/tight.dart';

void main() {
  testWidgets('Counter Selector Test', (WidgetTester tester) async {
    final counter = Counter();
    final widget = MyWidget(counter);
    counter.setName("jon");
    await tester.pumpWidget(widget);
    var text = find.text("0");
    var name = find.text("jon");
    expect(text, findsOneWidget);
    expect(name,findsOneWidget);


    counter.add();
    counter.setName("bill");
    
    await tester.pump();
    text = find.text("1");
    name = find.text("bill");

    expect(text, findsOneWidget);
    expect(name,findsOneWidget);
  });

}

class MyWidget extends StatelessWidget {
  final Counter counter;
  MyWidget(this.counter);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Row(
            children: <Widget>[
              counter.expose((context){
                  print("rebuilding count");
                return Text("${counter.count}");}),
              counter.select((context){
                  print("rebuilding name");
                return Text("${counter.name}");},selector:(x)=>counter.name)
            ],
          ),
        ),
      ),
    );
  }
}

class Counter extends TightController<Counter> {
  int count = 0;
  String name = "";


  add() {
    count++;
    notifyListeners();
  }

  remove() {
    count--;
    notifyListeners();
  }

  setName(String name){
    this.name = name;
    notifyListeners();
  }
}
