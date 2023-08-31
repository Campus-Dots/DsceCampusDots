// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import "package:campus_dots/services/auth.dart";
import "package:campus_dots/shared/constants.dart";
import "package:campus_dots/shared/loading.dart";

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // ignore: unused_field
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            //backgroundColor: Colors.grey[400],
            appBar: AppBar(
              backgroundColor: Colors.grey[900],
              elevation: 0.0,
              title: const Text('CampusDots Registration'),
              actions: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.person),
                  label: const Text('Sign-in'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/register.png"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.only(left: 35, top: 30),
                    //   child: const Text(
                    //     'Create\nAccount',
                    //     style: TextStyle(color: Colors.white, fontSize: 33),
                    //   ),
                    // ),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 35, right: 35),
                              child: Column(
                                children: [
                                  // body: Container(
                                  // padding:
                                  // const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: <Widget>[
                                        const SizedBox(height: 30.0),
                                        TextFormField(
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration:
                                                textInputDecoration.copyWith(
                                              fillColor: Colors.grey.shade300,
                                              filled: true,
                                              hintText: 'Email',
                                              hintStyle: const TextStyle(
                                                  color: Colors.black45),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                  color: Colors.blue,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                            validator: (val) => val!.isEmpty
                                                ? 'Enter your email'
                                                : null,
                                            onChanged: (val) {
                                              setState(() => email = val);
                                            }),
                                        const SizedBox(height: 30.0),
                                        TextFormField(
                                          style: const TextStyle(
                                              color: Colors.black),
                                          decoration:
                                              textInputDecoration.copyWith(
                                            fillColor: Colors.grey.shade300,
                                            filled: true,
                                            hintText: 'Password',
                                            hintStyle: const TextStyle(
                                                color: Colors.black45),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                color: Colors.blue,
                                                width: 2.0,
                                              ),
                                            ),
                                          ),
                                          obscureText: true,
                                          validator: (val) => val!.length < 8
                                              ? 'Password should be min 8 chars'
                                              : null,
                                          onChanged: (val) {
                                            setState(() => password = val);
                                          },
                                        ),
                                        // ElevatedButton(
                                        //     style: ElevatedButton.styleFrom(
                                        //       backgroundColor: Colors.blue[900],
                                        //     ),
                                        //     child: const Text(
                                        //       'Register',
                                        //       style: TextStyle(color: Colors.white),
                                        //     ),
                                        //     onPressed: () async {
                                        //       if (_formKey.currentState!.validate()) {
                                        //         setState(() => loading = true);
                                        //         dynamic result =
                                        //             await _auth.registerWithEmailAndPassword(
                                        //                 email, password);
                                        //         if (result == null) {
                                        //           setState(() {
                                        //             error = 'Please supply a valid email';
                                        //             loading = false;
                                        //           });
                                        //         }
                                        //       }
                                        //     }),
                                        const SizedBox(height: 100.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Register',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 27,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundColor:
                                                  const Color(0xff4c505b),
                                              child: IconButton(
                                                  color: Colors.white,
                                                  onPressed: () async {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      setState(
                                                          () => loading = true);
                                                      dynamic result = await _auth
                                                          .registerWithEmailAndPassword(
                                                              email, password);
                                                      if (result == null) {
                                                        setState(() {
                                                          error =
                                                              'Please supply a valid email';
                                                          loading = false;
                                                        });
                                                      }
                                                    }
                                                  },
                                                  icon: const Icon(
                                                    Icons.arrow_forward,
                                                  )),
                                            )
                                          ],
                                        ),

                                        const SizedBox(height: 12.0),
                                        Text(
                                          error,
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //container
                                ], //children
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
