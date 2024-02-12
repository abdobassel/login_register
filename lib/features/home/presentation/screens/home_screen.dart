import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:project/core/constants.dart';
import 'package:project/features/home/presentation/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavyBar(
              showElevation: true,
              itemCornerRadius: 24,
              curve: Curves.easeIn,
              backgroundColor: Colors.black,
              items: [
                BottomNavyBarItem(
                    textAlign: TextAlign.center,
                    icon: const FaIcon(FontAwesomeIcons.images),
                    title: const Text('Al Images')),
                BottomNavyBarItem(
                    textAlign: TextAlign.center,
                    icon: const FaIcon(FontAwesomeIcons.upload),
                    title: const Text('Upload Image')),
                BottomNavyBarItem(
                    textAlign: TextAlign.center,
                    icon: const FaIcon(FontAwesomeIcons.listCheck),
                    title: const Text('Tasks')),
                BottomNavyBarItem(
                    textAlign: TextAlign.center,
                    icon: const FaIcon(FontAwesomeIcons.penToSquare),
                    title: const Text('Add Tasks')),
                BottomNavyBarItem(
                    textAlign: TextAlign.center,
                    icon: const FaIcon(FontAwesomeIcons.user),
                    title: const Text('Settings')),
              ],
              onItemSelected: (index) {
                cubit.changeBtmNavBar(index);
              },
              selectedIndex: cubit.currentIndex,
            ),
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              actions: [
                IconButton(
                    onPressed: () {
                      signOut(context);
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
