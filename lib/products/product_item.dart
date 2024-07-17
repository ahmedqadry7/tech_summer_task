// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:route_tech_task/constans.dart';
import 'package:route_tech_task/model/product_response.dart';

class ProductItem extends StatelessWidget {
  Products products;
  ProductItem({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    // ListTile(
    //             title: Text(product.title ?? 'No Title'),
    //             subtitle: Text('\$${product.price?.toString() ?? 'No Price'}'),
    //             leading: product.thumbnail != null
    //                 ? Image.network(product.thumbnail!)
    //                 : null,
    //           );
    return Container(
      height: 250,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFB3C6DA), width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(products.thumbnail!, fit: BoxFit.cover),
                Image.asset("assets/like.png")
              ],
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(products.title ?? 'No title',
                  maxLines: 2,
                  style: TextStyle(color: Constants.baseColor, fontSize: 16)),
            ),
            SizedBox(height: 5),
            Text("EGP ${products.price.toString()}",
                style: TextStyle(color: Constants.baseColor, fontSize: 16)),
            SizedBox(height: 5),
            Row(
              children: [
                Text("Review (${products.rating.toString()})",
                    style: TextStyle(color: Constants.baseColor, fontSize: 16)),
                SizedBox(width: 5),
                Image.asset("assets/star.png"),
                Spacer(),
                Image.asset("assets/Vector.png"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
