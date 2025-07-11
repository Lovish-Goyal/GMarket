// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:gmarket/features/wishlist/providers/provider.dart';
// import '../sale_product/provider.dart';

// class MyOrder extends ConsumerWidget {
//   const MyOrder({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final snapshot = ref.watch(wishStateProvider);
//     // if (snapshot.isEmpty) {
//     //   return const EmptyMyOrder();
//     // }
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF4C53A5),
//         centerTitle: true,
//         title: const Text("My Wishlist"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: GridView.count(
//           childAspectRatio: 4.0,
//           physics: const NeverScrollableScrollPhysics(),
//           crossAxisCount: 1,
//           shrinkWrap: true,
//           children: snapshot
//               .map(
//                 (product) => InkWell(
//                   onTap: () {},
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: const Color(0xFF4C53A5),
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.all(10),
//                           child: Image.network(
//                             "https://cloud.appwrite.io/v1/storage/buckets/647d9eb631c5a428748a/files/${product.image}/view?project=6474e356cea4864218e8&mode=admin",
//                           ),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.all(10),
//                           child: Column(
//                             children: [
//                               const SizedBox(height: 12),
//                               Text(product.name),
//                               const SizedBox(height: 12),
//                               Text(product.price.toString()),
//                               const SizedBox(height: 12),
//                               Text(product.quantity.toString()),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 150),
//                         IconButton(
//                           onPressed: () {
//                             ref
//                                 .read(productStateProvider.notifier)
//                                 .removefromwishlist(product);
//                           },
//                           icon: const Icon(FontAwesomeIcons.dumpster),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//               .toList(),
//         ),
//       ),
//     );
//   }
// }

// class EmptyMyOrder extends StatelessWidget {
//   const EmptyMyOrder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 100),
//             child: Image.asset('assets/images/EmptyOrder.jpg'),
//           ),
//           const Center(
//             child: Text(
//               "No Order yet",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(height: 30),
//           const Text(
//             "Looks like you haven`t placed",
//             style: TextStyle(color: Colors.grey, fontSize: 20),
//           ),
//           const SizedBox(height: 5),
//           const Text(
//             "any order yet",
//             style: TextStyle(color: Colors.grey, fontSize: 20),
//           ),
//         ],
//       ),
//     );
//   }
// }
