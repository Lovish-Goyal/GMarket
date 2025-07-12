import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gmarket/app/modules/sale_product/provider.dart';
import '../products/widgets/product_details_view.dart';
import '../products/widgets/products_listview.dart';
import 'providers/provider.dart';

final wishlistSearchProvider = StateProvider<String>((ref) => '');

class Wishlist extends ConsumerWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(wishListproductListProvider);
    final allProducts = ref.watch(wishStateProvider);
    final query = ref.watch(wishlistSearchProvider);

    final filteredProducts = allProducts.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        title: const Text(
          "My Wishlist",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6B7280)),
        ),
      ),
      body: allProducts.isEmpty
          ? const EmptyWish()
          : Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // 🔍 Search Bar
                  TextField(
                    onChanged: (value) {
                      ref.read(wishlistSearchProvider.notifier).state = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Search in wishlist...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 📦 Wishlist Grid
                  Expanded(
                    child: filteredProducts.isEmpty
                        ? const Center(
                            child: Text(
                              "No products found.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          )
                        : GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 0.58,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            children: filteredProducts.map((product) {
                              final imageUrl =
                                  "https://cloud.appwrite.io/v1/storage/buckets/647d9eb631c5a428748a/files/${product.image}/view?project=6474e356cea4864218e8&mode=admin";

                              return ItemList(
                                image: imageUrl,
                                productTitle: product.name,
                                prize: product.price,
                                rating: product.rating,
                                quantity: product.quantity,
                                hasnavigation: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                            product.documentId,
                                          ),
                                    ),
                                  );
                                },
                                wishiconpressed: () {
                                  ref
                                      .read(productStateProvider.notifier)
                                      .removefromwishlist(product);
                                },
                                isFav: product.isFav,
                              );
                            }).toList(),
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}

class EmptyWish extends StatelessWidget {
  const EmptyWish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(32),
                decoration: const BoxDecoration(
                  color: Color(0xFFE5E7EB),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  size: 64,
                  color: Color(0xFF9CA3AF),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Your Wishlist is Empty",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Add items you love to your wishlist.",
                style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
              ),
              const Text(
                "You can review or buy them later.",
                style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.shopping_cart_outlined),
                label: const Text(
                  "Continue Shopping",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
