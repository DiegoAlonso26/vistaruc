import 'package:equatable/equatable.dart';

// Evento base
abstract class RucEvent extends Equatable {
  const RucEvent();

  @override
  List<Object> get props => [];
}

// Evento para buscar un RUC
class FetchRuc extends RucEvent {
  final String rucNumber;

  const FetchRuc(this.rucNumber);

  @override
  List<Object> get props => [rucNumber];
}
