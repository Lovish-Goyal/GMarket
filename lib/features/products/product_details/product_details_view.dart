import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gmarket/features/products/products_listview.dart';
import 'package:utils_widget/utils_widget.dart';
import '../../../../app/modules/sale_product/provider.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final String productId;
  const ProductDetailsScreen(this.productId, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final snapshot = ref.watch(productProvider(widget.productId));

    return snapshot.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, _) => Scaffold(body: Center(child: Text("Error: $error"))),
      data: (product) {
        if (product == null) {
          return const Scaffold(body: Center(child: Text("Product not found")));
        }

        final imageUrl =
            "https://cloud.appwrite.io/v1/storage/buckets/647d9eb631c5a428748a/files/${product.image}/view?project=6474e356cea4864218e8&mode=admin";

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    // Product Image
                    Container(
                      height: MediaQuery.of(context).size.height / 1.8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Product Info
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title & Quantity
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                    ),
                                    onPressed: () {
                                      if (quantity < 2) {
                                        return;
                                      } else {
                                        setState(() {
                                          quantity--;
                                        });
                                      }
                                    },
                                  ),
                                  Text('$quantity'),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // Description
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product.description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: List.generate(5, (index) {
                              final rating = product.rating.toInt();
                              if (index < rating) {
                                return const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                );
                              } else {
                                return const Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                );
                              }
                            }),
                          ),
                          const SizedBox(height: 20),

                          Text(
                            "Rs. ${product.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),

                          SizedBox(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Add to Cart
                                Carthelper(
                                  inCart: product.inCart,
                                  icon: Icons.shopping_cart,
                                  text: product.inCart
                                      ? 'In Cart'
                                      : 'Add to Cart',
                                  onpressed: product.inCart
                                      ? null
                                      : () {
                                          ref
                                              .read(
                                                productStateProvider.notifier,
                                              )
                                              .addtocartlist(product);
                                          showSuccessNotice(
                                            "Cart",
                                            "Product added to cart",
                                          );
                                        },
                                ),

                                // Wishlist Toggle
                                Carthelper(
                                  inCart: product.inCart,
                                  icon: Icons.monetization_on,
                                  text: "Buy Now",
                                  onpressed: () {},
                                ),
                              ],
                            ),
                          ),

                          const Divider(),
                          SizedBox(height: 18),
                          const Text(
                            "Explore Other Products",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const ProductsListView(),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, size: 30, color: Colors.white),
                ),
              ),
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   right: 0,
              //   child:   ),
            ],
          ),
        );
      },
    );
  }
}

class Carthelper extends StatelessWidget {
  final bool inCart;
  final String text;
  final IconData icon;
  final void Function()? onpressed;

  const Carthelper({
    super.key,
    required this.text,
    required this.icon,
    required this.onpressed,
    this.inCart = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: inCart ? Colors.grey : const Color(0xFF4C53A5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: Icon(icon, color: Colors.white),
        label: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
