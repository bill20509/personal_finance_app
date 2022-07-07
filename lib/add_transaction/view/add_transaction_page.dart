import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/add_transaction/bloc/add_transaction_bloc.dart';
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
              onPressed: () => context
                  .read<AddTransactionBloc>()
                  .add(const AddTransactionSubmitted()),
              icon: const Icon(Icons.check),
            ),
          ],
        ),
        body: Column(
          children: [
            _tabView(),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: _photoField(),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      _amountField(),
                      _titleField(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _tabView extends StatelessWidget {
  const _tabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Column(
        children: [
          TabBar(
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
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            width: double.infinity,
            height: 200,
            child: const TabBarView(
              children: <Widget>[
                Center(
                  child: Text("It's income"),
                ),
                Center(
                  child: Text("It's outcome here"),
                ),
                Center(
                  child: Text("It's what here"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _titleField extends StatelessWidget {
  const _titleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 20,
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        hintText: 'title',
      ),
      onChanged: (title) => context
          .read<AddTransactionBloc>()
          .add(AddTransactionTitleChanged(title)),
    );
  }
}

class _amountField extends StatelessWidget {
  const _amountField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        hintText: 'amount',
      ),
      onChanged: (amount) => context.read<AddTransactionBloc>().add(
            AddTransactionAmountChanged(
              double.parse(amount),
            ),
          ),
    );
  }
}

class _photoField extends StatelessWidget {
  const _photoField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Icon(
        Icons.camera_alt,
      ),
    );
  }
}
