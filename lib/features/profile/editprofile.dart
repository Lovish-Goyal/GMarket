import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gmarket/app/modules/auth/user_model/user_model.dart';
import '../../app/modules/auth/provider.dart';
import 'profile.dart';
import 'providers/provider.dart';

class EditPage extends ConsumerStatefulWidget {
  final UserModel user;
  const EditPage({super.key, required this.user});

  @override
  ConsumerState<EditPage> createState() => _EditPageState();
}

class _EditPageState extends ConsumerState<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final user = ref.read(userStateProvider);

    nameController = TextEditingController(text: user?.fullName ?? '');
    emailController = TextEditingController(text: user?.email ?? '');
    phoneController = TextEditingController(text: user?.phone ?? '');
    addressController = TextEditingController(text: user?.address ?? '');
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStateProvider);
    final isUploading = ref.watch(profileNotifierProvider);

    if (user == null) {
      return const Scaffold(body: Center(child: Text("User not found")));
    }

    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              height: 280,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: CustomShape(),
                    child: Container(
                      height: 250,
                      color: const Color(0xFF4C53A5),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 8,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(
                          'https://cloud.appwrite.io/v1/storage/buckets/6478beb17488d9d997b1/files/${user.image}/view?project=6474e356cea4864218e8&mode=admin',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C53A5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => ref
                    .read(profileNotifierProvider.notifier)
                    .updateProfilePicture(user, ref),
                child: isUploading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "CHANGE PICTURE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
              ),
            ),

            SizedBox(height: 20),

            // Form Fields
            EditProfileField(
              controller: nameController,
              label: 'Name',
              icon: Icons.person,
            ),
            const SizedBox(height: 8),
            EditProfileField(
              controller: emailController,
              label: 'Email',
              icon: Icons.mail,
            ),
            const SizedBox(height: 8),
            EditProfileField(
              controller: phoneController,
              label: 'Phone',
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 8),
            EditProfileField(
              controller: addressController,
              label: 'Address',
              icon: Icons.place,
            ),

            const SizedBox(height: 8),

            // Update Button
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C53A5),
                ),
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    final updatedUser = user.copyWith(
                      fullName: nameController.text.trim(),
                      email: emailController.text.trim(),
                      phone: phoneController.text.trim(),
                      address: addressController.text.trim(),
                    );
                    ref
                        .read(userStateProvider.notifier)
                        .updateUserDetails(updatedUser);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile updated')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "UPDATE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;

  const EditProfileField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (val) =>
            val == null || val.isEmpty ? 'Enter a valid $label' : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xFF4C53A5)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xFF4C53A5)),
            borderRadius: BorderRadius.circular(50.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xFF4C53A5)),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}
