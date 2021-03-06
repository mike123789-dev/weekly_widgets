import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class MyGallerySaver extends StatefulWidget {
  @override
  _MyGallerySaverState createState() => _MyGallerySaverState();
}

class _MyGallerySaverState extends State<MyGallerySaver> {
  String albumName = 'Media';
  bool isSaved = false;

  void _saveNetwork() async {
    String path =
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg';
    GallerySaver.saveImage(path, albumName: albumName).then((bool success) {
      setState(() {
        print(' is saved');
        isSaved = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: _saveNetwork,
          child: Text("Save Owl Image To Gallery"),
        ),
        isSaved
            ? Icon(
                Icons.check,
                color: Colors.green,
                size: 50,
              )
            : Icon(
                Icons.help,
                color: Colors.red,
                size: 50,
              )
      ],
    );
  }
}
