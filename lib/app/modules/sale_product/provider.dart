import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_appwrite/app/modules/cart/provider.dart';
import 'package:learn_appwrite/app/modules/wishlist/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../../../data/env.dart';
import '../../../../../utils/apiclient.dart';
import 'product_model/product_model.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
class ProductState extends _$ProductState {
  @override
  List<ProductModel> build() => [];

  // void setlist(List<ProductModel> list) => state = list;
  set setlist(List<ProductModel> list) => state = list;

  void addtowishlist(ProductModel product) {
    final list = state.map((e) {
      if (e.productId == product.productId) {
        e.isFav = true;
      }
      return e;
    }).toList();
    state = list;
    ref.read(wishStateProvider.notifier).addto(product);
    // state.where((element) => element.productId == productId).toList();
  }

  void removefromwishlist(ProductModel product) {
    final list = state.map((e) {
      if (e.productId == product.productId) {
        e.isFav = false;
      }
      return e;
    }).toList();
    state = list;
    ref.read(wishStateProvider.notifier).removefrom(product);
    // state.where((element) => element.productId == productId).toList();
  }


void addtocartlist(ProductModel product) {
    final list = state.map((e) {
      if (e.productId == product.productId) {
        e.inCart = true;
      }
      return e;
    }).toList();
    state = list;
    ref.read(cartStateProvider.notifier).addto(product);
    // state.where((element) => element.productId == productId).toList();
  }

void removefromcartlist(ProductModel product) {
    final list = state.map((e) {
      if (e.productId == product.productId) {
        e.inCart = false;
      }
      return e;
    }).toList();
    state = list;
    ref.read(cartStateProvider.notifier).removefrom(product);
    // state.where((element) => element.productId == productId).toList();
  }

  Future<String> saleproduct({
    required ProductModel product,
  }) async {
    try {
      if (product.image.isNotEmpty) {
        final bytes = await XFile(product.image).readAsBytes();
        product.image = await productimageUpload(bytes, product);
      }
      await ApiClient.database.createDocument(
        databaseId: Env.mainDatabaseId,
        collectionId: "6480b48f7aa4d3133a66",
        documentId: product.productId.toString(),
        data: product.toJson(),
      );

      // await ApiClient.functions.createExecution(
      //   functionId: "Env.permissionFunctionId",
      //   data: jsonEncode({
      //     "databaseId": Env.mainDatabaseId,
      //     "collectionId": Env.userCollectionId,
      //     "documentId": product.productId,
      //     "permissions": product.permissions,
      //   }),
      // );

      //  HapticFeedback.lightImpact();
      return "";
    } on AppwriteException catch (e) {
      logger.e(e);
      return e.message ?? "Error Occurred";
    } catch (error) {
      logger.e(error);
      return "$error";
    }
  }

  Future<String> productimageUpload(
      Uint8List? image, ProductModel product) async {
    try {
      final response = await ApiClient.storage.createFile(
        bucketId: '647d9eb631c5a428748a',
        fileId: ID.unique(),
        file: InputFile.fromBytes(
          bytes: image?.toList() ?? [],
          filename:
              "${product.name.toString().replaceAllMapped(" ", (match) => "_")}_displayProduct.jpeg",
        ),
      );
      // product.image = result.$id;
      // await ApiClient.account.updatePrefs(
      //   prefs: product.toJson(),
      // );
      // await ref.read(productStateProvider.notifier).getCurrentUser();
      return response.$id;
    } catch (e) {
      logger.e(e);
    }
    return "";
  }
}

@Riverpod(keepAlive: true)
FutureOr<List<ProductModel>> productList(Ref ref) async {
  try {
    final response = await ApiClient.database.listDocuments(
      databaseId: Env.mainDatabaseId,
      collectionId: "6480b48f7aa4d3133a66",
    );

    final data =
        response.documents.map((e) => ProductModel.fromJson(e.data)).toList();
    ref.read(productStateProvider.notifier).setlist = data;

    return data;
  } catch (e) {
    logger.e(e);
  }
  return [];
}

@riverpod
FutureOr<ProductModel?> product(Ref ref, String documentId) async {
  try {
    final response = await ApiClient.database.getDocument(
      databaseId: Env.mainDatabaseId,
      collectionId: "6480b48f7aa4d3133a66",
      documentId: documentId,
    );
    return ProductModel.fromJson(response.data);
  } catch (e) {
    logger.e(e);
  }
  return null;
}

@riverpod
FutureOr<List<ProductModel>?> productSearch(Ref ref, String query) async {
 // print("query: $query");
  try {
    final response = await ApiClient.database.listDocuments(
        databaseId: Env.mainDatabaseId,
        collectionId: "6480b48f7aa4d3133a66",
        queries: [
          Query.search("name", query),
        ]);
   // print(response.toMap());
    return response.documents
        .map((e) => ProductModel.fromJson(e.data))
        .toList();
  } catch (e) {
    logger.e(e);
  }
  return null;
}
