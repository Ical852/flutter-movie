import 'package:flutter/material.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/screens/detail_pages/detail_page.dart';
import 'package:movlix/shared/text_styles.dart';
import 'package:movlix/widgets/image_custom.dart';

// ignore: must_be_immutable
class ComingSoonCard extends StatelessWidget {
  Results detail;
  ComingSoonCard({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailPage(detail)),
        );
      },
      child: Container(
        child: Center(
          child: ImageCustom(
          fit: BoxFit.cover,
          width: getWH(context, "width") - 40,
          height: 200,
          image: NetworkImage(getPosterUrl(detail.posterPath!)),
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Container(
                width: getWH(context, "width") - 40,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff000000).withOpacity(0.85),
                      Color(0xff000000).withOpacity(0.65),
                      Color(0xff000000).withOpacity(0.45),
                      Color(0xff000000).withOpacity(0.25),
                      Color(0xff000000).withOpacity(0.15),
                      Color(0xff000000).withOpacity(0.05),
                    ]
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 18, top: 12),
                child: Text(
                  detail.title!,
                  style: regular.white.semiBold,
                ),
              ),
              Center(
                child: ImageCustom(
                  width: 34,
                  height: 34,
                  image: AssetImage(getIC("ic_play_btn.png")),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
