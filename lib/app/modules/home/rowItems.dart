// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_appwrite/app/modules/sale_product/provider.dart';

import 'items/ItemDetail/detail.dart';

class RowItems extends ConsumerWidget {
  const RowItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.watch(productStateProvider);
    return 
    Container(
      height: 110,
      color: const Color(0xFF4C53A5).withOpacity(0.3),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: snapshot
          .map(
            (product) =>     Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(product.documentId)));
              },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 33,
                        backgroundColor: const Color(0xFF4C53A5),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage("https://cloud.appwrite.io/v1/storage/buckets/647d9eb631c5a428748a/files/${product.image}/view?project=6474e356cea4864218e8&mode=admin"),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4C53A5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          )
          .toList(),
    ),
            // for (int i = 1; i < 15; i++)
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   child: GestureDetector(
              //     onTap: () {
              //       logger.d("tapping");
              //     },
              //     child: Column(
              //       children: [
              //         CircleAvatar(
              //           radius: 33,
              //           backgroundColor: Color(0xFF4C53A5),
              //           child: CircleAvatar(
              //             radius: 30,
              //             backgroundImage:
              //                 AssetImage("assets/images/Person.jpg"),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 8,
              //         ),
              //         Text(
              //           "Sandal",
              //           style: TextStyle(
              //             fontSize: 14,
              //             color: Color(0xFF4C53A5),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
      ),
    );
  }
}
