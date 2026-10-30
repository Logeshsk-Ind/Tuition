class Board {
  const Board({required this.name, required this.classes});

  final String name;
  final List<String> classes;

  Board copyWith({String? name, List<String>? classes}) =>
      Board(name: name ?? this.name, classes: classes ?? this.classes);

  Map<String, Object?> toJson() => {'name': name, 'classes': classes};

  factory Board.fromJson(Map<String, dynamic> json) => Board(
        name: json['name'] as String,
        classes: (json['classes'] as List<dynamic>).cast<String>(),
      );
}

class Student {
  const Student({
    required this.id,
    required this.name,
    required this.parentName,
    required this.mobileNumber,
    required this.board,
    required this.className,
    required this.joiningMonth,
    required this.monthlyFee,
    this.customFields = const {},
  });

  final String id;
  final String name;
  final String parentName;
  final String mobileNumber;
  final String board;
  final String className;
  final String joiningMonth;
  final double monthlyFee;
  final Map<String, String> customFields;

  Student copyWith({
    String? name,
    String? parentName,
    String? mobileNumber,
    String? board,
    String? className,
    String? joiningMonth,
    double? monthlyFee,
    Map<String, String>? customFields,
  }) =>
      Student(
        id: id,
        name: name ?? this.name,
        parentName: parentName ?? this.parentName,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        board: board ?? this.board,
        className: className ?? this.className,
        joiningMonth: joiningMonth ?? this.joiningMonth,
        monthlyFee: monthlyFee ?? this.monthlyFee,
        customFields: customFields ?? this.customFields,
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'name': name,
        'parentName': parentName,
        'mobileNumber': mobileNumber,
        'board': board,
        'className': className,
        'joiningMonth': joiningMonth,
        'monthlyFee': monthlyFee,
        'customFields': customFields,
      };

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'] as String,
        name: json['name'] as String,
        parentName: json['parentName'] as String,
        mobileNumber: json['mobileNumber'] as String,
        board: json['board'] as String,
        className: json['className'] as String,
        joiningMonth: json['joiningMonth'] as String,
        monthlyFee: (json['monthlyFee'] as num).toDouble(),
        customFields: (json['customFields'] as Map<String, dynamic>? ?? {})
            .map((key, value) => MapEntry(key, value as String)),
      );
}

class FeePayment {
  const FeePayment({
    required this.id,
    required this.studentId,
    required this.amount,
    required this.month,
    required this.method,
    required this.paidAt,
  });

  final String id;
  final String studentId;
  final double amount;
  final String month;
  final String method;
  final String paidAt;

  Map<String, Object?> toJson() => {
        'id': id,
        'studentId': studentId,
        'amount': amount,
        'month': month,
        'method': method,
        'paidAt': paidAt,
      };

  factory FeePayment.fromJson(Map<String, dynamic> json) => FeePayment(
        id: json['id'] as String,
        studentId: json['studentId'] as String,
        amount: (json['amount'] as num).toDouble(),
        month: json['month'] as String,
        method: json['method'] as String,
        paidAt: json['paidAt'] as String,
      );
}
