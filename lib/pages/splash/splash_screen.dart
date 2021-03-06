import 'package:eighttime/blocs/authentication_bloc/bloc.dart';
import 'package:eighttime/blocs/splash_screen_bloc/bloc.dart';
import 'package:eighttime/pages/splash/splash_screen_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
          create: (BuildContext context) => SplashScreenBloc(),
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: Colors.orange,
            child: Center(
              child: BlocConsumer<SplashScreenBloc, SplashScreenState>(
                  listenWhen: (_, state) => state is Loaded,
                  listener: (context, state) {
                    return BlocProvider.of<AuthenticationBloc>(context)
                        .add(AppStarted());
              },
                  buildWhen: (_, state) =>
                  (state is Initial) || (state is Loading),
                  builder: (context, state) => SplashScreenWidget()),
            ),
          ),
        ));
  }
}
