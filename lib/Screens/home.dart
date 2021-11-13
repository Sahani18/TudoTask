import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tudotask/Bloc/breaking_bloc.dart';
import 'package:tudotask/Bloc/breaking_event.dart';
import 'package:tudotask/Bloc/breaking_state.dart';
import 'package:tudotask/Modals/modalclass.dart';

import 'character_detail_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late BreakingBloc breakingBloc;
  ScrollController _scrollController = ScrollController();
  int data = 10;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          if (data <= 50) {
            data = data + 10;
          }
        });
      }
    });
    breakingBloc = BlocProvider.of<BreakingBloc>(context);
    breakingBloc.add(FetchBreakingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocListener<BreakingBloc, BreakingState>(
          listener: (context, state) {
            if (state is BreakingErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          child: BlocBuilder<BreakingBloc, BreakingState>(
            builder: (context, state) {
              if (state is BreakingInitialState) {
                return buildLoading();
              } else if (state is BreakingLoadingState) {
                return buildLoading();
              } else if (state is BreakingLoadedState) {
                return breakingLoadedStateList(state.breakingBad);
              } else if (state is BreakingErrorState) {
                return buildErrorUi(state.error);
              }

              throw Exception();
            },
          ),
        ),
      ),
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  breakingLoadedStateList(List<BreakingBad> breakingBad) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: data + 1,
      itemBuilder: (context, index) {
        if (index == data) {
          return const CupertinoActivityIndicator();
        } else {
          return ListTile(
              horizontalTitleGap: 30,
              leading: Container(
                height: 50,
                width: 50,
                child: Image.network(
                  breakingBad[index].image,
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(breakingBad[index].name),
              subtitle: Text(breakingBad[index].birthday),
              onTap: () {
                navigateToDetailScreen(breakingBad[index]);
              });
        }
      },
    );
  }

  navigateToDetailScreen(BreakingBad breakingBad) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailScreen(breakingBad: breakingBad)));
  }

  Widget buildErrorUi(String error) {
    return Center(
      child: Text(error),
    );
  }
}
