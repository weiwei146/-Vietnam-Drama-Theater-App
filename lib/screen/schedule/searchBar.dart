import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';






class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;

  const CustomSearchBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {

  var allItems = List.generate(50, (index) => 'items $index');
  var items = [];
  var searchHistory = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState () {
    super.initState();
    searchController.addListener(queryListener);
  }

  @override
  void dispose() {
    searchController.removeListener(queryListener);
    searchController.dispose();
    super.dispose();
  }
  void queryListener() {
    search(searchController.text);
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        items = allItems;
      });
    } else {
      setState(() {
        items = allItems.where((e) => e.toLowerCase().contains(query.toLowerCase())).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 16.0),

          SearchBar(
            controller: searchController,
            leading: IconButton(
              onPressed: () {
                // Handle leading icon button press
              },
              icon: Icon(Icons.search),
            ),
            hintText: 'Tìm kiếm',
          ),
          const SizedBox(height: 20.0,),
          Expanded(
            child: ListView.builder(
                itemCount: items.isEmpty ? allItems.length : items.length,
                itemBuilder: (context, index) {
                  final item = items.isEmpty ? allItems[index] : items[index];
                  return Card(
                    child: Column(
                      children: [
                        Text('Name: $item'),
                        const SizedBox(height: 8.0,),
                        Text(item)
                      ],
                    ),
                  );
            }),
          )
        ],
      ),
    );
  }
}
