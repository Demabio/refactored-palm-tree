import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/map_screen/models/map_model.dart';part 'map_event.dart';part 'map_state.dart';/// A bloc that manages the state of a Map according to the event that is dispatched to it.
class MapBloc extends Bloc<MapEvent, MapState> {MapBloc(MapState initialState) : super(initialState) { on<MapInitialEvent>(_onInitialize); }

_onInitialize(MapInitialEvent event, Emitter<MapState> emit, ) async  {  } 
 }
