import 'package:contact_book/data.dart';
import 'package:contact_book/widgets/canvas.dart';
import 'package:contact_book/widgets/contact_row.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  final Function(Contact contact) goToContact;
  final Function(Contact contact) removeContact;
  final List<Contact> contacts;

  const MainScreen({super.key, required this.goToContact, required this.contacts, required this.removeContact});

  @override
  Widget build(BuildContext context) {
    List<ContactRow> contactrows = [];

    for (var contact in contacts) {
      contactrows.add(ContactRow(
        contact: contact,
        openContactDetails: goToContact,
        removeContact: removeContact,
      ));
    }

    return MessengerCanvas(
      widget: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...contactrows,
          ],
        ),
      ),
    );
  }
}
