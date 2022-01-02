# elementary-cellular-automata

An implementation of elementary cellular automata. The cellular automata is made up of cells. A cell is essentially a square which has a three values, an x and y coordinate, and a value which tells whether the cell has a value of "1"(drawn in white) or "0"(drawn in black). The Cell class has two methods, show: which displays the cell in the correct color, and update which changes the value of cell. 

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
My implementation uses a 2D array of Cell s . The size of array is based on a desired size of each Cell and designed to fillup the entire screen. 
```processing
Cell[][] cells;
void setup(){
  size(600,600);
  rectMode(CORNER);
  size = 20;
  quantity = int(width/size);
  cells = new Cell[width / size][height / size];
  for(int i = 0; i < cells.length; i++){
    for(int j = 0; j < cells[0].length; j++){
      cells[i][j] = new Cell(i * size, j * size, "1");
    }
  }
```
