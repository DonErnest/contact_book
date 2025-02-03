var idCounter = 1;

class Contact {
  late int id;
  String firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  DateTime? dateOfBirth;

  Contact({
    required this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.dateOfBirth,
  }) {
    id = idCounter;
    idCounter++;
  }

  bool get todayIsBirthday =>
      dateOfBirth != null &&
      dateOfBirth!.month == DateTime.now().month &&
      dateOfBirth!.day == DateTime.now().day;
}

List<Contact> contacts = [
  Contact(
    firstName: "Napoleon",
    dateOfBirth: DateTime(1769, 8, 15),
    phoneNumber: "in development",
    email: "bestmonarch@corsica.fr",
  ),
  Contact(firstName: "Some Crazy Guy"),
  Contact(firstName: "Злой курица"),
  Contact(firstName: "AI телка", dateOfBirth: DateTime.now()),
  Contact(
    firstName: "Donald",
    lastName: "Trump",
    dateOfBirth: DateTime(1946, 6, 14),
    phoneNumber: "+1 1111 1111 1111",
    email: "comments@whitehouse.gov",
  ),
  Contact(
      firstName: "Billy",
      lastName: "Herrington",
      dateOfBirth: DateTime(1969, 7, 14)),
  Contact(
      firstName: "Tony",
      lastName: "Robbins",
      dateOfBirth: DateTime(1960, 2, 29),
      email: "bulshitforcash@robbins.com"
  ),
  Contact(firstName: "Harold"),
  Contact(firstName: "Homer", lastName: "Simpson"),
  Contact(
      firstName: "Hubert",
      lastName: "Farnsworth",
      dateOfBirth: DateTime(2841, 4, 9))
];

String _zeroPad(int dateTimeValue) {
  if (dateTimeValue < 10) {
    return '0$dateTimeValue';
  }
  return dateTimeValue.toString();
}

String formatDate(DateTime dateTime) {
  final day = _zeroPad(dateTime.day);
  final month = _zeroPad(dateTime.month);
  final year = dateTime.year;
  return '$day.$month.$year';
}
