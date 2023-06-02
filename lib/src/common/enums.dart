/// Cubit statuses initial success error loading
enum CubitStatus { initial, success, error, loading }

extension CubitStatusX on CubitStatus {
  bool get isInitial => this == CubitStatus.initial;

  bool get isSuccess => this == CubitStatus.success;

  bool get isError => this == CubitStatus.error;

  bool get isLoading => this == CubitStatus.loading;
}

enum RewardStatus { init, allRewardsScanned, scanned }

extension RewardStatusX on RewardStatus {
  bool get isAllRewardsScanned => this == RewardStatus.allRewardsScanned;

  bool get isScanned => this == RewardStatus.scanned;
}

enum RewardAccessStatus {
  activated,
  notActive,
  hide,
  selected,
}

extension RewardAccessStatusX on RewardAccessStatus {
  bool get isActivated => this == RewardAccessStatus.activated;

  bool get isNotActive => this == RewardAccessStatus.notActive;

  bool get isHide => this == RewardAccessStatus.hide;

  bool get isSelected => this == RewardAccessStatus.selected;
}
