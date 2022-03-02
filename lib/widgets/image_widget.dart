import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cats_demo_project/models/cat_model.dart';
import 'package:cats_demo_project/screens/details_screen.dart';

class ImageWidget extends StatelessWidget {
  final CatModel catModel;

  const ImageWidget({
    Key? key,
    required this.catModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(
            catModel: catModel,
          )),
        );
      },
      child: CachedNetworkImage(
        imageUrl: catModel.url,
        progressIndicatorBuilder:
            (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
              value: downloadProgress.progress),
        ),
        errorWidget: (context, url, error) =>
        const Icon(Icons.error),
      ),
    );
  }
}
