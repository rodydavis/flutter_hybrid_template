import 'package:flutter/material.dart';

import 'web_component.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Flutter Hybrid App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: title),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(
        builder: (context) => WebComponent(
          name: 'my-app',
          bundle:
              'https://rodydavis.github.io/flutter_hybrid_template/assets/main.js',
          attributes: {
            'name': widget.title,
          },
          slot: '<button id="my-button">Talk back!</button>',
          events: [
            EventCallback(
              event: 'click',
              query: '#my-button',
              onPressed: (_) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Clicked!')));
              },
            ),
          ],
        ),
      ),
    );
  }
}
