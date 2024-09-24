import 'package:flutter/material.dart';

// Helper function to wrap the widgets to be tested.
Widget makeTestable(Widget widget) => MaterialApp(home: Scaffold(body: widget));
