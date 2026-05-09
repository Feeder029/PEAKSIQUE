import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peaksique/models/category_model.dart';
import 'package:peaksique/pages/splash_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  void getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    getCategories();
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchField(),
          SizedBox(height: 40,),
          category()
        ],
      ),
    );
  }

  Column category() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                separatorBuilder: (context, index) => SizedBox(width: 25,),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 37, 36, 36),
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 15
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
  }

  Container searchField() {
    return Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 16
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/search_icon.svg',
                  color: Colors.black,
                ),
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/filter_icon.svg',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              )
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "PEAKSIQUE",
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => SplashScreen(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(10),
          width: 37,
          decoration: BoxDecoration(
            color: Color(0xFF1A1F2E),
            border: Border.all(color: Color(0xFF2A2F42), width: 1),
            borderRadius: BorderRadius.circular(10)
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/back_arrow_icon.svg',
            height: 15,
            width: 15,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {

          },
          child: Container(
            margin: EdgeInsets.all(10),
            width: 37,
            decoration: BoxDecoration(
              color: Color(0xFF1A1F2E),
              border: Border.all(color: Color(0xFF2A2F42), width: 1),
              borderRadius: BorderRadius.circular(10)
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/back_arrow_icon.svg',
              height: 15,
              width: 15,
            ),
          ),
        )
      ],
    );
  }
}