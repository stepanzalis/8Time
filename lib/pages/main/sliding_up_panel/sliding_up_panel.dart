import 'package:eighttime/blocs/activities_bloc/bloc.dart';
import 'package:eighttime/pages/main/loading_indicator.dart';
import 'package:eighttime/pages/main/sliding_up_panel/activities/activities_list.dart';
import 'package:eighttime/pages/main/sliding_up_panel/activities/activityEditForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// ignore: must_be_immutable
class MySlidingUpPanel extends StatefulWidget {
  PanelController quickActivitiesController;

  MySlidingUpPanel({Key key, @required this.quickActivitiesController})
      : super(key: key);

  @override
  _MySlidingUpPanelState createState() => new _MySlidingUpPanelState();
}

class _MySlidingUpPanelState extends State<MySlidingUpPanel> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        isDraggable: false,
        controller: widget.quickActivitiesController,
        maxHeight: MediaQuery
            .of(context)
            .size
            .height,
        minHeight: 1,
        panel: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: <Widget>[
                Text(
                  "Quick ",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "Activities",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            actions: <Widget>[
              Material(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ActivityEditForm()),
                      );
                    },
                    child: Container(
                      width: 55,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    )),
              )
            ],
          ),
          body: Container(
            color: Colors.white,
            child: BlocBuilder<ActivitiesBloc, ActivitiesState>(
              // ignore: missing_return
              builder: (context, state) {
                if (state is ActivitiesLoading) {
                  return LoadingIndicator();
                }
                if (state is ActivitiesLoaded) {
                  return ActivitiesList(activities: state.activities);
                }
              },
            ),
          ),
        ));
  }
}
