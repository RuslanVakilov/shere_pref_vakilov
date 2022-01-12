import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class SharedPrefScreen extends StatelessWidget {
  const SharedPrefScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Потапай от души',
      home: PathDemoScreen(title: 'Потапай от души'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter =0;
  int _counter2 =0;

  @override

  void initState (){
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter')?? 0);
      _counter2 = (prefs.getInt('counter2')?? 0);
    });
  }
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter')?? 0) + 1;
      prefs.setInt('counter', _counter);
        });
  }

  void _incrementCounter2() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
  _counter2 = (prefs.getInt('counter2')?? 0) + 1;
  prefs.setInt('counter2', _counter2);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
      body: Center(
         child:
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 154,
                height: 42,
                child: ElevatedButton(
                  onPressed: _incrementCounter,
                   child: Text('Тап Тап'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0079D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                )),
            const Text(
              'You TAP the button this many times:',
            ),
            Text ('$_counter',style: Theme.of(context).textTheme.headline4,),


            SizedBox(
              height: 30,
            ),

            SizedBox(
                width: 154,
                height: 42,
                child: ElevatedButton(
                  onPressed: _incrementCounter2,
                  child: Text('Тап Тап'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0079D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                )),

            const Text(
                'You TAP the button this many times:',
            ),
            Text (
              '$_counter2',
              style: Theme.of(context).textTheme.headline4,
            ),
           Text (
              'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
            ),
          ],
        ),

      ),

         );
 }
}

class PathDemoScreen extends StatelessWidget {
  const PathDemoScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(storage: CounterStorage()),
    );
  }
}

class CounterStorage{
  Future<String> get _localPath async {
    final directory =await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File ('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();
      return int.parse(contents);
    }
    catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter (int counter) async {
    final file = await _localFile;

    return file.writeAsString('$counter');
  }
}


class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;


  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter ++;
    });

    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading and Writing Files'),
      ),
      body: Center(
        child: Text(
          'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
