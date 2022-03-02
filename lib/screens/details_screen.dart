import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cats_demo_project/models/cat_model.dart';

class DetailsScreen extends StatelessWidget {
  final CatModel catModel;
  const DetailsScreen({
    Key? key,
    required this.catModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Details Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: catModel.url,
                progressIndicatorBuilder:
                    (context, url, downloadProgress) => Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
              Text(catString()),
            ],
          ),
        ),
      ),
    );
  }

  String catString() {
    if (catModel.categories.isNotEmpty) {
      return catModel.categories[0].name;
    } else {
      return 'NO Category';
    }
  }

}
