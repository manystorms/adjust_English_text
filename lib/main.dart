import 'package:flutter/material.dart';
import 'package:serious_python/serious_python.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = "Press the button to run Python code";

  void _runPython(int a, int b) async {
    try {
      var result = await SeriousPython.run("assets/test.zip",
          appFileName: "test.py",
          environmentVariables: {"a": "1", "b": "2"});
      print('a');
      print(result);
      setState(() {
        if(result != null) _output = result;
      });
    } catch (e) {
      setState(() {
        _output = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int a = 3;
    int b = 4;
    return Scaffold(
      appBar: AppBar(
        title: Text('Serious Python Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _output,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _runPython(a, b),
              child: Text('Run Python Code'),
            ),
          ],
        ),
      ),
    );
  }
}
