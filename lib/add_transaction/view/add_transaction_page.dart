import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/add_transaction/bloc/add_transaction_bloc.dart';
import 'package:personal_finance_app/add_transaction/widget/desc_field.dart';
import 'package:personal_finance_app/add_transaction/widget/sub_type.dart';
import 'package:transaction_repository/transaction_repository.dart';

import '../widget/widgets.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);
  static Route<void> route() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => AddTransactionBloc(
          transactionRepository: context.read<TransactionRepository>(),
        ),
        child: AddTransactionPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTransactionBloc, AddTransactionState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == AddTransactionStatus.success,
      listener: (context, state) => Navigator.of(context).pop(),
      child: AddTransactionView(),
    );
  }
}

class AddTransactionView extends StatelessWidget {
  const AddTransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add tx'),
          actions: [
            IconButton(
              onPressed: () {
                context
                    .read<AddTransactionBloc>()
                    .add(const AddTransactionSubmitted());
                print(context.read<AddTransactionBloc>().state.dateTime);
              },
              icon: const Icon(Icons.check),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TabView(),
              Container(
                color: Colors.grey[300],
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: PhotoField(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              AmountField(),
                              TitleField(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const MainType(),
                    const SubType(),
                    const DescType(),
                  ],
                ),
              ),
              // DatePicker(),
            ],
          ),
        ),
      ),
    );
  }
}
