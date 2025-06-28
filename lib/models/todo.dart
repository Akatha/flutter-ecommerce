



class Todo{

  final String todo;
  final bool isCompleted;


  Todo({
    required this.todo,
    required this.isCompleted
  });

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(
        todo: json['todo'],
        isCompleted: json['isCompleted']
    );
  }

  factory Todo.add(String todo){
    return Todo(
        todo: todo,
        isCompleted: false
    );
  }



  Todo copyWith ({String? todo, bool? isCompleted}){
    return Todo(
        todo: todo ?? this.todo,
        isCompleted: isCompleted ?? this.isCompleted
    );
  }


}