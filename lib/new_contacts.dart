import 'package:flutter/material.dart';

import 'main.dart';

class NewContactView extends StatefulWidget {
  const NewContactView({super.key});

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  late final TextEditingController _controller;
  late final  _NameController;

  @override
  void initState() {
    _controller = TextEditingController();
    _NameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller = TextEditingController();
    _NameController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new contact'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
          ),
          TextField(
            controller: _NameController,
            decoration: const InputDecoration(
              hintText: 'Phone number',
            ),
          ),
          TextButton(
              onPressed: () {
                final contact = Contact(name: _controller.text , number: _NameController.value,);
                ContactBook().add(contact: contact);
                Navigator.of(context).pop();
              },
              child: const Text('Add Contact'))
        ],
      ),
    );
  }
}
