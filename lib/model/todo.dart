class TodoFiels {
  static const cretaedTime = 'createdTime';
}

class Todo {
  late DateTime createdTime;
  late String title;
  late String id;
  late String desc;
  late bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    this.id = '',
    this.desc =' ',
    this.isDone = false,
  });
}
