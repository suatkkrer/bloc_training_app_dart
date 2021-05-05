import 'package:bloc_training_app/counter_bloc/counter_bloc.dart';
import 'package:bloc_training_app/counter_bloc/counter_event.dart';
import 'package:bloc_training_app/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          BlocProvider(create: (context) => CounterBloc(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc App"),
      ),
      body: myCenterWidget(),
      floatingActionButton: myActionButton(),
    );
  }
}

class myCenterWidget extends StatelessWidget {
  const myCenterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, counterState) {
              return Text(
                counterState.counter.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
        ],
      ),
    );
  }
}

class myActionButton extends StatelessWidget {
  const myActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
      FloatingActionButton(
        onPressed: () {
          context.bloc<CounterBloc>().add(AddCounter());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      FloatingActionButton(
        onPressed: () {
          context.bloc<CounterBloc>().add(SubCounter());
        },
        tooltip: 'Increment',
        child: Icon(Icons.exposure_minus_1),
      )
    ]);
  }
}
