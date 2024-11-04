part of 'client_bloc.dart';

sealed class ClientEvent extends Equatable {
  const ClientEvent();

  @override
  List<Object> get props => [];
}

class GetClientEvent extends ClientEvent {
  const GetClientEvent();

  @override
  List<Object> get props => [];
}

class CreaterClientEvent extends ClientEvent {
  final String firstName;
  final String lastName;
  final String email;
  final BuildContext context;

  const CreaterClientEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.context,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        context,
      ];
}

class UpdateClientEvent extends ClientEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String id;
  final BuildContext context;

  const UpdateClientEvent({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.context,
  });

  @override
  List<Object> get props => [
        id,
        firstName,
        lastName,
        email,
        context,
      ];
}
