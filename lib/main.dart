import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_bloc.dart';
import 'page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(Colors.green), child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Page2();
            }));
          }),
      appBar: AppBar(
        title: Center(child: Text('tes bloc')),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          BlocBuilder<ColorBloc, Color>(
            builder: (context, color) => AnimatedContainer(
              width: 250,
              height: 320,
              color: color,
              duration: Duration(seconds: 3),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () =>
                      context.read<ColorBloc>().add(ColorEvent.to_purple),
                  child:
                      Container(color: Colors.purple, width: 40, height: 40)),
              GestureDetector(
                  onTap: () =>
                      context.read<ColorBloc>().add(ColorEvent.to_green),
                  child: Container(color: Colors.green, width: 40, height: 40)),
            ],
          ),
        ]),
      ),
    );
  }
}
