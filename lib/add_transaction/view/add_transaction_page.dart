import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/add_transaction/bloc/add_transaction_bloc.dart';
import 'package:personal_finance_app/add_transaction/widget/widgets.dart';
import 'package:transaction_repository/transaction_repository.dart';

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
    return BlocConsumer<AddTransactionBloc, AddTransactionState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == AddTransactionStatus.success,
      listener: (context, state) => Navigator.of(context).pop(),
      builder: (context, state) {
        return AddTransactionView();
      },
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
          title: const Text('Add tx'),
          actions: [
            IconButton(
              onPressed: () => {
                context.read<AddTransactionBloc>()
                  ..add(const AddTransactionSubmitted())
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
                    const DateSelect(),
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
