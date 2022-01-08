import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Text(
            "Register",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Email", labelText: "Enter your email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text";
                        } else {
                          return null;
                        }
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Username", labelText: "Enter your username"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Password", labelText: "Enter your password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        labelText: "Re-enter your password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                      child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Register successfully!!!")));
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
