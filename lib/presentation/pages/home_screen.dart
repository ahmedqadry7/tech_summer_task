import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/constants.dart';
import '../../data/DI/injection.dart';
import '../bloc/cubit.dart';
import 'product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset("assets/Route.png")),
      body: BlocProvider(
        create: (_) => getIt<ProductCubit>()..fetchProducts(),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'What do you search for?',
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 30,
                            color: Constants.baseColor,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: Constants.baseColor, width: 1),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Image(image: AssetImage("assets/shopping_cart.png"))
                  ],
                ),
              ),
              Expanded(
                child: ProductItem(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
