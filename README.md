# elementary-cellular-automata

An implementation of elementary cellular automata. A cell is essentially a square which has a three values, an x and y coordinate, and a value which tells whether the cell has a value of "1"(drawn in white) or "0"(drawn in black). 
```processing
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
```


Each generation is a an collection of ones and zeroes(represented geometrically as a row of black and white squares). Starting with a base generation, each subsequent generation is determined by the previous one based on a rule. Each rule 
