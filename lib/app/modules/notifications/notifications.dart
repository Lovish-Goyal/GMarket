import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 40),
              child: Image.asset('images/Emptynotifications.png')),
          const SizedBox(height: 10),
          const Text(
            "No Notifications Yet",
            style: TextStyle(color: Colors.black, fontSize: 28,fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
           const Center(
             child: Text(
              " You have no notifications right now",
              style: TextStyle(color: Colors.grey, fontSize: 20,),
                     ),
           ),
          const SizedBox(height: 10),
           const Center(
             child: Text(
              " come back later",
              style: TextStyle(color: Colors.grey, fontSize: 20,),
                     ),
           ),
          const SizedBox(height: 40),
          GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF4C53A5),
                                      Color(0xFF4C53A5),
                                      Color(0xFF4C53A5)
                                    ])),
                            child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text('Explore products',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                          ),
                          onTap: () => context.go("${RouteKey.home}?index=0"),),
        ],
      ),
    );
  }
}
