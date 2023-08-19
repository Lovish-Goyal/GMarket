import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:utils_widget/utils_widget.dart';
import 'package:uuid/uuid.dart';

import '../provider.dart';
import '../user_model/user_model.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController name = TextEditingController();
  bool _obscureText = true;

  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Container(
                  height: 550,
                  width: 325,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const Text('Welcome To Our App',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 40),
                      SizedBox(
                          width: 250,
                          child: TextField(
                              controller: email,
                              decoration: const InputDecoration(
                                labelText: 'Email Address',
                                suffixIcon:
                                    Icon(FontAwesomeIcons.envelope, size: 17),
                              ))),
                     SizedBox(
                          width: 250,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: pass,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                          )),
                      SizedBox(
                          width: 250,
                          child: TextField(
                              controller: name,
                              decoration: const InputDecoration(
                                  labelText: 'Name',
                                  suffixIcon: Icon(
                                    FontAwesomeIcons.idCard,
                                    size: 17,
                                  )))),
                      SizedBox(
                          width: 250,
                          child: TextField(
                              controller: phone,
                              decoration: const InputDecoration(
                                  labelText: 'Phone',
                                  suffixIcon: Icon(
                                    FontAwesomeIcons.phone,
                                    size: 17,
                                  )))),
                      const SizedBox(height: 30),

                      InkWell(
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                });
                            logger.d("Signup");
                            final userModel = UserModel(
                              phone: phone.text,
                              email: email.text,
                              fullName: name.text,
                              userId: const Uuid().v4().hashCode.toString(),
                            );
                            ref
                                .read(userStateProvider.notifier)
                                .signUp(user: userModel, password: pass.text);
                            Navigator.of(context).pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF8A2387),
                                      Color(0xFFE94057),
                                      Color(0xFFF27121)
                                    ])),
                            child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text('Sign up',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                          )),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Row(
                          children: [
                            const Text(
                              'Already have an account?',
                            ),
                            TextButton(
                                onPressed: () => context.push('/'),
                                child: Text('Login',
                                    style: TextStyle(
                                        color: Colors.orangeAccent[700])))
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
