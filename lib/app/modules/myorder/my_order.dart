import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gmarket/app/router.dart';
import 'package:go_router/go_router.dart';

// You'll need to create these providers similar to your wishlist providers
// final ordersListProvider = StateNotifierProvider<OrdersNotifier, List<Order>>((ref) => OrdersNotifier());
// final ordersStateProvider = StateProvider<List<Order>>((ref) => []);

final ordersSearchProvider = StateProvider<String>((ref) => '');

class MyOrders extends ConsumerWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Replace with your actual orders provider
    // ref.watch(ordersListProvider);
    // final allOrders = ref.watch(ordersStateProvider);

    // Mock data for demonstration - replace with your actual orders
    final allOrders = <Order>[];
    final query = ref.watch(ordersSearchProvider);

    final filteredOrders = allOrders.where((order) {
      return order.orderNumber.toLowerCase().contains(query.toLowerCase()) ||
          order.items.any(
            (item) => item.name.toLowerCase().contains(query.toLowerCase()),
          );
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        title: const Text(
          "My Orders",
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
      body: allOrders.isEmpty
          ? const EmptyOrders()
          : Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // 🔍 Search Bar
                  TextField(
                    onChanged: (value) {
                      ref.read(ordersSearchProvider.notifier).state = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Search orders...",
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

                  // 📦 Orders List
                  Expanded(
                    child: filteredOrders.isEmpty
                        ? const Center(
                            child: Text(
                              "No orders found.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          )
                        : ListView.separated(
                            itemCount: filteredOrders.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final order = filteredOrders[index];
                              return OrderCard(
                                order: order,
                                onTap: () {
                                  // Navigate to order details
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDetailsScreen(order.id),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onTap;

  const OrderCard({super.key, required this.order, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE5E7EB), width: 1),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order #${order.orderNumber}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(order.status),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      order.status,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Order Date and Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.date,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  Text(
                    "\$${order.total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Order Items Preview
              Row(
                children: [
                  // First item image
                  if (order.items.isNotEmpty)
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFF3F4F6),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          order.items.first.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.image_not_supported,
                                color: Color(0xFF9CA3AF),
                              ),
                        ),
                      ),
                    ),
                  const SizedBox(width: 12),

                  // Items text
                  Expanded(
                    child: Text(
                      order.items.length == 1
                          ? order.items.first.name
                          : "${order.items.first.name} and ${order.items.length - 1} more item${order.items.length > 2 ? 's' : ''}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF374151),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Arrow icon
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color(0xFF9CA3AF),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return const Color(0xFF10B981);
      case 'shipped':
        return const Color(0xFF3B82F6);
      case 'processing':
        return const Color(0xFFF59E0B);
      case 'cancelled':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFF6B7280);
    }
  }
}

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({super.key});

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
                  Icons.shopping_bag_outlined,
                  size: 64,
                  color: Color(0xFF9CA3AF),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "No Orders Yet",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "You haven't placed any orders yet.",
                style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
              ),
              const Text(
                "Start shopping to see your orders here.",
                style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  context.push('${RouteKey.home}?index=0');
                },
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
                  "Start Shopping",
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

// Model classes - you'll need to create these based on your data structure
class Order {
  final String id;
  final String orderNumber;
  final String date;
  final String status;
  final double total;
  final List<OrderItem> items;

  Order({
    required this.id,
    required this.orderNumber,
    required this.date,
    required this.status,
    required this.total,
    required this.items,
  });
}

class OrderItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

// Placeholder for OrderDetailsScreen - you'll need to implement this
class OrderDetailsScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailsScreen(this.orderId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Details")),
      body: const Center(child: Text("Order Details Screen")),
    );
  }
}
