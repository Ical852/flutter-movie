import 'package:flutter/material.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/shared/constants.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/shared/text_styles.dart';
import 'package:movlix/widgets/image_custom.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  TextEditingController searchController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget SearchBar() {
      return Container(
        height: 52,
        decoration: BoxDecoration(
          color: greyColor2,
          boxShadow: [getBoxShadow(1.5)],
          borderRadius: BorderRadius.circular(8)
        ),
        margin: EdgeInsets.all(24),
        child: Stack(
          children: [
            TextFormField(
              style: regular.white.semiBold,
              decoration: InputDecoration(
                labelText: "Search movie or tv here",
                labelStyle: regular.regularF.copyWith(color: whiteColor),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  right: 14,
                  left: 52
                )
              ),
              controller: searchController,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: ImageCustom(
                  height: 20, 
                  width: 20,
                  image: AssetImage(getIC("ic_search.png")),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget SearchList() {
      return Expanded(
        child: Container(
          child: GridView.builder(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 172
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns
              childAspectRatio: 105 / 160,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10 // Aspect ratio (width / height)
            ),
            itemCount: dummyList.length, // Number of items
            itemBuilder: (context, index) {
              double itemWidth = getWH(context, "width") / 3 - 20;
              double itemHeight  = itemWidth * 105 / 160;

              return Container(
                child: AspectRatio(
                  aspectRatio: 105 / 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: ImageCustom(
                      width: itemWidth,
                      height: itemHeight,
                      fit: BoxFit.cover,
                      image:
                          AssetImage(dummyList[index]), // Use your image list
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          SearchBar(),
          SearchList()
        ],
      )
    );
  }
}
