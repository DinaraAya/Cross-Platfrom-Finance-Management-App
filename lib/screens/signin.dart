// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 214, 24, 135),
        Color.fromARGB(255, 82, 67, 156)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 190),
                child: Container(
                  height: 297,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 200, top: 29),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 10, right: 10),
                        child: Container(
                          height: 37,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 239, 224, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: TextField(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 176, 165, 188)),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email address",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                                controller: emailController,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Container(
                          width: 350,
                          height: 37,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 239, 224, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 7.0),
                            child: TextField(
                              decoration: null,
                              controller: passwordController,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Container(
                          width: 350,
                          height: 37,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 45, 17, 188),
                                  Color.fromARGB(255, 223, 109, 194)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: MaterialButton(
                            onPressed: create,
                            child: Text(
                              'Create account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 180, 171, 171),
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Sign in',
                                    style: TextStyle(color: Colors.black))
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    'or',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  width: 370,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 239, 224, 255),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.apple),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Text(
                          'Continue with Apple',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29),
                child: Container(
                  width: 370,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 239, 224, 255),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Image.asset('assets/google.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 75),
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29),
                child: Container(
                  width: 370,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 239, 224, 255),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.facebook,
                            color: Color.fromARGB(255, 24, 119, 242),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 68),
                          child: Text(
                            'Continue with Facebook',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void create() async {
  

}
void createApple() {}
