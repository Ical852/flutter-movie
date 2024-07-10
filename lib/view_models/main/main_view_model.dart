import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movlix/blocs/cubits/page_cubit.dart';
import 'package:movlix/functions/global_func.dart';

class MainViewModel {
  late BuildContext context;

  MainViewModel(BuildContext context) {
    this.context = context;
  }

  void setNewPage(String newRoute) {
    try {
      context.read<PageCubit>().setNewPage(newRoute);
    } catch (e) {
      showGLobalAlert("danger", "Failed to set new route", context);
    }
  }
}
