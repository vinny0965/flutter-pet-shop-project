class SiginUpWithEmailAndPasswordFailure {
  final String message;

  const SiginUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error ocurred."]);

  factory SiginUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SiginUpWithEmailAndPasswordFailure(
            'Por favor digite uma senha forte');
      case 'invalid-email':
        return const SiginUpWithEmailAndPasswordFailure('Email incorreto');
      case 'email-already-in-use':
        return const SiginUpWithEmailAndPasswordFailure(
            'Já existe uma conta para este usuário');
      case 'operation-not-allowed':
        return const SiginUpWithEmailAndPasswordFailure(
            'Operação não permitida');
      case 'user-disable':
        return const SiginUpWithEmailAndPasswordFailure(
            'Por favor digite uma senha forte');

      default:
        return const SiginUpWithEmailAndPasswordFailure();
    }
  }
}
