import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionOverviewPage extends StatelessWidget {
  const TransactionOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransactionOverviewView();
  }
}

class TransactionOverviewView extends StatelessWidget {
  const TransactionOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
      ),
      body: MultiBlocListener(listeners: [],child: BlocProvider(create: () => (),child: Container(),),),
    );
  }
}
