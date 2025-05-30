import 'package:flutter/material.dart';
import 'package:estate2/components/app_button.dart';
import 'package:estate2/components/app_input.dart';
import 'package:estate2/components/app_padding.dart';
import 'package:estate2/components/gap.dart';
import 'package:estate2/components/login_footer.dart';
import 'package:estate2/constant/colors.dart';
import 'package:estate2/utils/helper.dart';
import 'package:estate2/utils/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final focusNodeEmail = FocusNode();
  final focusNodePassword = FocusNode();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    Helper helper = Helper();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: AppPadding(
          padddingValue: 15,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    child: const Image(
                      width: 80,
                      fit: BoxFit.cover,
                      image: AssetImage("lib/assets/logo.png"),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Let's ",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Gap(isWidth: false, isHeight: true, height: height * 0.02),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      AppInput(
                          myController: email,
                          focusNode: focusNodeEmail,
                          onFiledSubmitedValue: (value) {
                            print(value);
                          },
                          keyBoardType: TextInputType.emailAddress,
                          obscureText: false,
                          isFilled: true,
                          hinit: "Enter Email",
                          leftIcon: true,
                          icon: const Icon(Icons.email),
                          onValidator: (value) {
                            if (value.isEmpty)
                              return 'Enter email';
                            else if (!helper.emailValid(value))
                              return "Enter invalid email";
                          }),
                      Gap(
                          isWidth: false,
                          isHeight: true,
                          height: height * 0.019),
                      AppInput(
                          myController: password,
                          focusNode: focusNodePassword,
                          onFiledSubmitedValue: (value) {
                            print(value);
                          },
                          keyBoardType: TextInputType.text,
                          obscureText: true,
                          hinit: "Enter Password",
                          leftIcon: true,
                          icon: const Icon(Icons.lock),
                          isFilled: true,
                          onValidator: (value) {
                            if (value.isEmpty)
                              return 'Enter Password';
                            else if (value.length < 4)
                              return "Password at least 6 characters ";
                          }),
                    ],
                  ),
                ),
                Gap(isWidth: false, isHeight: true, height: height * 0.019),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.forgotPasswordScreen);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Gap(isWidth: false, isHeight: true, height: height * 0.04),
                AppButton(
                  onPress: () {
                    if (_formkey.currentState!.validate()) {
                      print("okay");
                      _formkey.currentState!.reset();
                      Navigator.pushNamed(context, RoutesName.faqScreen);
                    }
                  },
                  title: "Login",
                  height: 63,
                  textColor: AppColors.whiteColor,
                ),
                const LoginFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
