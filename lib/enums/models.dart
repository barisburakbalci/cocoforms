enum Models {
  answer(name: 'Answer'),
  form(name: 'Form'),
  question(name: 'Question'),
  option(name: 'Option'),
  customer(name: 'Participant');

  const Models({required this.name});

  final String name;
}
