import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(CounterState(counter: 0)),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
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
  CounterBloc _counterBloc;

  Widget build(BuildContext context) {
    _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _counterBloc.add(IncrementEvent()),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () => _counterBloc.add(DecrementEvent()),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Bloc Counter Example'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              '${state.counter}',
              style: TextStyle(fontSize: 50.0),
            );
          },
        ),
      ),
    );
  }
}
