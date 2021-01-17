import 'package:flutter/material.dart';



class SearchBar extends StatelessWidget {
  /// [final ValueChanged<String>? onSubmitted; -> define property with ValueChanged type]
  final ValueChanged onSearch;   /// [Type is "ValueChanged"]
  SearchBar({this.onSearch});

  final TextEditingController _textEditingController = TextEditingController();

  /// [========= build() =========]
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(16)),
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