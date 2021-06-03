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
          backgroundColor: Color(0xff901010),
          child: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Page2();
            }));
          }),
      appBar: AppBar(
        backgroundColor: Color(0xffff7010),
        title: Center(child: Text('Single Bloc')),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<ColorBloc, Color>(
                builder: (context, color) => AnimatedContainer(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40),color: color),
                  width: 250,
                  height: 320,
                  duration: Duration(seconds: 2),
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
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(20)),
                          width: 40,
                          height: 40)),
                  GestureDetector(
                      onTap: () =>
                          context.read<ColorBloc>().add(ColorEvent.to_green),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green),
                          width: 40,
                          height: 40)),
                          GestureDetector(
                      onTap: () =>
                          context.read<ColorBloc>().add(ColorEvent.to_amber),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.amber),
                          width: 40,
                          height: 40)),
                ],
              ),
            ]),
      ),
    );
  }
}
