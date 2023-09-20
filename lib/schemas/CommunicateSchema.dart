class CommunicateSchema {
  static const String SEND_SMS = r"""
    mutation ($number: String, $user: ID, $message: String) {
      createSms(
        newSms: { number: $number, utilisateur: $user, message: $message }
      ) {
        ok
        errors {
          field
          messages
        }
        sms {
          id
          status
          message
          number
          createdAt
        }
      }
    }
  """;
}
