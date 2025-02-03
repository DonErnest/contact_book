import 'package:contact_book/data.dart';
import 'package:flutter/material.dart';

class ContactRow extends StatelessWidget {
  final Function(Contact contact) openContactDetails;
  final Function(Contact contact) removeContact;
  final Contact contact;

  const ContactRow(
      {super.key, required this.contact, required this.openContactDetails, required this.removeContact});

  @override
  Widget build(BuildContext context) {
    List<Widget> row_content = [
      Text(
        "${contact.firstName} ${contact.lastName ?? ''}",
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
      const Spacer(),
      ElevatedButton(
          onPressed: () => {openContactDetails(contact)},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .primaryFixed,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.arrow_forward_sharp,
                color: Theme
                    .of(context)
                    .colorScheme
                    .onSecondaryFixed),
          ))
    ];
    if (contact.todayIsBirthday) {
      row_content.insert(
        2,
        Icon(Icons.card_giftcard,
            color: Theme
                .of(context)
                .colorScheme
                .primaryFixed),
      );
      row_content.insert(3, SizedBox(width: 15));
    }

    return Dismissible(
      key: Key(contact.id.toString()),
      onDismissed: (_) => removeContact(contact),
      background: Container(
        color: Theme
            .of(context)
            .colorScheme
            .onPrimaryFixedVariant,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: row_content,
        ),
      ),
    );
  }
}
