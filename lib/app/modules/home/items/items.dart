import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_appwrite/app/modules/sale_product/provider.dart';
import 'package:utils_widget/utils_widget.dart';
import 'ItemDetail/detail.dart';

class Items extends ConsumerWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(productListProvider);
    final snapshot = ref.watch(productStateProvider);
    if (snapshot.isEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 40),
        child: const Text(
          "Sorry! No products Available Now",
          style: TextStyle(fontSize: 17),
        ),
      );
    }
    return GridView.count(
      childAspectRatio: 0.90,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: snapshot
          .map(
            (product) => ItemList(
              image:
                  "https://cloud.appwrite.io/v1/storage/buckets/647d9eb631c5a428748a/files/${product.image}/view?project=6474e356cea4864218e8&mode=admin",
              productTitle: product.name,
              prize: product.price,
              hasnavigation: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(product.documentId)));
              },
              wishiconpressed: () {
                product.isFav
                    ? ref
                        .read(productStateProvider.notifier)
                        .removefromwishlist(product)
                    : ref
                        .read(productStateProvider.notifier)
                        .addtowishlist(product);
              },
              carticonpressed: () {
                product.inCart
                    ? showErrorNotice("Error", "Product Already in cart"): ref.read(productStateProvider.notifier).addtocartlist(product);
              },
              isFav: product.isFav,
            ),
          )
          .toList(),
    );
  }
}

class ItemList extends StatelessWidget {
  final bool isFav;
  final bool inCart;
  final String image;
  final String productTitle;
  final int prize;
  final void Function()? hasnavigation;
  final void Function()? wishiconpressed;
  final void Function()? carticonpressed;
  const ItemList({
    super.key,
    required this.image,
    required this.productTitle,
    required this.prize,
    required this.hasnavigation,
    required this.wishiconpressed,
    required this.carticonpressed,
    this.isFav = false,
    this.inCart = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: hasnavigation,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 140,
                width: 200,
                child: Image.network(
                  image,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(7),
              alignment: Alignment.centerLeft,
              child: Text(
                productTitle,
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    prize.toString(),
                    style: const TextStyle(
                        color: Color(0xFF4C53A5),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: wishiconpressed,
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : null,
                      )),
                  IconButton(
                      onPressed: carticonpressed,
                      icon: const Icon(Icons.shopping_cart))
                ],
              ),
            )
          ],
        ),
      ),
    );
    // Container(
    //   padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
    //   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   child: Column(
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Container(
    //             padding: const EdgeInsets.all(5),
    //             decoration: BoxDecoration(
    //               color: const Color(0xFF4C53A5),
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //             child: const Text(
    //               "-50%",
    //               style: TextStyle(
    //                 fontSize: 14,
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //           const Icon(
    //             Icons.favorite_border,
    //             color: Colors.red,
    //           )
    //         ],
    //       ),
    //       InkWell(
    //         onTap: () {},
    //         child: Container(
    //           margin: const EdgeInsets.all(10),
    //           child: Image.asset(
    //             "images/person.jpg",
    //             height: 100,
    //             width: 100,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         padding: const EdgeInsets.only(bottom: 8),
    //         alignment: Alignment.centerLeft,
    //         child: const Text(
    //           "Product Title",
    //           style: TextStyle(
    //             fontSize: 18,
    //             color: Color(0xFF4C53A5),
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         alignment: Alignment.centerLeft,
    //         child: const Text(
    //           "Write description of product",
    //           style: TextStyle(
    //             fontSize: 15,
    //             color: Color(0xFF4C53A5),
    //           ),
    //         ),
    //       ),
    //       const Padding(
    //         padding: EdgeInsets.symmetric(vertical: 10),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               "\$55",
    //               style: TextStyle(
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.bold,
    //                 color: Color(0xFF4C53A5),
    //               ),
    //             ),
    //             Icon(
    //               Icons.shopping_cart_checkout,
    //               color: Color(0xFF4C53A5),
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // ),;
  }
}
