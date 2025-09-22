import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/core/helper_functions/builderror_bar.dart';
import 'package:fruits_market/features/auth/presentation/cubits/signin_cubit/sign_in_cubit.dart';
import 'package:fruits_market/core/widgets/custom_progress_h_u_d.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSucsses) {}
        if (state is SignInFailure) {
          buildErrorBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is SignInLoading ? true : false,
          child: SigninViewBody(),
        );
      },
    );
  }
}
