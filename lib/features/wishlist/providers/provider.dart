import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils_widget/utils_widget.dart';
import '../../../data/env.dart';
import '../../../utils/apiclient.dart';
import '../../../models/product_model/product_model.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
class WishState extends _$WishState {
  @override
  List<ProductModel> build() => [];

  set setlist(List<ProductModel> list) => state = list;

  void addto(ProductModel product) {
    final exists = state.any((p) => p.productId == product.productId);
    if (exists) return;

    final updated = product.copyWith(isFav: true);
    state = [...state, updated];

    showSuccessNotice(
      leading: const Icon(Icons.favorite),
      "Success",
      "Added to wishlist",
    );
  }

  void removefrom(ProductModel product) {
    final exists = state.any((p) => p.productId == product.productId);
    if (!exists) return;

    state = state.where((p) => p.productId != product.productId).toList();

    showInfoNotice(
      leading: const Icon(Icons.favorite_border),
      "Success",
      "Removed from wishlist",
    );
  }
}

@Riverpod(keepAlive: true)
Future<List<ProductModel>> wishListproductList(Ref ref) async {
  try {
    final response = await ApiClient.database.listDocuments(
      databaseId: Env.mainDatabaseId,
      collectionId: "649471947b5b3b25730f",
    );

    logger.f(response);

    final data = response.documents
        .map((e) => ProductModel.fromJson(e.data))
        .toList();

    logger.f(data);

    // Set to local sync state
    Future.microtask(() {
      ref.read(wishStateProvider.notifier).setlist = data;
    });

    return data;
  } catch (e) {
    logger.e(e);
    return [];
  }
}
