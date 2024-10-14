import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/ruc_bloc.dart';
import '../blocs/ruc_state.dart';
import '../widgets/ruc_input_widget.dart';
import '../widgets/ruc_result_widget.dart';

class RucSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double height = size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Consulta RUC')),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          children: [
            RucInputWidget(),
            SizedBox(height: height * 0.03),
            Expanded(
              child: SingleChildScrollView(
                child: BlocBuilder<RucBloc, RucState>(
                  builder: (context, state) {
                    if (state is RucInitial) {
                      return Center(
                        child: Text('Ingresa un RUC para buscar.'),
                      );
                    } else if (state is RucLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is RucLoaded) {
                      return RucResultWidget(rucData: state.rucData);
                    } else if (state is RucError) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _showAlertDialog(context, 'Error', state.error);
                      });
                      return Container(); // Evitar mostrar error en texto
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para mostrar el diálogo de alerta
  void _showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
          ],
        );
      },
    );
  }
}
