import 'package:flutter/material.dart';
import 'package:cats_demo_project/models/cat_model.dart';
import 'package:cats_demo_project/repository/repository.dart';
import 'package:cats_demo_project/widgets/image_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GreedScreen extends StatefulWidget {
  const GreedScreen({Key? key}) : super(key: key);

  @override
  State<GreedScreen> createState() => _GreedScreenState();
}

class _GreedScreenState extends State<GreedScreen> {

  List<CatModel> catModelList = [];
  bool listLoaded = false;

  @override
  void initState() {
    super.initState();
    getCatModelList();

  }

  void getCatModelList() async {
    catModelList = await Repositories.getCats();
    setState(() {
      listLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(),
      ),
    );
  }

  Widget body() {
    if (!listLoaded) {
      return const Center(child: CircularProgressIndicator(),);
    } else {
      return Container(
        padding: const EdgeInsets.all(15),
        child: StaggeredGridView.countBuilder(
            itemCount: catModelList.length,
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Center(
                    child: ImageWidget(
                      catModel: catModelList[index],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(catStringGenerator(index)),
                  ),
                ],
              );
            },
            staggeredTileBuilder: (index) {
              return const StaggeredTile.count(1, 1.7);
            }),
      );
    }
  }

  String catStringGenerator(int index) {
    if (catModelList[index].categories.isNotEmpty) {
      return catModelList[index].categories[0].name;
    }
    return 'No Category';
  }
}
