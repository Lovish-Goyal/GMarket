import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../app/modules/auth/provider.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStateProvider);
    if (user == null) {
      context.go(RouteKey.home);
      return const SizedBox.shrink();
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomShape(),
                  child: Container(height: 200, color: const Color(0xFF4C53A5)),
                ),
                Positioned(
                  left: 30,
                  top: 50,
                  child: const Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 40,
                  child: IconButton(
                    onPressed: () {
                      context.go('/editprofile');
                    },
                    icon: Icon(Icons.edit, size: 20, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: CircleAvatar(
                      radius: 90,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                          "https://cloud.appwrite.io/v1/storage/buckets/6478beb17488d9d997b1/files/${user.image}/view?project=6474e356cea4864218e8&mode=admin",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Center(
              child: Text(
                user.fullName,
                style: TextStyle(
                  color: const Color.fromARGB(255, 122, 121, 121),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Center(
              child: Text(
                user.email,
                style: TextStyle(
                  color: const Color.fromARGB(255, 126, 125, 125),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),
            ProfileList(
              icon: Icons.notifications,
              text: 'Notifications',
              onTap: () => context.push('/notifications'),
            ),
            ProfileList(
              icon: Icons.list_alt,
              text: 'My Order',
              onTap: () => context.push('/order'),
            ),
            ProfileList(
              icon: Icons.favorite_border,
              text: 'Wishlist',
              onTap: () => context.push('/wishlist'),
            ),
            ProfileList(
              icon: Icons.shopping_cart,
              text: 'My Shopping Cart',
              onTap: () => context.push('/cart'),
            ),
            ProfileList(
              icon: Icons.sailing,
              text: 'Sale Product',
              onTap: () => context.push('/sale'),
            ),
            ProfileList(
              icon: Icons.logout,
              text: 'Sign Out',
              onTap: () => context.go('/signupPage'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class ProfileList extends StatelessWidget {
  final IconData icon;
  final String text;
  final onTap;
  const ProfileList({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF4C53A5),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Icon(icon, size: 26, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 22,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
