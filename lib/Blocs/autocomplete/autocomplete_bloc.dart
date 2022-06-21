import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:test/Repositories/Places/places_repository.dart';
import 'package:test/models/searchbox_places.dart';
part 'autocomplete_state.dart';
part 'autocomplete_event.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;

  AutocompleteBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(AutocompleteLoading());

  @override
  Stream<AutocompleteState> mapEventToState(
    AutocompleteEvent event,
  ) async* {
    if (event is LoadAutocomplete) {
      yield* _mapLoadAutocompleteToState(event);
    }
  }

  Stream<AutocompleteState> _mapLoadAutocompleteToState(
      LoadAutocomplete event) async* {
    _placesSubscription?.cancel();

    final List<PlaceAutocomplete> autocomplete =
        await _placesRepository.getAutocomplete(event.searchInput);

    yield AutocompleteLoaded(autocomplete: autocomplete);
  }
}
