import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/app/bloc/login/bloc/login_bloc.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const l = [1, 2, 3, 4, 5, 6, 7, 7, 8, 8, 9, 9, 0];

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Drawer(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: state.status == LoginStatus.login &&
                          state.account?.photoUrl != null
                      ? Center(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(state.account!.photoUrl!),
                          ),
                        )
                      : Center(
                          child: Row(
                            children: const [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  'assets/user_page/user.png',
                                ),
                              ),
                              Text('Please Sign in'),
                            ],
                          ),
                        ),
                ),
              ),
              Expanded(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      onTap: () {
                        if (state.status == LoginStatus.logout) {
                          context
                              .read<LoginBloc>()
                              .add(const GoogleLoginRequested());
                        } else {
                          context
                              .read<LoginBloc>()
                              .add(const LogoutRequested());
                        }
                      },
                      title: state.status == LoginStatus.login
                          ? const Text('Log out')
                          : const Text('Log in'),
                    ),
                    ListTile(
                      onTap: () {
                        context
                            .read<LoginBloc>()
                            .add(const GoogleLoginRequested());
                      },
                      title: Text('login'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
