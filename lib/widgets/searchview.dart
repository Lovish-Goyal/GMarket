import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_appwrite/app/modules/home/items/ItemDetail/detail.dart';
import 'package:learn_appwrite/app/modules/sale_product/View/sale_product.dart';
import 'package:learn_appwrite/app/modules/sale_product/provider.dart';

import '../app/modules/sale_product/product_model/product_model.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: FormBuilderTypeAhead<ProductModel?>(
          name: "Search...",
          decoration: const InputDecoration(
            labelText: "Search",
            hintText: "Enter item name ",
            border: OutlineInputBorder(),
          ),
          itemBuilder: (context, item) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: (item?.image != null)
                    ? NetworkImage(item!.image.toAppWriteUrl)
                    : null,
              ),
              title: Text("${item?.name}"),
              subtitle: Text(item?.price.toString() ?? ""),
            );
          },
          onSuggestionSelected: (suggestion) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Details(suggestion!.productId,)));
          },
          suggestionsCallback: (pattern) async {
            final snapshot =
                await ref.watch(productSearchProvider(pattern).future);
            return snapshot ?? [];
          },
          selectionToTextTransformer: (suggestion) => suggestion?.name ?? "",
        ),
      ),
    );
  }
}
