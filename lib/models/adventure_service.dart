import './habit.dart';

class AdventureService {
  
  List<Habit> habits = [];
  
  void addAdventure(Habit habit) {
    habits.add(habit);
  }
}