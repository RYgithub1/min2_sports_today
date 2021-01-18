import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



class ImageFromUrl extends StatelessWidget {

  final String imageUrl;
  const ImageFromUrl({@required this.imageUrl});


  @override
  Widget build(BuildContext context) {

    print("comm6_v3: imageUrl: $imageUrl");  /// [null?]


    final bool isInvalidUrl = imageUrl.startsWith("http");   /// [booleanType]
    if(imageUrl == null || imageUrl == "" || !isInvalidUrl) {
    /// [null.startsWith("http") -> error?]
    // if(imageUrl == null || imageUrl == "" ) {
      return const Icon(Icons.no_cell);

    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.tv_off),
      );
    }
  }
}