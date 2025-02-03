import 'package:contact_book/data.dart';
import 'package:flutter/material.dart';

class ContactDetail extends StatelessWidget {
  final Contact contact;

  const ContactDetail({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    var fullName = contact.firstName;
    var textTheme = Theme.of(context).textTheme.titleLarge!;

    if (contact.lastName != null) {
      fullName += " ${contact.lastName}";
    }
    List<Widget> contactData = [
      Row(
        children: [
          Expanded(
              child: Text(
            fullName,
            style: Theme.of(context).textTheme.displayMedium!,
          )),
        ],
      ),
      Divider(thickness: 2),
    ];

    if (contact.email != null) {
      contactData.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Email: ",
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              contact.email!,
              style: textTheme,
            ),
          ),
        ],
      ));
    }

    if (contact.phoneNumber != null) {
      contactData.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Phone number:",
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              contact.phoneNumber!,
              style: textTheme,
            ),
          ),
        ],
      ));
    }

    if (contact.dateOfBirth != null) {
      contactData.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Date of birth:",
                style: textTheme.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: Text(
              formatDate(contact.dateOfBirth!),
              style: textTheme,
            ))
          ],
        ),
      );
    }
    contactData.add(

      Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => {Navigator.pop(context)},
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
    return Container(
      color: Theme.of(context).colorScheme.primaryFixedDim,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: contactData,
      ),
    );
  }
}
