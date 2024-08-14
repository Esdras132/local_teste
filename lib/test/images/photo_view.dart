import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class flutter_image extends StatefulWidget {
  const flutter_image({super.key});

  @override
  State<flutter_image> createState() => _flutter_imageState();
}

class _flutter_imageState extends State<flutter_image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('photo_view'),
      ),
      body: Center(
          child: PhotoView(
            imageProvider: CachedNetworkImageProvider(
              'https://via.placeholder.com/600',
            ),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          ),
        ),
    );
  }
}
