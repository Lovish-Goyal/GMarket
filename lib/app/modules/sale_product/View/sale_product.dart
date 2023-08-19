import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:utils_widget/utils_widget.dart';
import 'package:uuid/uuid.dart';
import '../../../../data/env.dart';
import '../product_model/product_model.dart';
import '../provider.dart';

class Sale extends ConsumerStatefulWidget {
  const Sale({super.key});

  @override
  ConsumerState<Sale> createState() => _SaleState();
}

class _SaleState extends ConsumerState<Sale> {
  XFile? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      }
    });
  }

  TextEditingController pname = TextEditingController();
  TextEditingController pprize = TextEditingController();
  TextEditingController pquantity = TextEditingController();
  TextEditingController pdiscount = TextEditingController();
  TextEditingController pdescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C53A5),
        leading: IconButton(onPressed: () => context.go('/profile'), icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text("Product Description"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: _image != null
                  ? FutureBuilder<Uint8List>(
                      future: _image!.readAsBytes(),
                      builder: (context, snapsot) {
                        if (!snapsot.hasData) {
                          return const SizedBox.shrink();
                        }
                        return Image.memory(
                          snapsot.data!,
                          height: 200,
                        );
                      },
                    )
                  : CircleAvatar(
                      radius: 75,
                      backgroundColor: const Color(0xFF4C53A5),
                      child: GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 68,
                            child: Icon(
                              Icons.add_a_photo_sharp,
                              size: 30,
                              color: Color(0xFF4C53A5),
                            )),
                      ),
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 130),
              child: Text(
                "Upload Image",
                style: TextStyle(
                  color: Color(0xFF4C53A5),
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SaleList(
              icon: FontAwesomeIcons.idCard,
              text: 'Product Name',
              height: 55,
              controller: pname,
            ),
            const SizedBox(
              height: 20,
            ),
            SaleList(
              icon: FontAwesomeIcons.rupeeSign,
              text: 'Prize',
              height: 55,
              controller: pprize,
            ),
            const SizedBox(
              height: 20,
            ),
            SaleList(
              icon: Icons.production_quantity_limits,
              text: 'Quantity',
              height: 55,
              controller: pquantity,
            ),
            const SizedBox(
              height: 20,
            ),
            SaleList(
              icon: Icons.discount,
              text: 'Discount',
              height: 55,
              controller: pdiscount,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 115,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                maxLength: 150,
                maxLines: 3,
                controller: pdescription,
                style: const TextStyle(color: Color(0xFF4C53A5), fontSize: 18),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFF4C53A5), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFF4C53A5), width: 2),
                  ),
                  labelText: 'Add Desciption',
                  labelStyle: const TextStyle(
                    color: Color(0xFF4C53A5),
                  ),
                  prefixIcon: const Icon(Icons.card_travel),
                  prefixIconColor: const Color(0xFF4C53A5),
                ),
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4C53A5)),
                onPressed: () {
                  final productModel = ProductModel(
                    name: pname.text,
                    price: int.tryParse(pprize.text) ?? 0,
                    quantity: int.tryParse(pquantity.text) ?? 0,
                    discount: pquantity.text,
                    description: pdescription.text,
                    productId: const Uuid().v4().hashCode.toString(),
                    image: _image?.path ?? "",
                  );
                  ref
                      .read(productStateProvider.notifier)
                      .saleproduct(product: productModel);
                  logger.d("DATA Uploaded");
                },
                child: const Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SaleList extends StatelessWidget {
  final IconData icon;
  final TextEditingController controller;
  final String text;
  final double height;
  const SaleList(
      {super.key,
      required this.icon,
      required this.text,
      required this.height,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Color(0xFF4C53A5), fontSize: 18),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF4C53A5), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF4C53A5), width: 2),
          ),
          labelText: text,
          labelStyle: const TextStyle(
            color: Color(0xFF4C53A5),
          ),
          prefixIcon: Icon(icon),
          prefixIconColor: const Color(0xFF4C53A5),
        ),
      ),
    );
  }
}



extension AppwriteIdToUrl on String {
  String get toAppWriteUrl =>
      '${Env.endpoint}/storage/buckets/647d9eb631c5a428748a/files/$this/view?project=${Env.projectId}&mode=admin';
}
