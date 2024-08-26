enum TimePeriod { today, week, month }

extension Variables on TimePeriod {
  int duration() {
    switch (this) {
      case TimePeriod.today:
        return 1;
      case TimePeriod.week:
        return 7;
      case TimePeriod.month:
        return 30;
    }
  }

  String text() {
    switch (this) {
      case TimePeriod.today:
        return 'Today';
      case TimePeriod.week:
        return 'Week';
      case TimePeriod.month:
        return 'Month';
    }
  }
}
