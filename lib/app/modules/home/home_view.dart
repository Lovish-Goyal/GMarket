// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_appwrite/app/modules/cart/provider.dart';
import 'package:learn_appwrite/app/modules/home/rowItems.dart';
import 'package:learn_appwrite/widgets/carsoul_slider.dart';
import 'package:learn_appwrite/app/modules/home/items/items.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {

  @override
  Widget build(BuildContext context) {
    final snapshot = ref.watch(cartStateProvider);
    return Scaffold(
      backgroundColor: Color(0xFF4C53A5).withOpacity(0.4),
      appBar: AppBar(
        backgroundColor: Color(0xFF4C53A5),
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage("images/mylogo.jpg"),
            ),
            SizedBox(
              width: 15,
            ),
            Text("GMarket")
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => context.push('/notifications'),
            icon: Icon(Icons.notifications_active),
          ),
          SizedBox(
            width: 6,
          ),
          Center(
            child: Badge(
              smallSize: 15,
              label: Text(snapshot.length.toString()),
              child: IconButton(
                  onPressed: () => context.push('/cart'),
                  icon: Icon(Icons.shopping_cart)),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Sorry!',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4C53A5),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'Filter is Not implemented yet',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 16),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF4C53A5),
                                      ),
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(FontAwesomeIcons.filter,size: 22,),
                      label: Text("Filter",style: TextStyle(
                        fontSize: 22
                      ),)),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => context.go('/search'),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(50)),
                      child: IntrinsicHeight(
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Text("Search...",style: TextStyle(
                              fontSize: 18
                            ),),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.search),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Popular Products",
                style: TextStyle(
                    color: Color(0xFF4C53A5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            RowItems(),
            SizedBox(
              height: 20,
            ),
            Carsoul(),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Products For You",
                style: TextStyle(
                    color: Color(0xFF4C53A5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Items(),
          ],
        ),
      ),
    );
  }
}
