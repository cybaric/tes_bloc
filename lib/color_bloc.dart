import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent {to_green, to_purple}

class ColorBloc extends Bloc<ColorEvent, Color>{
  Color _color = Colors.green;

  ColorBloc(Color initialState) : super(initialState);

  @override
  Stream<Color> mapEventToState(ColorEvent event) async*{
    _color = (event == ColorEvent.to_green) ? Colors.green : Colors.purple;
    yield _color;
  }

}