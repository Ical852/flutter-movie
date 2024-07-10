import 'package:flutter/material.dart';
import 'package:movlix/shared/text_styles.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Explore",
        style: regular.white.semiBold,
      ),
    );
  }
}
