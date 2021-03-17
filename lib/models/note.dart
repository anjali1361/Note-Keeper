class Note{
  int _id;//id in database will be generated automatically
  String _title;
  String _description;
  String _date;
  int _priority;

  Note(this._title,this._date,this._priority,[this._description]);//_description here is optional parameter
  Note.withId(this._id,this._title,this._date,this._priority,[this._description]);

  int get id => _id;//getter methods for all instance variable
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  set title(String newTitle){
    if(newTitle.length<= 255){
      this._title = newTitle;
    }
  }
  set description(String newDesc){
    if(newDesc.length<= 255){
      this._description = newDesc;
    }
  }
  set priority(int newPriority){
    if(newPriority >= 1 && newPriority <=2){
      this._priority = newPriority;
    }
  }
  set date(String newDate){
    if(newDate.length<= 255){
      this._date = newDate;
    }
  }

  //convert a Note object into a Map object
  Map<String, dynamic> toMap(){//dynamic type will work for both int and String entries
    var map = Map<String,dynamic>();
    if(id != null){
      map['id'] =_id;
    }

    map['title'] = _title;
    map['description'] =_description;
    map['priority'] = _priority;
    map['date'] =_date;

    return map;

  }

  //Extract a Note object from a map object
Note.fromMapObject(Map<String,dynamic> map){
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];
}

}
