//event load

//delete <== position del evento que quieres eliminar

//enum ya solo responde datos para obte... necesita ser una class
//clase padre
class NewsEvents{}

class LoadEvent extends NewsEvents{

}

class DeleteEvent extends NewsEvents{
  final int position;

  DeleteEvent(this.position);

}