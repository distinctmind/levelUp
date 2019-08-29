import 'package:flutter/material.dart';

class AdventureList extends StatelessWidget {
  final List<String> adventureList;
  AdventureList(this.adventureList);

  @override
  Widget build(BuildContext context) {
    return adventureList.length == 0
        ? Container(
            alignment: Alignment.center,
            child: Text('No Adventures Yet.. Time to go on one..', textAlign: TextAlign.center,))
        : ListView.builder(
            itemCount: adventureList.length,
            itemBuilder: (ctx, index) {
              return Container(
                child: ListTile(
                  title: Text('hello'),
                ),
              );
            },
          );
  }
}
