import 'package:flutter_bonapp/models/cart.dart';
import 'package:flutter_bonapp/services/cart_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:flutter_bonapp/viewmodels/cart/viewmodel.dart';

class ItemViewModel extends BaseModel {
  CartService _cartService = locator<CartService>();

  void initialise() {}

  addItemToCart(int pid, String name, double price) {
    _cartService.addItem(pid, name, price);
    notifyListeners();
  }
}
