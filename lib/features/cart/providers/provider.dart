// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:utils_widget/utils_widget.dart';

// import '../../../data/env.dart';
// import '../../../utils/apiclient.dart';
// import '../../../models/product_model/product_model.dart';
// import '../../../models/cart_model/cart_model.dart';

// part 'provider.g.dart';

// @Riverpod(keepAlive: true)
// class CartState extends _$CartState {
//   @override
//   List<ProductModel> build() => [];

//   set setlist(List<ProductModel> list) => state = list;

//   void addto(ProductModel product) {
//     if (state.contains(product)) {
//       return;
//     }
//     state = [...state, product];
//     showSuccessNotice("Success", "Added To Cart");
//   }

//   void removefrom(ProductModel product) {
//     if (state.contains(product)) {
//       state = [...state]..remove(product);
//       showInfoNotice("Success", "Remove from cart");
//     }
//   }

//   void increaseQuantity(ProductModel product) {
//     final index = state.indexWhere(
//       (item) => item.productId == product.productId,
//     );

//     if (index != -1) {
//       final currentProduct = state[index];
//       final updatedProduct = currentProduct.copyWith(
//         quantity: currentProduct.quantity + 1,
//       );

//       state = [
//         for (int i = 0; i < state.length; i++)
//           if (i == index) updatedProduct else state[i],
//       ];
//     }
//   }

//   void decreaseQuantity(ProductModel product) {
//     final index = state.indexWhere(
//       (item) => item.productId == product.productId,
//     );
//     if (index != -1 && state[index].quantity > 1) {
//       final updatedProduct = product.copyWith(
//         quantity: state[index].quantity - 1,
//       );
//       state = [
//         for (int i = 0; i < state.length; i++)
//           if (i == index) updatedProduct else state[i],
//       ];
//     } else {
//       // Optional: remove item if quantity becomes 0
//       removefrom(product);
//     }
//   }
// }

// @Riverpod(keepAlive: true)
// FutureOr<List<CartModel>> cartproductList(Ref ref) async {
//   try {
//     final response = await ApiClient.database.listDocuments(
//       databaseId: Env.mainDatabaseId,
//       collectionId: "648eb4125c12f33cb976",
//     );

//     return response.documents.map((e) => CartModel.fromJson(e.data)).toList();
//   } catch (e) {
//     logger.e(e);
//   }
//   return [];
// }

// // @riverpod
// // FutureOr<ProductModel?> product(Ref ref, String documentId) async {
// //   try {
// //     final response = await ApiClient.database.getDocument(
// //       databaseId: Env.mainDatabaseId,
// //       collectionId: "6480b48f7aa4d3133a66",
// //       documentId: documentId,
// //     );
// //     return ProductModel.fromJson(response.data);
// //   } catch (e) {
// //     logger.e(e);
// //   }
// //   return null;
// // }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../data/env.dart';
import '../../../utils/apiclient.dart';
import '../../../models/product_model/product_model.dart';
import '../../../models/cart_model/cart_model.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
class CartState extends _$CartState {
  @override
  Future<List<ProductModel>> build() async {
    try {
      final response = await ApiClient.database.listDocuments(
        databaseId: Env.mainDatabaseId,
        collectionId: "648eb4125c12f33cb976",
      );
      return response.documents
          .map((e) => CartModel.fromJson(e.data).toProductModel())
          .toList();
    } catch (e) {
      logger.e(e);
      return [];
    }
  }

  void addto(ProductModel product) {
    final currentState = state;
    if (currentState is AsyncData<List<ProductModel>>) {
      final currentList = currentState.value;
      if (currentList.contains(product)) return;
      state = AsyncData([...currentList, product]);
      showSuccessNotice("Success", "Added To Cart");
    }
  }

  void removefrom(ProductModel product) {
    final currentState = state;
    if (currentState is AsyncData<List<ProductModel>>) {
      final currentList = currentState.value;
      if (!currentList.contains(product)) return;
      final updatedList = [...currentList]..remove(product);
      state = AsyncData(updatedList);
      showInfoNotice("Success", "Removed from cart");
    }
  }

  void increaseQuantity(ProductModel product) {
    final currentState = state;
    if (currentState is AsyncData<List<ProductModel>>) {
      final currentList = currentState.value;
      final index = currentList.indexWhere(
        (item) => item.productId == product.productId,
      );
      if (index != -1) {
        final updatedProduct = currentList[index].copyWith(
          quantity: currentList[index].quantity + 1,
        );
        final updatedList = [
          for (int i = 0; i < currentList.length; i++)
            if (i == index) updatedProduct else currentList[i],
        ];
        state = AsyncData(updatedList);
      }
    }
  }

  void decreaseQuantity(ProductModel product) {
    final currentState = state;
    if (currentState is AsyncData<List<ProductModel>>) {
      final currentList = currentState.value;
      final index = currentList.indexWhere(
        (item) => item.productId == product.productId,
      );
      if (index != -1) {
        if (currentList[index].quantity > 1) {
          final updatedProduct = currentList[index].copyWith(
            quantity: currentList[index].quantity - 1,
          );
          final updatedList = [
            for (int i = 0; i < currentList.length; i++)
              if (i == index) updatedProduct else currentList[i],
          ];
          state = AsyncData(updatedList);
        } else {
          // remove item if quantity becomes 0
          final updatedList = [...currentList]..removeAt(index);
          state = AsyncData(updatedList);
        }
      }
    }
  }
}

extension CartModelExtension on CartModel {
  ProductModel toProductModel() {
    return ProductModel(
      productId: this.productId,
      name: this.name,
      price: this.price,
      quantity: this.quantity,
      // map other fields if any
    );
  }
}

@Riverpod(keepAlive: true)
Future<List<CartModel>> cartproductList(Ref ref) async {
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
