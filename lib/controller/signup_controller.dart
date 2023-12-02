import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool showErrors = false.obs;

//name
  RxString name = ''.obs;
  void setName(String setName) {
    name.value = setName;
    update();
  }

  Rx<String?> get nameErrorText {
    if (!showErrors.value) {
      return null.obs;
    }

    if (name.value.trim().isEmpty) {
      return "Nome inválido!".obs;
    } else {
      return null.obs;
    }
  }

  //phone

  RxString phone = ''.obs;

  void setPhone(String setPhone) {
    phone.value = setPhone;
    update();
  }

  Rx<String?> get phoneErrorText {
    if (!showErrors.value) {
      return null.obs;
    }

    if (phone.value.trim().isEmpty) {
      return "Telefone inválido!".obs;
    } else if (phone.value.length < 14) {
      return "Telefone inválido, complete o número!".obs;
    } else {
      return null.obs;
    }
  }

  //email
  RxString emaill = ''.obs;

  void setEmail(String setEmail) {
    emaill.value = setEmail;
    update();
  }

  Rx<String?> get emailErrorText {
    if (!showErrors.value) {
      return null.obs;
    }

    if (emaill.trim().isEmpty || !emaill.contains("@")) {
      return 'E-mail inválido!'.obs;
    } else {
      return null.obs;
    }
  }

  //birth
  RxString birth = ''.obs;

  void setBirth(String setBirth) {
    birth.value = setBirth;
    update();
  }

  Rx<String?> get birthErrorText {
    if (!showErrors.value) {
      return null.obs;
    }

    if (birth.value.trim().length < 10) {
      return "Idade inválida, complete a data!".obs;
    } else {
      return null.obs;
    }
  }

  // pass & confirm pass
  RxString pass = ''.obs;

  void setPass(String setPass) {
    pass.value = setPass;
    update();
  }

  Rx<String?> get passErrorText {
    if (!showErrors.value) {
      return null.obs;
    }

    if (pass.value.length < 6) {
      return "Minímo de 6 caracteres".obs;
    } else {
      return null.obs;
    }
  }

  RxString passConfirm = ''.obs;

  void setPassConfirm(String setPassConfirm) {
    passConfirm.value = setPassConfirm;
    update();
  }

  Rx<String?> get passConfirmErrorText {
    if (!showErrors.value) {
      return null.obs;
    }

    if (passConfirm != pass) {
      return "A senhas informadas não são iguais!".obs;
    } else {
      return null.obs;
    }
  }

  //validate
  bool get formIsValid {
    if (!showErrors.value) return false;

    return nameErrorText.value == null &&
        emailErrorText.value == null &&
        passErrorText.value == null &&
        passConfirmErrorText.value == null;
  }

  bool validate() {
    showErrors.value = true;
    update();
    return formIsValid;
  }

  //dropdown
  RxString valueDropDown = "Selecione".obs;

  void setValueDropDown(String _valueDropDown) {
    valueDropDown.value = _valueDropDown;
    update();
  }

  bool isDropDownValidate = true;
  bool dropDownValidate(String valueDropDown) {
    if (valueDropDown.isEmpty) {
      isDropDownValidate = false;
      update();
      return false;
    } else {
      isDropDownValidate = true;
      update();
      return true;
    }
  }

  final List<String> dropOptions = [
    'Selecione',
    'Aluno',
    'Professor',
  ];

  Rx<String?> get selectCameFrom {
    if (!showErrors.value) {
      return null.obs;
    }
    if (valueDropDown != 'Selecione') {
      return null.obs;
    }
    return 'Selecione uma opção'.obs;
  }
}
