enum BaseStateStatus {
  init,
  idle,
  loading,
  success,
  loadMoreSuccess,
  failed,
}

extension BaseBaseStateStatusExt on BaseStateStatus {
  bool get isLoading {
    switch (this) {
      case BaseStateStatus.loading:
        return true;
      case BaseStateStatus.init:
      case BaseStateStatus.success:
      case BaseStateStatus.failed:
      case BaseStateStatus.loadMoreSuccess:
      case BaseStateStatus.idle:
        return false;
    }
  }

  bool get success {
    switch (this) {
      case BaseStateStatus.success:
        return true;
      case BaseStateStatus.init:
      case BaseStateStatus.loading:
      case BaseStateStatus.failed:
      case BaseStateStatus.loadMoreSuccess:
      case BaseStateStatus.idle:
        return false;
    }
  }

  bool get failed {
    switch (this) {
      case BaseStateStatus.failed:
        return true;
      case BaseStateStatus.init:
      case BaseStateStatus.success:
      case BaseStateStatus.loading:
      case BaseStateStatus.loadMoreSuccess:
      case BaseStateStatus.idle:
        return false;
    }
  }
}
