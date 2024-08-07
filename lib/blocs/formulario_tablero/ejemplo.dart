// lib/blocs/counter/counter_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Definir el estado del contador
class CounterState {
  final int counterValue;

  CounterState(this.counterValue);
}

// Definir los eventos del cubit
enum CounterEvent { increment, decrement }

// Crear el cubit para manejar los eventos y actualizar el estado
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  void onEvent(CounterEvent event) {
    if (event == CounterEvent.increment) {
      emit(CounterState(state.counterValue + 1));
    } else if (event == CounterEvent.decrement) {
      emit(CounterState(state.counterValue - 1));
    }
  }
}
