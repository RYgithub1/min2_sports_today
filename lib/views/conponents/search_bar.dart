import 'package:flutter/material.dart';



class SearchBar extends StatelessWidget {
  /// [final ValueChanged<String>? onSubmitted; -> define property with ValueChanged type]
  final ValueChanged onSearch;   /// [Type is "ValueChanged"]
  SearchBar({this.onSearch});

  final TextEditingController _textEditingController = TextEditingController();


  /// [========= build() =========]
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            maxLines: 1,
            controller: _textEditingController,
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              hintText: "Search here",
              border: InputBorder.none,
            ),
            /// [final ValueChanged<String>? onSubmitted; -> define property with ValueChanged type]
            onSubmitted: onSearch,
          ),
        )
      ),
    );
  }
}