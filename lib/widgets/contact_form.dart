import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nak_app/models/palette.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  Widget initScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Add TextFormFields and ElevatedButton here.
            const Text("CONTACT US"),
            nameTextField(nameController),
            emailTextField(emailController),
            messageTextField(messageController),
            const SizedBox(
              height: 20.0,
            ),
            submitButton(
              context,
              _formKey,
              nameController,
              emailController,
              messageController,
            )
          ],
        ),
      ),
    );
  }
}

Widget nameTextField(nameController) {
  return TextFormField(
    controller: nameController,
    decoration: const InputDecoration(
      // icon: Icon(Icons.person),
      hintText: "Enter your name",
      focusColor: Colors.red,
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(3.0),
      // ),
    ),
    // The validator receives the text that the user has entered.
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  );
}

Widget emailTextField(emailController) {
  return TextFormField(
    controller: emailController,
    decoration: const InputDecoration(
      // icon: Icon(Icons.email),
      hintText: "Enter your email",
    ),
    // The validator receives the text that the user has entered.
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  );
}

Widget messageTextField(messageController) {
  return TextFormField(
    controller: messageController,
    maxLines: 6,
    decoration: const InputDecoration(
      // icon: Icon(Icons.sticky_note_2),
      hintText: "Enter yourmessage",
    ),
    // The validator receives the text that the user has entered.
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  );
}

Widget submitButton(
  BuildContext context,
  _formKey,
  nameController,
  emailController,
  messageController,
) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () async {
        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState!.validate()) {
          final response = await sendEmail(nameController.value.text,
              emailController.value.text, messageController.value.text);
          ScaffoldMessenger.of(context).showSnackBar(
            response == 200
                ? const SnackBar(
                    content: Text('Message Sent!'),
                    backgroundColor: Palette.nakBronze)
                : const SnackBar(
                    content: Text('Failed to send message!'),
                    backgroundColor: Palette.nakRed),
          );
          nameController.clear();
          emailController.clear();
          messageController.clear();
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
      child: RichText(
        text: const TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                Icons.send,
                size: 18,
              ),
            ),
            TextSpan(
                text: " SEND",
                style: TextStyle(
                  fontSize: 18,
                )),
          ],
        ),
      ),
    ),
  );
}

Future sendEmail(String name, String email, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceId = 'service_zum49nw';
  const templateId = 'template_ww9njjh';
  const userId = 'G4tGyqwwq0P-XRPUI';
  final response = await http.post(url,
      headers: {
        'Content-Type': 'application/json'
      }, //This line makes sure it works for all platforms.
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'from_name': name,
          'from_email': email,
          'message': message
        }
      }));
  return response.statusCode;
}
