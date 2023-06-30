class Note {
  String title;
  String content;
  DateTime date;

  Note({required this.title, required this.content, required this.date});
}

final Map<String, int> categories = {
  'Notes': 110,
  'Work': 55,
  'Home': 20,
  'Complete': 31,
};

final List<Note> notes = [
  Note(
    title: 'Buy ticket',
    content: 'Buy airplace ticket through Kayak for \$310',
    date: DateTime(2018, 06, 03, 5, 23),
  ),
  Note(
    title: 'Walk with dog',
    content: 'Walk on the street with my favorite dog',
    date: DateTime(2019, 04, 13, 7, 20),
  ),
];
