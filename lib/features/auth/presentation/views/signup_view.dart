import 'package:flutter/material.dart';
import 'package:fruits_market/core/services/getit_service.dart';
import 'package:fruits_market/core/widgets/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/features/auth/domain/repos/auth_repo.dart';

import 'package:fruits_market/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_market/features/auth/presentation/views/sign_up_view_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: 'حساب جديد'),
        body: SignUpViewBlocConsumer(),
      ),
    );
  }
}
