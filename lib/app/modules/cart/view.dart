import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_appwrite/app/modules/cart/provider.dart';
import 'package:learn_appwrite/app/modules/sale_product/provider.dart';

import '../../router.dart';
import '../home/items/ItemDetail/detail.dart';

class Cart extends ConsumerWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.watch(cartStateProvider);
    if (snapshot.isEmpty) {
      return const EmptyCart();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C53A5),
        centerTitle: true,
        title: const Text("My cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: GridView.count(
              childAspectRatio: 2.5,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 1,
              shrinkWrap: true,
              children: snapshot
                  .map(
                    (product) => InkWell(
                      onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(product.productId,)));
            },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: const Color(0xFF4C53A5), width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    width: 130,
                                    margin: const EdgeInsets.all(10),
                                    child: Image.network(
                                      "https://cloud.appwrite.io/v1/storage/buckets/647d9eb631c5a428748a/files/${product.image}/view?project=6474e356cea4864218e8&mode=admin",
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(top:10,left: 5),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        product.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text("Price: ${product.price.toString()}"),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                          "Quantity: ${product.quantity.toString()}")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(productStateProvider.notifier)
                                        .removefromcartlist(product);
                                  },
                                  icon: const Icon(Icons.delete)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 180),
              child: Image.asset('assets/images/Emptycart.jpg')),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Cart is empty",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Looks like you have no items",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
           const Center(
            child: Text(
              "in your shopping cart",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(height: 40),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF4C53A5),
                        Color(0xFF4C53A5),
                        Color(0xFF4C53A5)
                      ])),
              child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Explore products',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold))),
            ),
            onTap: () => context.go("${RouteKey.home}?index=0"),
          ),
        ],
      ),
    );
  }
}
