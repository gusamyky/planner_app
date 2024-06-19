import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/config/routes/app_router.dart';
import 'package:planner_app/src/config/styles/palette.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBarTitle: AppLocalizations.of(context)!.account,
        body: const Center(
          child: SingleChildScrollView(
            child: _NotLoggedInScreen(),
          ),
        ));
  }
}

class _NotLoggedInScreen extends StatelessWidget {
  const _NotLoggedInScreen();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.u_are_not_logged_in,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: Constants.padding20),
        ElevatedButton(
            onPressed: () {
              context.router.push(const LoginRoute());
            },
            child: Text(AppLocalizations.of(context)!.log_in)),
        const SizedBox(height: Constants.padding10),
        ElevatedButton(
            onPressed: () {
              context.router.push(const SignUpRoute());
            },
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor:
                    const MaterialStatePropertyAll(Palette.toDoColor)),
            child: Text(AppLocalizations.of(context)!.sign_up))
      ],
    );
  }
}
