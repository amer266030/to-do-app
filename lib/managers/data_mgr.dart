import 'package:get_storage/get_storage.dart';
import 'package:interactions_app/model/task_category.dart';
import '../model/enum/time_period.dart';
import '../model/task.dart';

class DataMgr {
  List<Task> allTasks = [];
  List<TaskCategory> categories = [];
  final box = GetStorage();

  // MARK:- Task Screen
  bool? selectedStatus;
  int? selectedId;
  TimePeriod? selectedPeriod;
  TaskCategory? selectedCategory;

  DataMgr() {
    _fetchData();
  }

  // List<Task> get filteredTasks => _filterTasks();
  List<Task> get filteredTasks => allTasks;

  double get taskCompletionPercentage {
    int completed =
        filteredTasks.where((task) => task.isCompleted).toList().length;
    int total = filteredTasks.length;
    return completed / total;
  }

  void _fetchData() {
    _fetchTasks();
    _fetchCategories();
  }

  void _fetchTasks() {
    List<Map<String, dynamic>> storageTasks = [];
    if (box.read('tasks') != null) {
      storageTasks = List.from(box.read('tasks')).cast<Map<String, dynamic>>();
      for (var task in storageTasks) {
        allTasks.add(Task.fromJson(task));
      }
    }
  }

  void _fetchCategories() {
    List<Map<String, dynamic>> storageCategories = [];
    if ((box.read('categories')) == null) {
      addNewCategory(TaskCategory(
          id: 0, title: 'Home', iconName: 'home', colorName: 'red'));
    } else {
      storageCategories =
          List.from(box.read('categories')).cast<Map<String, dynamic>>();
      for (var cat in storageCategories) {
        categories.add(TaskCategory.fromJson(cat));
      }
    }
  }

  void addNewTask(Task task) async {
    allTasks.add(task);
    List<Map<String, dynamic>> taskAsMap = [];
    for (var task in allTasks) {
      taskAsMap.add(task.toJson());
    }
    await box.write('tasks', taskAsMap);
  }

  Future<void> addNewCategory(TaskCategory cat) async {
    categories.add(cat);
    List<Map<String, dynamic>> categoriesAsMap = [];
    for (var cat in categories) {
      categoriesAsMap.add(cat.toJson());
    }
    await box.write('categories', categoriesAsMap);
  }

  // List<Task> _filterTasks() {
  //   List<Task> temp = allTasks;
  //
  //   if (selectedPeriod != null) {
  //     temp = temp
  //         .where((task) => task.timeStamp.isBefore(
  //             DateTime.now().add(Duration(days: selectedPeriod!.duration()))))
  //         .toList();
  //   }
  //
  //   if (selectedStatus != null) {
  //     temp = temp.where((task) => task.isCompleted == selectedStatus).toList();
  //   }
  //
  //   if (selectedId != null) {
  //     temp = temp.where((task) => task.categoryId == selectedId).toList();
  //   }
  //
  //   return temp;
  // }

  changeTaskCompletionState({required int id}) {
    var task = allTasks.where((task) => task.id == id).firstOrNull;
    if (task != null) {
      task.isCompleted = !task.isCompleted;
    }
  }
}
