import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sqlite/share.dart' show BestMatches;

class SearchTabWidget extends StatefulWidget {
  @override
  _SearchTabWidgetState createState() => _SearchTabWidgetState();
}

class _SearchTabWidgetState extends State<SearchTabWidget> {
  List<BestMatches> userModels = [];

  @override
  void initState() {
    super.initState();
    _getDataFromApi();
  }

  void _getDataFromApi() async {
    var response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=tencent&apikey=demo'));

    print(response.body);
    setState(() {
      var parsedResponse = json.decode(response.body);
      userModels = (parsedResponse['bestMatches'] as List)
          .map((data) => BestMatches.fromJson(data))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Trade Brains'),
        ),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Autocomplete<BestMatches>(
              optionsViewBuilder: (BuildContext context, Function onSelect,
                  Iterable<BestMatches> dataList) {
                return Material(
                  child: ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        BestMatches b = dataList.elementAt(index);
                        return InkWell(
                          onTap: () => onSelect(b),
                          child: ListTile(
                            title: Text(b.s2Name!),
                            trailing: Icon(Icons.add),
                          ),
                        );
                      }),
                );
              },
              optionsBuilder: (TextEditingValue value) {
                if (value.text.isEmpty) {
                  return List.empty();
                }
                return userModels.where((Element) => Element.s2Name!
                    .toLowerCase()
                    .contains(value.text.toLowerCase()));
              },
              onSelected: (value) => print(value.s2Name),
              displayStringForOption: (BestMatches b) =>
                  '${b.s2Name} ${b.s9MatchScore}',
            ),
          ),
        )));
  }
}
