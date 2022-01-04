

class Cell{
  int x, y;
  String value;
  Cell(int x, int y, String value){
    this.x = x;
    this.y = y;
    this.value = value;
    
  }
  void show(){
    stroke(0);
    if(this.value.equals("1")){
      fill(255);
    }else{
      fill(0);
    }
    rect(x,y,size,size);
  }
  void update(String value){
    this.value = value;
  }
}
