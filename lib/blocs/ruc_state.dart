import 'package:equatable/equatable.dart';
import '../models/ruc_model.dart';

// Estado base
abstract class RucState extends Equatable {
  const RucState();

  @override
  List<Object> get props => [];
}

// Estado inicial
class RucInitial extends RucState {}

// Estado de carga
class RucLoading extends RucState {}

// Estado de éxito, cuando se han obtenido los datos
class RucLoaded extends RucState {
  final RucModel rucData;

  const RucLoaded(this.rucData);

  @override
  List<Object> get props => [rucData];
}

// Estado de error
class RucError extends RucState {
  final String error;

  const RucError(this.error);

  @override
  List<Object> get props => [error];
}
