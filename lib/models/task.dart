
class Task {
  
  final String id;

  
  final String title;

 
  bool isCompleted;

  
  final DateTime date;

  
  Task({
    
    required this.id,
    // required também para o título.
    required this.title,
    // required para a data do dia da tarefa.
    required this.date,
    // Se ninguém passar isCompleted, o padrão é false (pendente).
    this.isCompleted = false,
  });

  
  Map<String, dynamic> toJson() {
    // return devolve o mapa que será gravado.
    return {
      // A chave 'id' guarda o identificador.
      'id': id,
      // A chave 'title' guarda o texto da tarefa.
      'title': title,
      // A chave 'isCompleted' guarda se está concluída.
      'isCompleted': isCompleted,
   
      'date': date.toIso8601String(),
    };
  }

  
  factory Task.fromJson(Map<String, dynamic> json) {
    // Recria a Task lendo cada chave do mapa.
    return Task(
      // as String avisa o Dart: "tenho certeza de que isto é texto".
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
    
      date: json['date'] != null
          ? DateTime.parse(json['date'] as String)
          : DateTime.now(),
    );
  }
}


bool isSameDay(DateTime a, DateTime b) {
  // && significa E: os três pedaços precisam ser verdadeiros.
  return a.year == b.year && a.month == b.month && a.day == b.day;
}


String formatShortDate(DateTime date) {
  
  final day = date.day.toString().padLeft(2, '0');
  
  final month = date.month.toString().padLeft(2, '0');

  return '$day/$month/${date.year}';
}



DateTime dateOnly(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}