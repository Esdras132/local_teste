import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class cached_network_image extends StatefulWidget {
  const cached_network_image({super.key});

  @override
  State<cached_network_image> createState() => _cached_network_imageState();
}

class _cached_network_imageState extends State<cached_network_image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cached_network_image'),
      ),
      body: Center(
          child: CachedNetworkImage(
            imageUrl: 'https://via.placeholder.com/600',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fadeInDuration: Duration(seconds: 1),
            fadeOutDuration: Duration(seconds: 1),
            cacheKey: 'customCacheKey', // Para personalizar o cache
            fit: BoxFit.cover,
          ),
        ),
    );
  }
}