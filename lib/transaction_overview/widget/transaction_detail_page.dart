import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:transaction_api/transaction_api.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({Key? key, required this.tx}) : super(key: key);
  final Transaction tx;
  @override
  Widget build(BuildContext context) {
    return TransactionDetailPageView(tx: tx);
  }
}

class TransactionDetailPageView extends StatelessWidget {
  const TransactionDetailPageView({
    Key? key,
    required this.tx,
  }) : super(key: key);
  final Transaction tx;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topCenter,
                      color: Colors.blueGrey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context, 0),
                                icon: Icon(
                                  Icons.clear_rounded,
                                ),
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context, 1);
                                    },
                                    icon: Icon(Icons.delete_outline),
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: Icon(
                                Icons.dinner_dining,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  )
                ],
              ),
              Positioned(
                top: constraints.maxHeight * 2 / 3 - 25,
                left: constraints.maxWidth / 15,
                width: constraints.maxWidth * 13 / 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Icon(
                        Icons.local_drink,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(tx.title),
                        Text('+ ${tx.amount} \$'),
                      ],
                    ),
                    Divider(
                      thickness: 3,
                      height: 20,
                      color: Colors.black,
                    ),
                    Text(tx.desc),
                    Text(tx.date.toString()),
                    Text(tx.mainType),
                    Text(tx.subType),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
