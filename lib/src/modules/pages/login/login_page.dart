import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBarTitle: AppLocalizations.of(context)!.login_page,
        body: const Center(
          child: SingleChildScrollView(),
        ));
  }
}
