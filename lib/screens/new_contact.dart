import 'package:contact_book/data.dart';
import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  final void Function(Contact newContact) onContactCreated;

  const NewContact({super.key, required this.onContactCreated});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  var typedName = "";
  var typedLastName = "";
  var typedEmail = "";
  var typedPhone = "";
  DateTime? selectedDateOfBirth;
  final dateOfBirthController = TextEditingController();

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    setState(() {
      final contact = Contact(firstName: typedName);
      if (typedLastName != "") {
        contact.lastName = typedLastName;
      }
      if (typedEmail != "") {
        contact.email = typedEmail;
      }
      if (typedPhone != "") {
        contact.phoneNumber = typedPhone;
      }
      if (selectedDateOfBirth != null) {
        contact.dateOfBirth = selectedDateOfBirth;
      }
      print(contact);
      widget.onContactCreated(contact);
      Navigator.pop(context);
    });
  }

  void onDateTap() async {
    // suppose 100 y.o. people can be in contact list
    var earliestBirth = DateTime(1925, 1, 1, 0, 0, 1);
    final dateFromUser = await showDatePicker(
      context: context,
      firstDate: earliestBirth,
      lastDate: DateTime.now(),
    );

    if (dateFromUser != null) {
      setState(() {
        selectedDateOfBirth = dateFromUser;
        dateOfBirthController.text = formatDate(dateFromUser);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                    onChanged: (value) => setState(() => typedName = value),
                    decoration: InputDecoration(label: Text("First name"))),
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextField(
                    onChanged: (value) => setState(() => typedLastName = value),
                    decoration: InputDecoration(label: Text("Last name"))),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                    onChanged: (value) => setState(() => typedPhone = value),
                    decoration: InputDecoration(label: Text("Phone Number"))),
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextField(
                    onChanged: (value) => setState(() => typedEmail = value),
                    decoration: InputDecoration(label: Text("Email"))),
              ),
            ],
          ),
          TextField(
            onTap: onDateTap,
            readOnly: true,
            controller: dateOfBirthController,
            decoration: InputDecoration(label: Text('Date of Birth')),
          ),
          Row(
            children: [
              TextButton(onPressed: onCanceled, child: Text('Cancel')),
              const Spacer(),
              ElevatedButton(
                onPressed: onSaved,
                child: const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
