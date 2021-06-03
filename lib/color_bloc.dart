import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent {to_green, to_purple, to_amber}

class ColorBloc extends Bloc<ColorEvent, Color>{
  Color _color = Colors.green;

  ColorBloc(Color initialState) : super(initialState);

  @override
  Stream<Color> mapEventToState(ColorEvent event) async*{
    _color = (event == ColorEvent.to_green) ? Colors.green : ((event == ColorEvent.to_purple) ? Colors.purple : Colors.amber);
    yield _color;
  }

}