import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/ruc_repository.dart';
import 'ruc_event.dart';
import 'ruc_state.dart';

class RucBloc extends Bloc<RucEvent, RucState> {
  final RucRepository rucRepository;

  RucBloc(this.rucRepository) : super(RucInitial()) {
    // Manejador para el evento FetchRuc
    on<FetchRuc>((event, emit) async {
      emit(RucLoading());
      try {
        final rucData = await rucRepository
            .fetchRucExtended(event.rucNumber); // Usamos fetchRucExtended
        emit(RucLoaded(rucData)); // Emitimos el estado de carga exitosa
      } catch (e) {
        // Manejo del error
        emit(RucError('Error al obtener los datos del RUC: $e'));
      }
    });
  }
}
