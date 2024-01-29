import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/core/colors_app.dart';
import 'package:project/core/components.dart';
import 'package:project/features/login/presentation/screens/login_screen.dart';
import 'package:project/features/login/presentation/widgets/separated_widget_row.dart';
import 'package:project/features/login/presentation/widgets/social_auth.dart';
import 'package:project/features/register/presentation/cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = RegisterCubit.get(context);
            // old code before refactor => onchange();

            //   cubit.countCharacters(text: _passControler.text);
            // cubit.isTextHaseUpperCase(text: _passControler.text);
            return Scaffold(
              appBar: DefaultAppBar(
                context: context,
                title: 'Create an Acount',
                actions: [
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: ColorApp.hint, fontSize: 16),
                        )),
                  )
                ],
                leading: IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: ColorApp.hint,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextForm(
                            onchange: (text) {
                              print(text);
                            },
                            controller: _emailControler,
                            labeltext: 'Email',
                            type: TextInputType.emailAddress),
                        const SizedBox(
                          height: 25,
                        ),
                        DefaultTextForm(
                            onchange: (text) {
                              _passControler.text = text!;
                              cubit.countCharacters(text: text);
                              cubit.isTextHaseUpperCase(text: text);
                              print(text);
                            },
                            isPassword: cubit.isPassword,
                            sufxBtn: cubit.isPassword ? 'view' : 'Hide',
                            showPassfunc: () {
                              cubit.showPass();
                            },
                            controller: _passControler,
                            labeltext: 'Password',
                            type: TextInputType.visiblePassword),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              cubit.charactersCompleted
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Minimum 8 Characters',
                              style: TextStyle(
                                  color: ColorApp.hint,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              state is ShowCharactresHasUppercaseState
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'one UpperCase and one Lowercase',
                              style: TextStyle(
                                  color: ColorApp.hint,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        DefaultButton(
                            text: 'Create Acount',
                            isUperCase: false,
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            background: ColorApp.Btn,
                            radius: 30),
                        const SizedBox(
                          height: 25,
                        ),
                        const SeparatedWidgetDeviderAndText(),
                        const SizedBox(
                          height: 14,
                        ),
                        const SocialAuthLogin(),
                        Center(
                          child: InkWell(
                            splashColor: ColorApp.ScafflodColor,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text('Login With Email',
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ]),
                ),
              ),
            );
          },
        ));
  }
}
