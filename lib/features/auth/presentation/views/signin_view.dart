import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/core/services/getit_service.dart';
import 'package:fruits_market/core/widgets/custom_app_bar.dart';
import 'package:fruits_market/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_market/features/auth/presentation/cubits/signin_cubit/sign_in_cubit.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(title: 'تسجيل دخول', context),
        body: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
