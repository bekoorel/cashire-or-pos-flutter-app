//........................................................
class possec {
  var id;
  var name;

  possec({
    this.id,
    this.name,
  });

  factory possec.fromJson(Map<String, dynamic> json) {
    return possec(
      id: json["id"],
      name: json["name"],
    );
  }
}
//..........................................................

class positms {
  var id;
  var name;
  var discrpshn;
  var count;
  var price;
  var secshn;

  positms({
    this.id,
    this.name,
    this.discrpshn,
    this.count,
    this.price,
    this.secshn,
  });

  factory positms.fromJson(Map<String, dynamic> json) {
    return positms(
      id: json["id"],
      name: json["name"],
      discrpshn: json["discrpshn"],
      count: json["count"],
      price: json["price"],
      secshn: json["secshn"],
    );
  }
}

//...............................................

class showposlive {
  var id;
  var name;
  var count;
  var amount;
  var totalcashe;

  showposlive({
    this.id,
    this.name,
    this.count,
    this.amount,
    this.totalcashe,
  });

  factory showposlive.fromJson(Map<String, dynamic> json) {
    return showposlive(
      id: json["id"],
      name: json["name"],
      count: json["count"],
      amount: json["amount"],
      totalcashe: json["totalcash"],
    );
  }
}

//...............................

class showhis {
  var id;
  var numinvocehis;
  var invojson;
  var total;

  showhis({
    this.id,
    this.numinvocehis,
    this.invojson,
    this.total,
  });

  factory showhis.fromJson(Map<String, dynamic> json) {
    return showhis(
      id: json["id"],
      numinvocehis: json["numinvocehis"],
      invojson: json["invojson"],
      total: json["total"],
    );
  }
}
