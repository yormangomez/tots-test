import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tots/core/database/login_store.dart';

part 'client_event.dart';
part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ClientRepository _clientRepository;

  ClientBloc({
    required ClientRepository clientRepository,
  })  : _clientRepository = clientRepository,
        super(const ClientState()) {
    on<ClientEvent>((event, emit) {});

    on<GetClientEvent>((event, emit) async {
      final result = await _clientRepository.getClient(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${LoginStore.instance.accessToken}',
        },
      );

      result.fold((l) {}, (r) {
        emit(state.copyWith(clientList: r));
      });
    });

    on<CreaterClientEvent>((event, emit) async {
      final result = await _clientRepository.createrClient(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${LoginStore.instance.accessToken}',
        },
      );

      result.fold((l) {}, (r) {
        if (r) {
          Navigator.pop(event.context);
          add(const GetClientEvent());
        }
      });
    });
    on<UpdateClientEvent>((event, emit) async {
      final result = await _clientRepository.updateClient(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        id: event.id,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${LoginStore.instance.accessToken}',
        },
      );

      result.fold((l) {}, (r) {
        if (r) {
          Navigator.pop(event.context);
          add(const GetClientEvent());
        }
      });
    });
  }
}
