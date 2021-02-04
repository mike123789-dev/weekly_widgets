import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  TextEditingController _idController;
  TextEditingController _passwordController;

  bool isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validatePassword() {
    setState(() {
      if (_passwordController.text.length < 6) {
        isPasswordValid = false;
      } else {
        isPasswordValid = true;
      }
    });
  }

  void _resetControllers() {
    _idController.clear();
    _passwordController.clear();
  }

  void _showAlertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Controller texts'),
          content: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ID : ${_idController.text}"),
                Text("Password : ${_passwordController.text}")
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context, "OK");
                FocusScope.of(context).unfocus();
              },
            ),
          ],
        );
      },
    );
  }

  OutlineInputBorder borderMaker(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
      borderSide: BorderSide(
        width: 1,
        color: color,
      ),
    );
  }

  Widget _buildIdTextField() {
    return TextField(
      controller: _idController,
      onSubmitted: (String value) {
        print("id: $value");
      },
      onEditingComplete: () {
        _showAlertDialog(context);
      },
      decoration: InputDecoration(
        border: borderMaker(Colors.green),
        labelText: "ID",
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      onChanged: (_) {
        _validatePassword();
      },
      onSubmitted: (String value) {
        print("password: $value");
      },
      onEditingComplete: () {
        _showAlertDialog(context);
      },
      obscureText: true,
      decoration: InputDecoration(
          border: borderMaker(Colors.black),
          labelText: "Password",
          errorBorder: borderMaker(Colors.red),
          errorText: isPasswordValid ? null : "Over 6 characters needed"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildIdTextField(),
          SizedBox(height: 30),
          _buildPasswordTextField(),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("press Done on Keyboard!"),
              RaisedButton(
                child: Text("Reset"),
                onPressed: _resetControllers,
              ),
            ],
          )
        ],
      ),
    );
  }
}
