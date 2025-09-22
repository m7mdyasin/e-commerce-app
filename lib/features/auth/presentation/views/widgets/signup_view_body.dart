import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/constans.dart';
import 'package:fruits_market/core/helper_functions/builderror_bar.dart';
import 'package:fruits_market/core/widgets/custom_button.dart';
import 'package:fruits_market/core/widgets/custom_text_field.dart';
import 'package:fruits_market/core/widgets/password_field.dart';
import 'package:fruits_market/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/agrreement_widget.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/have_account.dart';
import 'package:gap/gap.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, email, password;
  late bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const Gap(24),

              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              const Gap(16),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.name,
              ),
              const Gap(16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const Gap(16),

              AgrreementWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const Gap(30),

              CustomButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    if (isTermsAccepted) {
                      (context)
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            name,
                          );
                    } else {
                      buildErrorBar(
                        context,
                        'يجب عليك الموافقة على الشروط والاحكام',
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const Gap(26),

              HaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
