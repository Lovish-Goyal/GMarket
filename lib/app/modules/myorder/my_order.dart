import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_appwrite/app/modules/wishlist/provider.dart';

import '../../router.dart';
import '../sale_product/provider.dart';

class MyOrder extends ConsumerWidget {
  const MyOrder({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.watch(wishStateProvider);
    if (snapshot.isEmpty) {
      return const EmptyMyOrder();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF4C53A5),
          centerTitle: true,
          title: const Text("My Wishlist"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
              childAspectRatio: 4.0,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 1,
              shrinkWrap: true,
              children: snapshot
                  .map(
                    (product) => InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: const Color(0xFF4C53A5), width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(10),
                                child: Image.network(
                                  "https://cloud.appwrite.io/v1/storage/buckets/647d9eb631c5a428748a/files/${product.image}/view?project=6474e356cea4864218e8&mode=admin",
                                )),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(product.name),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(product.price.toString()),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(product.quantity.toString())
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 150,
                            ),
                            IconButton(
                                onPressed: () {
                                  ref
                                      .read(productStateProvider.notifier)
                                      .removefromwishlist(product);
                                },
                                icon: const Icon(FontAwesomeIcons.dumpster))
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ));
  }
}

class EmptyMyOrder extends StatelessWidget {
  const EmptyMyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset('images/EmptyOrder.jpg'),
          const Center(
            child: Text(
              "No Order yet",
              style: TextStyle(
                  color: Colors.black,  fontSize: 28,fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Looks like you haven`t placed any order yet",
            style: TextStyle(
                color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(height: 30),
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
