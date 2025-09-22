import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/constans.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/utils/app_images.dart';
import 'package:fruits_market/core/widgets/custom_button.dart';
import 'package:fruits_market/core/widgets/custom_text.dart';
import 'package:fruits_market/core/widgets/custom_text_field.dart';
import 'package:fruits_market/core/widgets/or_divider.dart';
import 'package:fruits_market/core/widgets/password_field.dart';
import 'package:fruits_market/features/auth/presentation/cubits/signin_cubit/sign_in_cubit.dart';
import 'package:fruits_market/features/auth/presentation/views/forget_password_view.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/social_button.dart';
import 'package:gap/gap.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              const Gap(24),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const Gap(16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'نسيت كلمة المرور؟',
                  onPressed: () {
                    Navigator.pushNamed(context, ForgetPasswordView.routeName);
                  },
                  color: AppColors.lightPrimaryColor,
                ),
              ),
              const Gap(15),
              CustomButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signInWithEmailAndPassword(
                      email,
                      password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const Gap(33),
              const DontHaveAccountWidget(),
              const Gap(33),
              OrDivider(text: 'أو'),
              const Gap(20),
              SocialButton(
                text: 'تسجيل بواسطة جوجل',
                assetPath: Assets.imagesGoogle,
                onTap: () {
                  context.read<SignInCubit>().signInWithGoogle();
                },
              ),
              const Gap(16),

              SocialButton(
                text: 'تسجيل بواسطة أبل',
                assetPath: Assets.imagesApple,
                onTap: () {
                  context.read<SignInCubit>().signInWithApple();
                },
              ),
              const Gap(16),

              SocialButton(
                text: 'تسجيل بواسطة فيسبوك',
                assetPath: Assets.imagesFacebook,
                onTap: () {
                  context.read<SignInCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
