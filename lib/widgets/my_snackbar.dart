import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  void showSimpleSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Simple Snackbar'),
        action: SnackBarAction(
          label: 'Action',
          onPressed: () {
            // Code to execute.
          },
        ),
      ),
    );
  }

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.error,
                color: Colors.pink,
              ),
            ),
            const Text('Custom Snackbar!'),
          ],
        ),
        action: SnackBarAction(
          label: 'Action',
          onPressed: () {
            // Code to execute.
          },
          textColor: Colors.redAccent,
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(const Radius.circular(10))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Text('Show Simple Snackbar'),
          onPressed: () => showSimpleSnackBar(context),
        ),
        ElevatedButton(
          child: const Text('Show Custom Snackbar'),
          onPressed: () => showCustomSnackBar(context),
        ),
      ],
    );
  }
}
