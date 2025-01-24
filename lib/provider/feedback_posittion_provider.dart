import 'package:flutter/material.dart';

// Enum to define swiping directions
enum SwipingDirection { left, right, none }

// ChangeNotifier to notify listeners about state changes
class FeedbackPositionProvider extends ChangeNotifier {
  double _dx = 0.0; // Tracks the current X position
  late SwipingDirection
  _swipingDirection; // Declared with 'late' to initialize in the constructor

  // Getter for swiping direction
  SwipingDirection get swipingDirection => _swipingDirection;

  // Constructor
  FeedbackPositionProvider() {
    _swipingDirection = SwipingDirection.none; // Initialize swipingDirection
  }

  // Method to reset the position and direction
  void resetPosition() {
    _dx = 0.0;
    _swipingDirection = SwipingDirection.none;
    notifyListeners(); // Notify listeners about the state change
  }

  // Method to update position and determine direction
  void updatePosition(double changeInX) {
    _dx = _dx + changeInX; // Update the position
    if (_dx > 0) {
      _swipingDirection = SwipingDirection.right;
    } else if (_dx < 0) {
      _swipingDirection = SwipingDirection.left;
    } else {
      _swipingDirection = SwipingDirection.none;
    }
    notifyListeners(); // Notify listeners about the state change
  }
}
