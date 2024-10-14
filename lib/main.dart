import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/ruc_bloc.dart';
import 'repositories/ruc_repository.dart';
import 'screens/ruc_search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta RUC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => RucBloc(RucRepository()),
        child: RucSearchScreen(),
      ),
    );
  }
}
