import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



class ImageFromUrl extends StatelessWidget {

  final String imageUrl;
  const ImageFromUrl({@required this.imageUrl});


  @override
  Widget build(BuildContext context) {

    print("comm6_v3: imageUrl: $imageUrl");  /// [null?]


    final isInvalidUrl = imageUrl.startsWith("http");   /// [booleanType]
    // if(imageUrl == null || imageUrl == "" || isInvalidUrl) {
    if(imageUrl == null || imageUrl == "" ) {
      print("comm7: true: (imageUrl == null || imageUrl == "" || !isInvalidUrl)");
      return const Icon(Icons.no_cell);

    } else {
      print("comm8: false: (imageUrl == null || imageUrl == "" || !isInvalidUrl)");
      return CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.tv_off),
      );
    }

  }
}