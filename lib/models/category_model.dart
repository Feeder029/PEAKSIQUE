import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor
  });

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];
    
    categories.add(
      CategoryModel(
        name: 'Test1',
        iconPath: 'assets/icons/search_icon.svg',
        boxColor: Colors.tealAccent
      )
    ); 

    categories.add(
      CategoryModel(
        name: 'Test1',
        iconPath: 'assets/icons/back_arrow_icon.svg',
        boxColor: Colors.pinkAccent
      )
    ); 

    categories.add(
      CategoryModel(
        name: 'Test3',
        iconPath: 'assets/icons/filter_icon.svg',
        boxColor: Colors.yellowAccent
      )
    ); 

    categories.add(
      CategoryModel(
        name: 'Test1',
        iconPath: 'assets/icons/search_icon.svg',
        boxColor: Colors.tealAccent
      )
    ); 

    return categories;
  }

}