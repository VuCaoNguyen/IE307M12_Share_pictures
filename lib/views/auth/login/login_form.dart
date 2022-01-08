import 'package:flutter/material.dart';
import 'package:pinterest/controllers/auth/google/google_auth.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key, required this.isLoading, required this.submitFn})
      : super(key: key);

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const double fonttext = 18;
    return ListView(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.grey.shade900,
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextFormField(
                      key: ValueKey('email'),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      enableSuggestions: false,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: _inputDecorationLogin("Email address"),
                      onSaved: (value) {
                        _userEmail = value!;
                      },
                    ),
                    if (!_isLogin)
                      TextFormField(
                        key: ValueKey('username'),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        autocorrect: true,
                        textCapitalization: TextCapitalization.words,
                        enableSuggestions: false,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Please enter at least 4 characters';
                          }
                          return null;
                        },
                        decoration: _inputDecorationLogin("Username"),
                        onSaved: (value) {
                          _userName = value!;
                        },
                      ),
                    TextFormField(
                      key: ValueKey('password'),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return 'Password must be at least 7 characters long.';
                        }
                        return null;
                      },
                      decoration: _inputDecorationLogin("Password"),
                      obscureText: true,
                      onSaved: (value) {
                        _userPassword = value!;
                      },
                    ),
                    if (widget.isLoading) CircularProgressIndicator(),
                    if (!widget.isLoading)
                      // ignore: deprecated_member_use
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        width: 300,
                        child: TextButton(
                          style: _buttonStyle(Colors.blue.shade800),
                          child: Text(
                            _isLogin ? 'Login' : 'Signup',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: _trySubmit,
                        ),
                      ),
                    if (!widget.isLoading)
                      // ignore: deprecated_member_use
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text(_isLogin
                            ? 'Create new account'
                            : 'I already have an account'),
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Text(
            "Or",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fonttext,
                fontWeight: FontWeight.w800,
                color: Colors.white),
          ),
        ),
        Column(children: [
          Container(
            width: 300,
            margin: const EdgeInsets.only(top: 40),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Continue with Facebook",
                  style: TextStyle(color: Colors.white),
                ),
                style: _buttonStyle(Color.fromARGB(255, 65, 88, 147))
                // TextButton.styleFrom(
                ),
          ),
          ChangeNotifierProvider(
              create: (context) => GooleSignInProvider(),
              child: Builder(builder: (context) {
                return Container(
                  width: 300,
                  margin: const EdgeInsets.only(top: 20),
                  child: TextButton(
                      onPressed: () {
                        Provider.of<GooleSignInProvider>(context, listen: false)
                            .googleLogin()
                            .then((value) =>
                                Navigator.of(context).pushNamed('/home'))
                            .onError((error, stackTrace) => null);
                      },
                      child: const Text(
                        "Continue with Google",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: _buttonStyle(Color.fromARGB(255, 83, 131, 236))),
                );
              })),
          Container(
            width: 300,
            margin: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Continue with Apple",
                style: TextStyle(color: Colors.black),
              ),
              style: _buttonStyle(Color.fromRGBO(255, 255, 255, 1)),
            ),
          )
        ]),
      ],
    );
  }

  ButtonStyle _buttonStyle(Color color) {
    return ButtonStyle(
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20)),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        )));
  }

  InputDecoration _inputDecorationLogin(String label) {
    return InputDecoration(
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.blue)),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white,
        ));
  }
}
