import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movlix/blocs/cubits/search_movie_cubit.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/screens/main_pages/tabs/explore_tab/widgets/grid_card.dart';
import 'package:movlix/shared/constants.dart';

// ignore: must_be_immutable
class MovieList extends StatelessWidget {
  String search;
  MovieList({
    super.key,
    required this.search
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchMovieCubit, SearchMovieState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchMovieLoading) {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: whiteColor,
              ),
            ),
          );
        }
        if (state is SearchMovieSuccess) {
          return Expanded(
            child: Container(
              child: GridView.builder(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 172),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 105 / 160,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                ),
                itemCount: state.search.results!.length,
                itemBuilder: (context, index) {
                  double itemWidth = getWH(context, "width") / 3 - 20;
                  double itemHeight = itemWidth * 105 / 160;
                  return GridCard(
                    itemWidth: itemWidth,
                    itemHeight: itemHeight,
                    detail: state.search.results![index],
                    search: search
                  );
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}