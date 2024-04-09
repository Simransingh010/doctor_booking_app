import 'package:flutter/material.dart';

// Define a class to represent an item in the cart
class CartItem {
  final String name;
  final double price;
  int quantity; // Add a quantity field to track the number of items

  // Constructor for CartItem
  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1, // Default quantity is 1
  });
}

// Define a class to manage the cart
class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = []; // List to store cart items
  int _labTestCount = 0; // Variable to track the count of lab tests

  // Getter to access the cart items
  List<CartItem> get cartItems => _cartItems;

  // Method to add an item to the cart
  void addToCart(CartItem newItem) {
    // Check if the item is already in the cart
    bool itemExists = false;
    for (var item in _cartItems) {
      if (item.name == newItem.name) {
        // If the item already exists, increase its quantity
        item.quantity++;
        itemExists = true;
        break;
      }
    }
    // If the item does not exist, add it to the cart
    if (!itemExists) {
      if (newItem.name == "Lab Test") {
        // Check if the lab test count is already one
        if (_labTestCount < 1) {
          _cartItems.add(newItem);
          _labTestCount++; // Increment the lab test count
        }
      } else {
        _cartItems.add(newItem);
      }
    }
    // Notify listeners that the cart has been updated
    notifyListeners();
  }

  // Method to remove an item from the cart
  void removeFromCart(CartItem itemToRemove) {
    _cartItems.remove(itemToRemove);
    if (itemToRemove.name == "Lab Test") {
      _labTestCount--; // Decrement the lab test count
    }
    // Notify listeners that the cart has been updated
    notifyListeners();
  }

  // Method to decrease the quantity of a specific item in the cart
  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--; // Decrease the quantity by 1
      notifyListeners(); // Notify listeners that the cart has been updated
    }
  }

  // Method to increase the quantity of a specific item in the cart
  void increaseQuantity(CartItem item) {
    item.quantity++; // Increase the quantity by 1
    notifyListeners(); // Notify listeners that the cart has been updated
  }

  // Method to calculate the total cost of items in the cart
  double getTotalCost() {
    double total = 0;
    for (var item in _cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
