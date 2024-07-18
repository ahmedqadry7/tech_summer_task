// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/constants.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';

class ProductItem extends StatefulWidget {
  ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ItemState();
}

class _ItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Constants.baseColor));
        } else if (state is ProductSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              final originalPrice =
                  product.price / (1 - product.discountPercentage / 100);
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Constants.baseColor, width: .5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10)),
                          child: Image.network(
                            product.thumbnail,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.baseColor,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                product.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Constants.baseColor,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    'EGP ${product.price}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Constants.baseColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "${originalPrice.toStringAsFixed(2)} EGP",
                                    style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.blueAccent,
                                        decorationThickness: 2,
                                        color: Colors.blueAccent,
                                        fontSize: 11),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Review (${product.rating})',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Constants.baseColor,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Image.asset("assets/star.png"),
                                  const Spacer(),
                                  Image.asset("assets/Vector.png"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No products found'));
        }
      },
    );
  }
}
