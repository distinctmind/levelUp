import 'package:flutter/material.dart';
import '../models/adventure_service.dart';

class InheritedAdventures extends InheritedWidget {
  
  final AdventureService adventureService;

  InheritedAdventures({this.adventureService, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static InheritedAdventures of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedAdventures);
  }
  
}