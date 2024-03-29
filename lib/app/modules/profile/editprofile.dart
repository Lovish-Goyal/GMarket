// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_appwrite/app/modules/auth/provider.dart';
import 'profile.dart';
import 'provider.dart';

class EditPage extends ConsumerStatefulWidget {
  const EditPage({super.key});

  @override
  ConsumerState<EditPage> createState() => _EditPageState();
}

class _EditPageState extends ConsumerState<EditPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pinCode = TextEditingController();

  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStateProvider);
    final isUploading = ref.watch(profileNotifierProvider);
    name.text = user?.fullName ?? "";
    return Form(
      key: fromKey,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                    height: 250,
                    color: const Color(0xFF4C53A5),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Center(
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Center(
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            'https://cloud.appwrite.io/v1/storage/buckets/6478beb17488d9d997b1/files/${user?.image}/view?project=6474e356cea4864218e8&mode=admin',
                          )),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  margin: const EdgeInsets.only(top: 165, left: 270),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2)),
                  child: isUploading
                      ? const CircularProgressIndicator()
                      : IconButton(
                          color: const Color(0xFF4C53A5),
                          icon: const Icon(FontAwesomeIcons.pencil),
                          onPressed: () => ref
                              .read(profileNotifierProvider.notifier)
                              .updateProfilePicture(user!, ref),
                          // async {
                          //   final ImagePicker picker = ImagePicker();
                          //   final response =
                          //       await picker.pickImage(source: ImageSource.gallery);
                          //   if (response == null) {
                          //     return;
                          //   }
                          //   final bytes = await response.readAsBytes();
                          //   final file = await ApiClient.storage.createFile(
                          //     bucketId: '6478beb17488d9d997b1',
                          //     fileId: ID.unique(),
                          //     file: InputFile.fromBytes(
                          //       bytes: bytes,
                          //       filename: response.name.isNotEmpty
                          //           ? response.name
                          //           : 'image.jpg',
                          //     ),
                          //   );
                          //   print(file.toMap());
                          // },
                        ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  EditProfileList(
                    initialvalue: user!.fullName,
                    text: 'Name',
                    icon: Icons.person_outlined,
                    controller: name,
                    onsaved: (newValue) => user.fullName = newValue,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  EditProfileList(
                    initialvalue: user.email,
                    text: 'Email',
                    icon: Icons.mail,
                    controller: email,
                    onsaved: (newValue) => user.email = newValue,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  EditProfileList(
                    initialvalue: user.phone,
                    text: 'Phone',
                    icon: Icons.phone,
                    controller: phone,
                    keyboardtype: TextInputType.number,
                    onsaved: (newValue) => user.phone = newValue,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  EditProfileList(
                    initialvalue: user.address,
                    text: 'Address',
                    icon: Icons.place,
                    controller: city,
                    onsaved: (newValue) => user.address = newValue,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 35,
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4C53A5),
                        ),
                        onPressed: () {
                          fromKey.currentState?.save();
                          ref.read(userStateProvider.notifier).updateUserName(
                                user.fullName,
                              );
                        },
                        child: const Text("Update")),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileList extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextEditingController controller;
  final keyboardtype;
  final onsaved;
  final initialvalue;
  const EditProfileList({
    super.key,
    required this.text,
    required this.icon,
    required this.controller,
    this.keyboardtype,
    required this.onsaved,
    this.initialvalue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: TextFormField(
        keyboardType: keyboardtype,
        // controller: controller,
        initialValue: initialvalue,
        onSaved: onsaved,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(color: Color(0xFF4C53A5)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Color(0xFF4C53A5)),
            borderRadius: BorderRadius.circular(50.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Color(0xFF4C53A5)),
            borderRadius: BorderRadius.circular(50.0),
          ),
          prefixIcon: Icon(
            icon,
            color: const Color(0xFF4C53A5),
          ),
        ),
      ),
    );
  }
}
