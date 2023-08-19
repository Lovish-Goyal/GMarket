import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../data/env.dart';
import '../../../utils/apiclient.dart';
import '../sale_product/product_model/product_model.dart';
import 'cart_model/cart_model.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
class CartState extends _$CartState {
  @override
  List<ProductModel> build() => [];

  // void setlist(List<ProductModel> list) => state = list;
  set setlist(List<ProductModel> list) => state = list;

  void addto(ProductModel product) {
    if (state.contains(product)) {
      return;
    }
    state = [...state, product];
    showSuccessNotice("Success", "Added To Cart");
  }

  void removefrom(ProductModel product) {
    if (state.contains(product)) {
      state = [...state]..remove(product);
      showInfoNotice("Success", "Remove from cart");
    }
  }
}

// @Riverpod(keepAlive: true)
// class CartState extends _$CartState {
//   @override
//   CartModel? build() => null;

//   Future<String> Cart({
//     required CartModel product,
//   }) async {
//     try {
//       await ApiClient.database.createDocument(
//         databaseId: Env.mainDatabaseId,
//         collectionId: "648eb4125c12f33cb976",
//         documentId: product.productId.toString(),
//         data: product.toJson(),
//       );
//       return "";
//     } on AppwriteException catch (e) {
//       logger.e(e);
//       return e.message ?? "Error Occurred";
//     } catch (error) {
//       logger.e(error);
//       return "$error";
//     }
//   }

//   Future<String> RemoveCart({
//     required CartModel product,
//   }) async {
//     try {
//       await ApiClient.database.deleteDocument(
//         databaseId: Env.mainDatabaseId,
//         collectionId: "648eb4125c12f33cb976",
//         documentId: product.productId.toString(),
//       );
//       return "";
//     } on AppwriteException catch (e) {
//       logger.e(e);
//       return e.message ?? "Error Occurred";
//     } catch (error) {
//       logger.e(error);
//       return "$error";
//     }
//   }
// }

@Riverpod(keepAlive: true)
FutureOr<List<CartModel>> cartproductList(Ref ref) async {
  try {
    final response = await ApiClient.database.listDocuments(
      databaseId: Env.mainDatabaseId,
      collectionId: "648eb4125c12f33cb976",
    );

    return response.documents.map((e) => CartModel.fromJson(e.data)).toList();
  } catch (e) {
    logger.e(e);
  }
  return [];
}

// @riverpod
// FutureOr<ProductModel?> product(Ref ref, String documentId) async {
//   try {
//     final response = await ApiClient.database.getDocument(
//       databaseId: Env.mainDatabaseId,
//       collectionId: "6480b48f7aa4d3133a66",
//       documentId: documentId,
//     );
//     return ProductModel.fromJson(response.data);
//   } catch (e) {
//     logger.e(e);
//   }
//   return null;
// }
