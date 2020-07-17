import 'package:higgletaskapp/UserModel.dart';
import 'package:stacked/stacked.dart';

class UsersListViewModel extends BaseViewModel {
  UserModel _userModelGlobal;

  UsersListViewModel({UserModel userModel}) : _userModelGlobal = userModel;

  num get id {
    return _userModelGlobal.id;
  }

  String get firstName {
    return _userModelGlobal.firstName;
  }

  String get lastName {
    return _userModelGlobal.lastName;
  }

  String get avatar {
    return _userModelGlobal.avatar;
  }

  String get email {
    return _userModelGlobal.email;
  }

  bool get isSelected {
    return _userModelGlobal.isSelected;
  }

  select() {
    _userModelGlobal.isSelected = true;
  }

  unSelect() {
    _userModelGlobal.isSelected = false;
  }
}
