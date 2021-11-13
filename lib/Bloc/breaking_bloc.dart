import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tudotask/Modals/modalclass.dart';
import 'package:tudotask/Services/service_api.dart';
import 'breaking_state.dart';

import 'breaking_event.dart';

import 'package:bloc/bloc.dart';

class BreakingBloc extends Bloc<BreakingEvent, BreakingState> {
  BreakingApi breakingApi;

 // late List<BreakingBad> breakingBad;

  BreakingBloc({required this.breakingApi}) : super(BreakingInitialState());

  @override
  // TODO: implement initialState
  BreakingState get initialState => BreakingInitialState();



  @override
  Stream<BreakingState> mapEventToState(BreakingEvent event) async* {
    if(event is FetchBreakingEvent){
      yield BreakingLoadingState();
      try{
        List<BreakingBad> breakingBad=await breakingApi.getBreakingBad();
        yield BreakingLoadedState(breakingBad:breakingBad);

      }catch(e){
        yield BreakingErrorState(error: e.toString());
      }
    }
  }
}
