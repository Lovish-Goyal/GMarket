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
      childAspectRatio: 0.80,
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
              isFav: product.isFav,
            ),
          )
          .toList(),
    );
  }
}

class ItemList extends StatelessWidget {
  final bool isFav;
  final String image;
  final String productTitle;
  final int prize;
  final void Function()? hasnavigation;
  final void Function()? wishiconpressed;
  const ItemList({
    super.key,
    required this.image,
    required this.productTitle,
    required this.prize,
    required this.hasnavigation,
    required this.wishiconpressed,
    this.isFav = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: hasnavigation,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SizedBox(
                height: 100,
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
                  fontSize: 20,
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: wishiconpressed,
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : null,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
