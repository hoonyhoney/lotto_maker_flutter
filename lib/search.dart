import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = ""; //현재 검색값

  _SearchState(){ //filter에 addListener를 붙이는 방식으로 코드를 작성
    _filter.addListener(() {
      setState(() {
        _searchText= _filter.text;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
