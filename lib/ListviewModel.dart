import 'package:higgletaskapp/ApiService.dart';
import 'package:higgletaskapp/UserModel.dart';
import 'package:higgletaskapp/UsersLIstViewModel.dart';
import 'package:stacked/stacked.dart';

import 'Loading.dart';

class ListViewModel extends BaseViewModel {
  List<UsersListViewModel> usersList = List<UsersListViewModel>();
  bool selectionMode = false;
  LoadingStatus loadingStatus = LoadingStatus.loading;

  ListViewModel() {
    _populateUsers();
  }

  void _populateUsers() async {
    this.loadingStatus = LoadingStatus.loading;
    this.usersList = [];
    notifyListeners();
    List<UserModel> usersTempList = [];
    for (int i = 1; i < 3; i++) {
      List<UserModel> temp = [];
      temp = await ApiService.fetchUsers(i);
      usersTempList.addAll(temp);
    }
    this.usersList = usersTempList
        .map((usrMod) => UsersListViewModel(userModel: usrMod))
        .toList();
    notifyListeners();
    this.loadingStatus = this.usersList.isEmpty
        ? LoadingStatus.loading
        : LoadingStatus.completed;
    notifyListeners();
  }

  select(int index) {
    usersList[index].select();
    notifyListeners();
  }

  unSelect(int index) {
    usersList[index].unSelect();
    notifyListeners();
  }

  clearSelection() {
    for (int i = 0; i < usersList.length; i++) {
      usersList[i].unSelect();
    }
    notifyListeners();
  }
}
