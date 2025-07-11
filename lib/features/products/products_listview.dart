import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/modules/sale_product/provider.dart';
import 'product_details/product_details_view.dart';

class ProductsListView extends ConsumerWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.read(productStateProvider);

    if (snapshot.isEmpty) {
      return Column(
        children: const [
          Icon(Icons.inventory_2_outlined, size: 64, color: Color(0xFF9CA3AF)),
          SizedBox(height: 16),
          Text(
            "No products available",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Check back later for new arrivals",
            style: TextStyle(fontSize: 14, color: Color(0xFF9CA3AF)),
          ),
        ],
      );
    }

    return GridView.count(
      childAspectRatio: 0.58,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: snapshot.map((product) {
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
                builder: (context) => ProductDetailsScreen(product.documentId),
              ),
            );
          },
          wishiconpressed: () {
            final notifier = ref.read(productStateProvider.notifier);
            product.isFav
                ? notifier.removefromwishlist(product)
                : notifier.addtowishlist(product);
          },
          isFav: product.isFav,
        );
      }).toList(),
    );
  }
}

class ItemList extends StatelessWidget {
  final bool isFav;
  final String image;
  final String productTitle;
  final int prize;
  final double rating;
  final int quantity;
  final void Function()? hasnavigation;
  final void Function()? wishiconpressed;

  const ItemList({
    super.key,
    required this.image,
    required this.productTitle,
    required this.prize,
    required this.rating,
    required this.quantity,
    required this.hasnavigation,
    required this.wishiconpressed,
    this.isFav = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: hasnavigation,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Container(
              height: 160,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF6366F1),
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        color: Color(0xFF9CA3AF),
                        size: 32,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Product Details Section
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productTitle.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 112, 112, 112),
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      if (rating >= index + 1) {
                        return const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18,
                        );
                      } else if (rating > index && rating < index + 1) {
                        return const Icon(
                          Icons.star_half,
                          color: Colors.yellow,
                          size: 18,
                        );
                      } else {
                        return const Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                          size: 18,
                        );
                      }
                    }),
                  ),
                  Text(
                    quantity > 5
                        ? 'Available'
                        : quantity > 0
                        ? 'Only $quantity in stock'
                        : 'Not available',
                    style: TextStyle(
                      color: quantity == 0
                          ? Colors.red
                          : const Color(0xFF059669),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "₹$prize",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 34, 34, 34),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: wishiconpressed,
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav
                              ? const Color(0xFFEF4444)
                              : const Color(0xFF6B7280),
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
