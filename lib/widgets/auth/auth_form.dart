import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading, {super.key});

  final bool isLoading;
  final void Function(
      String email, String password, String userName, bool isLogin) submitFn;
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(_userEmail, _userName, _userPassword, _isLogin);

      // Use values to send auth request
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains("@")) {
                        return 'Please enter a valid email address!';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(labelText: 'Email Address'),
                    onSaved: ((newValue) {
                      _userEmail = newValue!;
                    }),
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return 'Please enter at least 4 characters !';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Username'),
                      onSaved: ((newValue) {
                        _userName = newValue!;
                      }),
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Password Must be at least 7 characters long !';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: ((newValue) {
                      _userPassword = newValue!;
                    }),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      onPressed: _trySubmit,
                      child: Text(_isLogin ? 'Login' : "Sign-Up"),
                    ),
                  // if (widget.isLoading) CircularProgressIndicator(),
                  // if (!widget.isLoading)
                  TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: (() {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      }),
                      child: Text(_isLogin
                          ? "Create New Account !"
                          : 'I already have an account'))
                ],
              )),
        )),
      ),
    );
  }
}
