class FormattedDate {
  DateTime date;
  FormattedDate(this.date);

  @override
  String toString() {
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
  }
}
