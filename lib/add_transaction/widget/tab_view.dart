import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Column(
        children: [
          TabBar(
            onTap: (value) {},
            labelColor: Theme.of(context).primaryColor,
            tabs: const <Widget>[
              Tab(
                text: 'income',
              ),
              Tab(
                text: 'outcome',
              ),
              Tab(
                text: 'what',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
