enum PaymentErrorEnum {
  contactBankError(
    errorTitle: 'El pago fue rechazado',
    errorDescription: 'Comunicate con el banco emisor de tu tarjeta o utilizá otro método de pago.',
    errorPrincipalButton: 'Aceptar',
    errorSecondButton: 'Utilizar otro método de pago',
  ),
  maxLimitAttempts(
    errorTitle: 'Se alcanzó el límite de intentos erróneos',
    errorDescription: 'Comunicate con el banco emisor de tu tarjeta o utilizá otro método de pago.',
    errorPrincipalButton: 'Aceptar',
    errorSecondButton: 'Utilizar otro método de pago',
  ),
  noInEffectCard(
    errorTitle: 'La tarjeta ingresada aún no está vigente',
    errorDescription: 'Intentá nuevamente utilizando otro método de pago.',
    errorPrincipalButton: 'Aceptar',
    errorSecondButton: 'Utilizar otro método de pago',
  ),
  dueDateError(
    errorTitle: 'La fecha de vencimiento ingresada es errónea',
    errorDescription: 'Intentá nuevamente utilizando otro método de pago.',
    errorPrincipalButton: 'Aceptar',
    errorSecondButton: 'Utilizar otro método de pago',
  ),
  noFundsError(
    errorTitle: 'La tarjeta no tiene fondos suficientes',
    errorDescription: 'Intentá nuevamente utilizando otro método de pago.',
    errorPrincipalButton: 'Aceptar',
    errorSecondButton: 'Utilizar otro método de pago',
  ),
  expiredCard(
    errorTitle: 'La tarjeta ingresada está vencida',
    errorDescription: 'Intentá nuevamente utilizando otro método de pago.',
    errorPrincipalButton: 'Aceptar',
    errorSecondButton: 'Utilizar otro método de pago',
  ),
  cvvError(
    errorTitle: 'El código de seguridad ingresado es erróneo',
    errorDescription: 'Intentá nuevamente utilizando otro método de pago.',
    errorPrincipalButton: 'Aceptar',
    errorSecondButton: 'Utilizar otro método de pago',
  ),
  limitCardError(
    errorTitle: 'La tarjeta ingresada posee límite insuficiente',
    errorDescription: 'Intentá nuevamente utilizando otro método de pago o comunicate con el banco emisor.',
    errorPrincipalButton: 'Aceptar',
    errorSecondButton: 'Utilizar otro método de pago',
  ),
  mpRedirectionError(
      errorTitle: "Tuvimos un problema al re direccionarte a Mercado Pago",
      errorDescription:
          "Por favor, intentá nuevamente o utilizá otro método de pago.",
      errorPrincipalButton: "Intentar nuevamente",
      errorSecondButton: "Utilizar otro método de pago"
  ),
  mpPaymentNotFound(
      errorTitle: "No encontramos un pago asociado a ese número de trámite",
      errorDescription:
          "Revisá tu saldo ingresando a Facturas o comunicate con Swity, tu asistente virtual, por WhatsApp.",
      errorPrincipalButton: "Aceptar",
      errorSecondButton: "Abrir WhatsApp"
  ),
  mpDelayedPaymentValidation(
      errorTitle: "Tenemos demoras para validar el pago",
      errorDescription:
          "La generación del comprobante y la actualización de tu saldo pueden verse afectadas. Te recomendamos comunicarte con Mercado Pago para verificar el estado de la operación.",
      errorPrincipalButton: "Aceptar",
  ),
  mpPaymentStatusValidationFailure(
      errorTitle: "No pudimos validar el estado del pago",
      errorDescription:
          "Revisá tu saldo ingresando a Facturas o comunicate con Swity, tu asistente virtual, por WhatsApp.",
      errorPrincipalButton: "Aceptar",
      errorSecondButton: "Abrir WhatsApp"
  ),
  mpPaymentRejected(
      errorTitle: "El pago no pudo ser efectuado",
      errorDescription:
          "Por favor, intentá nuevamente o utilizá otro método de pago.",
      errorPrincipalButton: "Intentar nuevamente",
      errorSecondButton: "Utilizar otro método de pago"
  ),
  genericError(
    errorTitle: 'Tuvimos un problema al realizar el pago',
    errorDescription: 'Por favor, intentá nuevamente más tarde.',
    errorPrincipalButton: 'Aceptar',
  );

  const PaymentErrorEnum({
    required this.errorTitle,
    required this.errorDescription,
    required this.errorPrincipalButton,
    this.errorSecondButton,
  });

  final String errorTitle;
  final String errorDescription;
  final String errorPrincipalButton;
  final String? errorSecondButton;
}