import 'package:contact_book/data.dart';
import 'package:contact_book/screens/contact_detail.dart';
import 'package:contact_book/screens/main_screen.dart';
import 'package:contact_book/screens/new_contact.dart';
import 'package:flutter/material.dart';

class MessengerPrototype extends StatefulWidget {
  const MessengerPrototype({super.key});

  @override
  State<MessengerPrototype> createState() => _MessengerPrototypeState();
}

class _MessengerPrototypeState extends State<MessengerPrototype> {
  var userContacts = contacts;

  void browseContact(Contact selectedContact) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => ContactDetail(
        contact: selectedContact,
      ),
    );
  }

  void addContact(Contact newContact) {
    setState(() {
      userContacts.add(newContact);
    });
  }

  void removeContact(Contact contact) {
    setState(() {
      userContacts.remove(contact);
    });
  }

  void openAddContactSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Wrap(
        children: [
          NewContact(
            onContactCreated: addContact,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = MainScreen(
      contacts: userContacts,
      goToContact: browseContact,
      removeContact: removeContact,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Book"),
        actions: [
          IconButton(
            onPressed: openAddContactSheet,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: screen,
    );
  }
}
