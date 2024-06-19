import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_page_state.dart';
part 'account_page_cubit.freezed.dart';

class AccountPageCubit extends Cubit<AccountPageState> {
  AccountPageCubit() : super(AccountPageState.initial());
}
