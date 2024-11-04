part of 'client_bloc.dart';

class ClientState extends Equatable {
  const ClientState({
    this.clientList = const [],
  });

  final List<ClientModel> clientList;
  ClientState copyWith({
    List<ClientModel>? clientList,
  }) {
    return ClientState(
      clientList: clientList ?? this.clientList,
    );
  }

  @override
  List<Object> get props => [clientList];
}
