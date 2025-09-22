import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/core/helper_functions/builderror_bar.dart';
import 'package:fruits_market/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_market/core/widgets/custom_progress_h_u_d.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignUpViewBlocConsumer extends StatelessWidget {
  const SignUpViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSucsses) {
          Navigator.pop(context);
        }

        if (state is SignupFailure) {
          buildErrorBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is SignupLoading ? true : false,
          child: SignupViewBody(),
        );
      },
    );
  }
}
