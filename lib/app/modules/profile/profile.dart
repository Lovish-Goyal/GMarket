// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_appwrite/app/modules/auth/provider.dart';
import 'package:learn_appwrite/app/router.dart';

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
                  child: Container(
                    height: 180,
                    color: const Color(0xFF4C53A5),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://cloud.appwrite.io/v1/storage/buckets/6478beb17488d9d997b1/files/${user.image}/view?project=6474e356cea4864218e8&mode=admin"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Text(user.fullName),
            ),
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Text(user.email),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => context.push('/editprofile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C53A5),
                  minimumSize: const Size(88, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                child: const Text('Edit Profile')),
            const SizedBox(
              height: 10,
            ),
            ProfileList(
              icon: Icons.notifications,
              text: 'Notifications',
              onTap: () => context.push('/notifications'),
              width: 168,
            ),
            ProfileList(
              icon: Icons.list_alt,
              text: 'My Order',
              onTap: () => context.push('/order'),
              width: 195,
            ),
            ProfileList(
              icon: Icons.favorite_border,
              text: 'Wishlist',
              onTap: () => context.push('/wishlist'),
              width: 201,
            ),
            ProfileList(
              icon: Icons.shopping_cart,
              text: 'My Shopping Cart',
              onTap: () => context.push('/cart'),
              width: 133,
            ),
            ProfileList(
              icon: Icons.sailing,
              text: 'Sale Product',
              onTap: () => context.push('/sale'),
              width: 165,
            ),
            ProfileList(
              icon: Icons.logout,
              text: 'Sign Out',
              onTap: () => context.go('/signupPage'),
              width: 198,
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
  final double width;
  const ProfileList(
      {super.key,
      required this.icon,
      required this.text,
      required this.onTap,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFF4C53A5),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      size: 26,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: width,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 22,
                      color: Colors.white,
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
