import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(Colors.green), child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () => context.read<ColorBloc>().add(ColorEvent.to_green)),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: () => context
                .read<ColorBloc>()
                .add(ColorEvent.to_purple))
      ]),
      appBar: AppBar(
        title: Center(child: Text('tes bloc')),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            width: 300,
            height: 400,
            color: currentColor,
            duration: Duration(seconds: 3),
          ),
        ),
      ),
    );
  }
}
