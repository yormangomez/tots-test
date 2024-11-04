enum Environments {
  ///Production environment.
  prod('Prod'),

  ///Pre production environment.
  dev('Dev');

  const Environments(this.string);

  ///value of the specific [Environments].
  final String string;

  ///Factory of the specific [Environments].
  factory Environments.fromValue(String value) {
    return values.firstWhere(
      (e) => e.string == value,
      orElse: () => values.first,
    );
  }
}

class Env {
  Env({required this.value});

  Environments value;

  ///BaseURl var for the specific [Env].
  String get baseURL {
    final values = [
      "https://d2spennbj78dir.cloudfront.net",
      "https://o74okdi088.execute-api.us-west-2.amazonaws.com/prod",
    ];
    if (values.length > 1) {
      switch (value) {
        case Environments.prod:
          return values[0];
        case Environments.dev:
          return values[1];
      }
    }

    return const String.fromEnvironment('BASE_URL_',
        defaultValue:
            'https://kdep0i9a61.execute-api.us-west-1.amazonaws.com/prod');
  }

  @override
  String toString() {
    return 'Env: $value';
  }
}
