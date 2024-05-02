// import 'package:flutter/material.dart';
//
// class SearchBar extends StatefulWidget {
//   const SearchBar({super.key});
//
//   @override
//   State<SearchBar> createState() => SearchBarState();
// }
//
// class SearchBarState extends State<SearchBar> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SearchAnchor(
//       builder: (BuildContext context, SearchController controller) {
//         return SearchBar(
//           controller: controller,
//           padding: const MaterialStatePropertyAll<EdgeInsets>(
//               EdgeInsets.symmetric(horizontal: 16.0)),
//           onTap: () {
//             controller.openView();
//           },
//           onChanged: (_) {
//             controller.openView();
//           },
//           leading: const Icon(Icons.search)
//         );
//         }, suggestionsBuilder:
//         (BuildContext context, SearchController controller) {
//       return List<ListTile>.generate(5, (int index) {
//         final String item = 'item $index';
//         return ListTile(
//           title: Text(item),
//           onTap: () {
//             setState(() {
//               controller.closeView(item);
//             });
//           },
//               );
//             });
//           });
//   }
// }
