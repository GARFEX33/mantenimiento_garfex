import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class NavigateToForm extends HomeEvent {
  final String formType;

  const NavigateToForm(this.formType);

  @override
  List<Object> get props => [formType];
}
