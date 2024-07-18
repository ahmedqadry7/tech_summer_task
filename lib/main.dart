import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/DI/injection.dart';
import 'presentation/bloc/cubit.dart';
import 'presentation/pages/home_screen.dart';

void main() {
  configureDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => getIt<ProductCubit>()..fetchProducts()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
