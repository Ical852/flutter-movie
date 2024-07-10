import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movlix/blocs/cubits/page_cubit.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primary));

    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PageCubit())],
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
        ));
  }
}
