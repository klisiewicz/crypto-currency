import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final ValueChanged<String> onChange;

  const SearchAppBar({Key key, @required this.title, this.onChange})
      : assert(title != null),
        super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  SearchBar searchBar;
  Timer _debounce;

  @override
  void initState() {
    super.initState();
    searchBar = new SearchBar(
      inBar: true,
      setState: setState,
      onChanged: _notifyTextChangeWithDebounce,
      onClosed: () {
        widget.onChange(null);
      },
      closeOnSubmit: false,
      clearOnSubmit: false,
      onSubmitted: (value) {},
      buildDefaultAppBar: _buildAppBar,
    );
  }

  void _notifyTextChangeWithDebounce(String text) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(
      Duration(milliseconds: 500),
      () {
        widget.onChange(text);
      },
    );
  }

  Widget _buildAppBar(BuildContext context) => AppBar(
        title: Text(widget.title),
        actions: [searchBar.getSearchAction(context)],
      );

  @override
  Widget build(BuildContext context) => searchBar.build(context);
}
