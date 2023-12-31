import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/count_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CounterList())],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Consumer<CounterList>(
          builder: ((context, counterList, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                   // counterList.counter.toString(),
                    '${Provider.of<CounterList>(context).counter} tasks',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ElevatedButton(
                      onPressed: counterList.incrementCounter,
                      child: Container(
                        color: Colors.cyan,
                        child: Text('yegddfgefg'),
                      )),
                  ElevatedButton(
                      onPressed: counterList.decrementCounter,
                      child: Container(
                        color: Colors.cyan,
                        child: Text('yegddfgefg'),
                      ))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
