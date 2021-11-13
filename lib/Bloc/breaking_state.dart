import 'package:equatable/equatable.dart';
import 'package:tudotask/Modals/modalclass.dart';


abstract class BreakingState extends Equatable{
@override
  List<Object?>get props=>[];
}
class BreakingLoadingState extends BreakingState{
  @override
  List<Object> get props=>[];
}


class BreakingInitialState extends BreakingState{
  @override
  List<Object> get props=>[];
}


class BreakingLoadedState extends BreakingState{
   List<BreakingBad> breakingBad;
  BreakingLoadedState({required this.breakingBad});
}

class BreakingErrorState extends BreakingState{
  late final String error;
  BreakingErrorState({required this.error});

}
