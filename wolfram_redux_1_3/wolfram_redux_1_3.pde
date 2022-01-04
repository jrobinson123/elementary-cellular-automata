

int size;
String[] Values;
String[] testValues;
String ruleset;
int quantity;

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
  ruleset = "00011110";
}


void draw(){
  
  
  ruleset = binary(int(map(mouseX,0,width,0,255)),8);
  String[] values = new String[quantity];
  float temp_fl = map(mouseY,1,height - 1,0,pow(2,quantity) - 1);
  int temp_int = int(temp_fl);
  
  
  String valuesStr = binary(temp_int, quantity);
  for(int r = 0; r < values.length; r ++){
    values[r] = valuesStr.substring(r, r + 1);
  }
  
  updateValues(values,ruleset);
  
  for(int i = 0; i < cells.length; i++){
    for(int j = 0; j < cells[0].length; j++){
      cells[i][j].show();
    }
  }
}
