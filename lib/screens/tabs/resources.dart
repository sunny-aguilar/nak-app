import 'package:flutter/material.dart';
import 'constants.dart';

class Resources extends StatefulWidget {
  const Resources({Key? key}) : super(key: key);

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Nu Alpha Kappa remains committed to the well being of our members and the community as a whole. \n\nBrowse the Resources sub menu items for links to various resources.Your well being matters to us.",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          _buildPanel(),
        ],
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              // subtitle:
              //     const Text('To delete this panel, tap the trash can icon'),
              // trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {});
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });
}

List<Item> generateItems(int numberOfItems) {
  List<String> title = [
    "Alcohol and Drugs Policy",
    "Anti-Hazing Policy",
    "Anti-Retaliation Policy",
    "Crisis Management Plan",
    "Ethical Values Principles",
    "Good Samaritan Policy",
    "Risk Management Education",
    "Sexual Misconduct Policy",
  ];

  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: title[index],
      expandedValue: policies[index],
    );
  });
}
