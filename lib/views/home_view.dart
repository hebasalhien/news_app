import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_list_view.dart';
import '../widgets/news_list_view_builder.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('News', style: TextStyle(color: Colors.black, fontSize: 24)),
            Text('Cloud', style: TextStyle(color: Colors.orange, fontSize: 24)),
          ],
        ),
        centerTitle: true,
      ),
        body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryListView(),),
            NewsListViewBuilder(category: 'general',),
          ],
        ),
      ),
      // SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       spacing: 16,
      //       children: [
      //         CategoryListView(),
      //         NewsListView(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

