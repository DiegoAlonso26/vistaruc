import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/ruc_bloc.dart';
import '../blocs/ruc_event.dart';

class RucInputWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Ingresa RUC',
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<RucBloc>(context).add(FetchRuc(_controller.text));
          },
          child: Text('Buscar RUC'),
        ),
      ],
    );
  }
}
