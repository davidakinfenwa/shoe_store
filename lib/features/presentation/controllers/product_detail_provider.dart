import 'package:flutter/material.dart';

class ProductDetailNotifier extends ChangeNotifier{
 int _activeProduct=0;
int get activeproduct=>_activeProduct;

set activeProduct(int value){
  _activeProduct=value;
  notifyListeners();
}
}