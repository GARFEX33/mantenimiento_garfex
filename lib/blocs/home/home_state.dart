import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeFormSelected extends HomeState {
  final String formType;

  const HomeFormSelected(this.formType);

  @override
  List<Object> get props => [formType];
}
