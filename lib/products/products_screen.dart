import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_tech_task/constans.dart';
import 'package:route_tech_task/products/product_item.dart';
import 'package:route_tech_task/products/products_screen_view_model.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({super.key});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsScreenViewModel viewModel = ProductsScreenViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: Image.asset("assets/Route.png")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
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
                            vertical: 10.0, horizontal: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              BorderSide(color: Constants.baseColor, width: 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Image(image: AssetImage("assets/shopping_cart.png"))
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<ProductsScreenViewModel>(
                  builder: (context, viewModel, child) {
                    if (viewModel.productsList == null) {
                      return const Center(
                          child: CircularProgressIndicator(color: Colors.blue));
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.68,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: viewModel.productsList!.length,
                        itemBuilder: (context, index) {
                          var product = viewModel.productsList![index];
                          return ProductItem(products: product);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
