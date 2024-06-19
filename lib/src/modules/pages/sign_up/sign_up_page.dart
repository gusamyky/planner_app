import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/config/styles/app_colors.dart';
import 'package:planner_app/src/core/helpers/form_validation_helper.dart';
import 'package:planner_app/src/core/utils/constants.dart';
import 'package:planner_app/src/modules/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:planner_app/src/widgets/custom_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => sl<SignUpCubit>(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {},
        builder: (context, state) {
          return CustomScaffold(
              appBarTitle: AppLocalizations.of(context)!.sign_up_page,
              body: SingleChildScrollView(
                child: _SignUpForm(),
              ));
        },
      ),
    );
  }
}

class _SignUpForm extends StatefulWidget {
  _SignUpForm({super.key});

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const _SignUpTitleWidget(),
            const SizedBox(height: Constants.padding20),
            _BuildNameField(
              nameController: _nameController,
            ),
            const SizedBox(height: Constants.padding20),
            _BuildEmailField(
              emailController: _emailController,
            ),
            const SizedBox(height: Constants.padding20),
            _BuildPasswordField(
              passwordController: _passwordController,
            ),
            const SizedBox(height: Constants.padding20),
            _BuildSignUpButton(formKey),
          ],
        ),
      ),
    );
  }
}

class _SignUpTitleWidget extends StatelessWidget {
  const _SignUpTitleWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.sign_up_for_sync,
          style: Theme.of(context).textTheme.titleLarge,
        )
      ],
    );
  }
}

class _BuildNameField extends StatelessWidget with FormValidationHelper {
  const _BuildNameField({required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.name,
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp('[a-zA-Z, -,ĄąĆćĘęŁłŃńÓóŚśŹźŻż]'),
        ),
      ],
      onChanged: (value) => context.read<SignUpCubit>().onChangeName(value),
      validator: (value) => isNameValid(value!.trim())
          ? null
          : AppLocalizations.of(context)!.incorrect_data_has_been_entered,
    );
  }
}

class _BuildEmailField extends StatelessWidget with FormValidationHelper {
  const _BuildEmailField({required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const <String>[AutofillHints.email],
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(hintText: 'Email'),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.deny(' '),
      ],
      onChanged: (value) => context.read<SignUpCubit>().onChangeEmail(value),
      validator: (value) => isEmailValid(value!.trim())
          ? null
          : AppLocalizations.of(context)!.incorrect_data_has_been_entered,
    );
  }
}

class _BuildPasswordField extends StatelessWidget with FormValidationHelper {
  const _BuildPasswordField({required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const <String>[AutofillHints.password],
      textInputAction: TextInputAction.next,
      obscureText: true,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.password,
      ),
      onChanged: (value) => context.read<SignUpCubit>().onChangePassword(value),
      validator: (value) => isPasswordValid(value!.trim())
          ? null
          : AppLocalizations.of(context)!.incorrect_data_has_been_entered,
    );
  }
}

class _BuildSignUpButton extends StatelessWidget {
  const _BuildSignUpButton(this.formKey);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<SignUpCubit>().signUp();
            }
          },
          child: state.status == StateStatus.sending
              ? const CircularProgressIndicator(
                  color: AppColors.orange,
                )
              : Text(AppLocalizations.of(context)!.sign_up),
        );
      },
    );
  }
}

//name
//mail
//pass
//confirm pass
