import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'home_page.dart';
import 'new_contacts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'state management demo',
    home: const HomePage(),
    routes: {'/new-contact': (context) => const NewContactView()},
  ));
}

class Contact {
  final String id;
  final String name;
  final int number;
  Contact({required this.name, required this.number}) : id = const Uuid().v4();
}

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstance() : super([]); //contact data
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  int get length => value.length;

  void add({required Contact contact}) {
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
  }

  void remove({required Contact contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      value = contacts;
      notifyListeners();
    }
  }

  Contact? contact({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}
