import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../data/env.dart';
import '../../../utils/apiclient.dart';
import '../auth/provider.dart';
import '../sale_product/product_model/product_model.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
class WishState extends _$WishState {
  @override
  List<ProductModel> build() => [];

  // void setlist(List<ProductModel> list) => state = list;
  set setlist(List<ProductModel> list) => state = list;

  void addto(ProductModel product) {
    if (state.contains(product)) {
      return;
    }
    state = [...state, product];
    showSuccessNotice("Success", "Add to wishlist");
  }

  void removefrom(ProductModel product) {
    if (state.contains(product)) {
      state = [...state]..remove(product);
      showInfoNotice("Success", "Remove from wishlist");
    }
  }
}

@riverpod
FutureOr<List<ProductModel>> wishListProducts(Ref ref) async {
  final user = ref.read(userStateProvider);
  if (user == null) {
    return [];
  }
  try {
    final List<ProductModel> wishListResponse = [];
    for (String documentId in user.wishlist) {
      final response = await ApiClient.database.getDocument(
        databaseId: Env.mainDatabaseId,
        collectionId: "6480b48f7aa4d3133a66",
        documentId: documentId,
      );
      wishListResponse.add(ProductModel.fromJson(response.data));
    }
    return wishListResponse;
  } catch (e) {
    logger.e(e);
  }
  return [];
}
