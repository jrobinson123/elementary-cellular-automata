# elementary-cellular-automata

An implementation of elementary cellular automata. The cellular automata is made up of cells. A cell is essentially a square which has a three values, an x and y coordinate, and a value which tells whether the cell has a value of "1"(drawn in white) or "0"(drawn in black). The Cell class has two methods, show: which displays the cell in the correct color, and update which changes the value of the cell. 

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
My implementation uses a 2D array of Cell(s). The size of array is based on a desired size of each Cell and is calculated so that Cell(s) fillup the entire screen. Each cell is initialized with a unique x, y coordinate. The value is set to "1" but this is arbitrary and doesn't end up changing the program. 
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
In my implementation the value for each Cell is computed every frame.  This is done through the updateValues function. This function takes in two parameters, the array values: the initial values for the first row, and the String ruleset. This function will through a double for loop in order to access every Cell in cells. 

```processing
void updateValues(String[] values,String ruleset){
    
   for(int j = 0; j < cells.length; j++){
      for(int i = 0; i < cells[0].length; i++){
```
Cells in each row will then be set to a corresponding value in values. When j = 0(ie the first row) the values of this row are simpy set to values passed in as an argument. 
```processing
           cells[i][j].update(values[i]);
```
However, the values array then updates based on the ruleset. In order to compute each new value in values, we take an element of values and its two neighboring elements and combine them(they are Strings and will concatanate). We then put this concatanated value into the applyRule function. The applyRule function will take in a three digit string of 0s and 1s and return a new value depending on which of the eight possible combinations the input is. The ruleset determines how possible input combinations correspond to outputted values. 

```processing
      String[] temp = new String[values.length];
      for(int m = 0; m < values.length; m++){
          
           String new_value = "";
          
            if(m == 0){
              new_value = values[values.length - 1] + values[0] + values[1];
            }else if(m == values.length - 1){
              new_value = values[cells.length - 2] + values[cells.length - 1] + values[0];
            }else{
              new_value = values[m - 1] + values[m] + values[m + 1];
            }
           
            temp[m] = applyRule(new_value, ruleset);
            
        }
        for(int t = 0; t < values.length; t++){
          values[t] = temp[t];
        }
     }
```
Every frame the updateValues function is called on new values and a new ruleset. These are determined by mapping the x and y mouse position between 0 and a power of two minus one. For example, since we want ruleset to be a string of 8 0s and 1s, we map between the x-position between 0 and 255( (2 ** 8) - 1). We then convert the value to binary. That way we'll get our ruleset as some string between 00000000 and 11111111. 

```processing
  ruleset = binary(int(map(mouseX,0,width,0,255)),8);
  String[] values = new String[quantity];
  float temp_fl = map(mouseY,1,height - 1,0,pow(2,quantity) - 1);
  int temp_int = int(temp_fl);
  
  
  String valuesStr = binary(temp_int, quantity);
  for(int r = 0; r < values.length; r ++){
    values[r] = valuesStr.substring(r, r + 1);
  }
  
  updateValues(values,ruleset);
```
Finally, we dispaly the Cell(s) in cells.
```processing
  for(int i = 0; i < cells.length; i++){
      for(int j = 0; j < cells[0].length; j++){
        cells[i][j].show();
      }
    }
```

