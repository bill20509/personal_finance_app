import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/add_transaction/bloc/add_transaction_bloc.dart';

class MainType extends StatelessWidget {
  const MainType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainType = [
      'food',
      'traffic',
      'game',
      'house',
      'daily',
      'pet',
      'anime',
      'internet',
      'habbit'
    ];
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Text(
              '分類 : ',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () async {
              final result = await showDialog<String>(
                context: context,
                builder: (context) => AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.7,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text(
                          'Main type',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        ListTile(
                          leading: Icon(Icons.add),
                          title: Text('Add new main type'),
                          onTap: () {},
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: mainType.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.dinner_dining),
                                      title: Text(mainType[index]),
                                      onTap: () {
                                        Navigator.pop(
                                          context,
                                          mainType[index],
                                        );
                                      },
                                    ),
                                    Divider(),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              if (result != null) {
                context
                    .read<AddTransactionBloc>()
                    .add(AddTransactionMainTypeChanged(result));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: BlocBuilder<AddTransactionBloc, AddTransactionState>(
                builder: (context, state) {
                  return Text(
                    state.mainType,
                    style: Theme.of(context).textTheme.bodyText1,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
