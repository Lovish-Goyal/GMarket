import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gmarket/features/products/product_details/product_details_view.dart';
import 'package:go_router/go_router.dart';
import '../../app/router.dart';
import '../../app/modules/sale_product/provider.dart';
import 'providers/provider.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartStateProvider);

    return cartAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) =>
          Scaffold(body: Center(child: Text('Error: $error'))),
      data: (cartItems) {
        if (cartItems.isEmpty) {
          return const EmptyCart();
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "My Cart",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 1,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final product = cartItems[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(product.productId),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 246, 246, 246),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Image.network(
                          "https://cloud.appwrite.io/v1/storage/buckets/647d9eb631c5a428748a/files/${product.image}/view?project=6474e356cea4864218e8&mode=admin",
                          width: 120,
                          height: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Price: \$${product.price}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 90, 89, 89),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                ref
                                    .read(cartStateProvider.notifier)
                                    .removefrom(product);
                              },
                              child: const Text('Remove'),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 36,
                                height: 36,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .read(cartStateProvider.notifier)
                                        .decreaseQuantity(product);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade300,
                                    shape: const CircleBorder(),
                                    padding: EdgeInsets.zero,
                                    elevation: 0,
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "${product.quantity}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                width: 36,
                                height: 36,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .read(cartStateProvider.notifier)
                                        .increaseQuantity(product);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade300,
                                    shape: const CircleBorder(),
                                    padding: EdgeInsets.zero,
                                    elevation: 0,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// class CartView extends ConsumerStatefulWidget {
//   const CartView({super.key});

//   @override
//   ConsumerState<CartView> createState() => _CartViewState();
// }

// class _CartViewState extends ConsumerState<CartView> {
//   @override
//   void initState() {
//     Future.delayed(Duration.zero, () {
//       ref.watch(cartStateProvider);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cartItems = ref.watch(cartStateProvider);

//     if (cartItems.isEmpty) {
//       return const EmptyCart();
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           "My Cart",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF111827),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: cartItems.length,
//         itemBuilder: (context, index) {
//           final product = cartItems[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ProductDetailsScreen(product.productId),
//                 ),
//               );
//             },
//             child: Container(
//               margin: const EdgeInsets.only(bottom: 16),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 246, 246, 246),
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.1),
//                     blurRadius: 8,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(12),
//                       bottomLeft: Radius.circular(12),
//                     ),
//                     child: Image.network(
//                       "https://cloud.appwrite.io/v1/storage/buckets/647d9eb631c5a428748a/files/${product.image}/view?project=6474e356cea4864218e8&mode=admin",
//                       width: 120,
//                       height: 120,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           product.name,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 22,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Price: \$${product.price}",
//                           style: const TextStyle(
//                             fontSize: 16,
//                             color: Color.fromARGB(255, 90, 89, 89),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         TextButton(
//                           onPressed: () {
//                             ref
//                                 .read(productStateProvider.notifier)
//                                 .removefromcartlist(product);
//                           },
//                           child: Text('remove'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       // IconButton(
//                       //   icon: const Icon(Icons.delete, color: Colors.red),
//                       //   onPressed: () {
//                       //     ref
//                       //         .read(productStateProvider.notifier)
//                       //         .removefromcartlist(product);
//                       //   },
//                       // ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           // Decrease button
//                           SizedBox(
//                             width: 36,
//                             height: 36,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 ref
//                                     .read(cartStateProvider.notifier)
//                                     .decreaseQuantity(product);
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.grey.shade300,
//                                 shape: const CircleBorder(),
//                                 padding: EdgeInsets.zero,
//                                 elevation: 0,
//                               ),
//                               child: const Icon(
//                                 Icons.remove,
//                                 size: 18,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),

//                           // Quantity text
//                           Text(
//                             "${product.quantity}",
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(width: 12),

//                           // Increase button
//                           SizedBox(
//                             width: 36,
//                             height: 36,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 ref
//                                     .read(cartStateProvider.notifier)
//                                     .increaseQuantity(product);
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.grey.shade300,
//                                 shape: const CircleBorder(),
//                                 padding: EdgeInsets.zero,
//                                 elevation: 0,
//                               ),
//                               child: const Icon(
//                                 Icons.add,
//                                 size: 18,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Emptycart.jpg'),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Cart is empty",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
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
          const SizedBox(height: 10),
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
                    Color(0xFF4C53A5),
                  ],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Explore products',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onTap: () => context.go("${RouteKey.home}?index=0"),
          ),
        ],
      ),
    );
  }
}
