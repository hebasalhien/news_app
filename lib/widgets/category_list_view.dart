import 'package:flutter/material.dart';
import '../models/category_model.dart';
import 'category_widget.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(imagePath: 'assets/business.jpg', data: 'Business'),
    CategoryModel(imagePath: 'assets/entertainment.avif', data: 'Entertainment'),
    CategoryModel(imagePath: 'assets/general.jpg', data: 'General'),
    CategoryModel(imagePath: 'assets/health.avif', data: 'Health'),
    CategoryModel(imagePath: 'assets/science.avif', data: 'Science'),
    CategoryModel(imagePath: 'assets/sports.jpg', data: 'Sports'),
    CategoryModel(imagePath: 'assets/technology.jpeg', data: 'Technology'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CategoryWidget(categoryModel: categories[index]);
        },
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
