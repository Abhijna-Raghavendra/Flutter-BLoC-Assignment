import 'package:flutter/material.dart';
import '/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';






void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterBloc, CounterState>(
                listener: (context, state) {
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Incremented!'),
                duration: Duration(milliseconds: 300),
              ),
            );
          }
        
                },
                builder: (context, state) {
                  return BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      if (state.counterValue < 0) {
                        return Text(
                          'ERROR ${state.counterValue}',
                          style: Theme.of(context).textTheme.headline4,
                        );
                      }
                      return Text(
                        state.counterValue.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      
                      BlocProvider.of<CounterBloc>(context).add(Decrement());
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(Increment());
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    
  }
}
