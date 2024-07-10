import 'package:flutter/material.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/shared/constants.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/shared/text_styles.dart';
import 'package:movlix/widgets/image_custom.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Trailer extends StatefulWidget {
  const Trailer({super.key});

  @override
  State<Trailer> createState() => _TrailerState();
}

class _TrailerState extends State<Trailer> {
  late YoutubePlayerController _controller;
  late bool play = false;

  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'K4TOrB7at0Y',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget TrailerContent() {
      if (play) return Container(
        height: 320,
        width: getWH(context, "width") - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
        ),
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
        ),
      );

      return GestureDetector(
        onTap: () => setState(() {
          play = true;
        }),
        child: Center(
          child: ImageCustom(
            width: 64,
            height: 64,
            image: AssetImage(getIC("ic_trailer_btn.png")),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trailer",
            style: mega.white.semiBold,
          ),
          SizedBox(height: 10,),
          Container(
            height: 160,
            child: Stack(
              children: [
                ImageCustom(
                  height: 160, 
                  width: getWH(context, "width") - 40, 
                  image: AssetImage(dummyImg), 
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(8),
                ),
                Container(
                  height: 160,
                  width: getWH(context, "width") - 40,
                  color: blackColor.withOpacity(0.5),
                ),
                TrailerContent()
              ],
            ),
          )
        ],
      ),
    );
  }
}