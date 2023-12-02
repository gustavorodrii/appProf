String getErrorString(String? code) {
  if (code == '') {
    return 'Erro desconhecido';
  } else if (code == 'weak-password') {
    return 'Sua senha é muito fraca';
  } else if (code == 'invalid-email') {
    return 'Seu e-mail é inválido.';
  } else if (code == 'email-already-in-use') {
    return 'E-mail já está sendo utilizado em outra conta.';
  } else if (code == 'invalid-credential') {
    return 'Seu e-mail é inválido.';
  } else if (code == 'wrong-password') {
    return 'Sua senha está incorreta.';
  } else if (code == 'user-not-found') {
    return 'Não há usuário com este e-mail.';
  } else if (code == 'user-disabled') {
    return 'Este usuário foi desabilitado.';
  } else if (code == 'too-many-requests') {
    return 'Muitas solicitações. Tente novamente mais tarde.';
  } else if (code == 'operation-not-allowed') {
    return 'Operação não permitida.';
  } else if (code == 'email-not-verified') {
    return 'Login ainda não foi verificado. Acesse seu email!';
  } else {
    return 'Um erro indefinido ocorreu.';
  }
}
