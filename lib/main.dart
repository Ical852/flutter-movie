import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movlix/blocs/cubits/coming_soon_movie_cubit.dart';
import 'package:movlix/blocs/cubits/movie_cast_cubit.dart';
import 'package:movlix/blocs/cubits/movie_detail_cubit.dart';
import 'package:movlix/blocs/cubits/movie_recommendations_cubit.dart';
import 'package:movlix/blocs/cubits/now_playing_movie_cubit.dart';
import 'package:movlix/blocs/cubits/page_cubit.dart';
import 'package:movlix/blocs/cubits/search_movie_cubit.dart';
import 'package:movlix/blocs/cubits/top_rated_movie_cubit.dart';
import 'package:movlix/blocs/cubits/popular_movie_cubit.dart';
import 'package:movlix/screens/main_pages/main_page.dart';
import 'package:movlix/screens/splash_page.dart';
import 'package:movlix/shared/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: primary));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => TopRatedMovieCubit()),
        BlocProvider(create: (context) => PopularMovieCubit()),
        BlocProvider(create: (context) => ComingSoonMovieCubit()),
        BlocProvider(create: (context) => NowPlayingMovieCubit()),
        BlocProvider(create: (context) => SearchMovieCubit()),
        BlocProvider(create: (context) => MovieDetailCubit()),
        BlocProvider(create: (context) => MovieRecommendationsCubit()),
        BlocProvider(create: (context) => MovieCastCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashPage(),
          "/main": (context) => MainPage()
        },
        initialRoute: "/",
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text("Unknown Route")),
              body: Center(child: Text("Unknown Route")),
            ),
          );
        },
      )
    );
  }
}
