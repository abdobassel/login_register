import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/home/presentation/cubit/home_cubit.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, sate) {},
        builder: (context, state) {
          return Center(
            child: Text(' Tasks Screen'),
          );
        });
  }
}
