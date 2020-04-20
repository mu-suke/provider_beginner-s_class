import 'package:flutter/material.dart';
import 'package:flutterappforprovider/counter_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => CounterStore(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterStore>(
      builder: (context, counterStore, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title ?? ''),
          ),
          body: Center(
            child: Text('${counterStore.count}'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: counterStore.incrementCounter,
          ),
        );
      }
    );
  }
}
