 
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home/home_screen.dart';
import 'package:grocery_app/view_model/base_view_model.dart';

class NavigationProvider extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }


final List<Widget> _screens = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container()
  ];


  List<Widget> get screens => _screens;



}
