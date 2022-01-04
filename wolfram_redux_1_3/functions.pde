

String applyRule(String s, String ruleset){
  String value = "";
  
  if (!(s == "000" || s == "001" || s == "010" || s == "011" || s == "100" || s == "101" || s == "110" || s == "111")){
   // println(s);
  }
  switch(s){
    case "000":
        value =  ruleset.substring(0,1);
        break;
    case "001":
        value = ruleset.substring(1,2);
        break;
    case "010":
        value =  ruleset.substring(2,3);
        break;
    case "011":
        value =  ruleset.substring(3,4);
        break;
    case "100":
        value =  ruleset.substring(4,5);
        break;
    case "101":
        value =  ruleset.substring(5,6);
        break;
    case "110":
        value =  ruleset.substring(6,7);
        break;
    case "111":
        value =  ruleset.substring(7,8);
        break;
    default:
        //println(s);
        value = "-1";
        break;
  }
  return value;
}


void updateValues(String[] values,String ruleset){
    
   for(int j = 0; j < cells.length; j++){
      for(int i = 0; i < cells[0].length; i++){
           cells[i][j].update(values[i]);
      }
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
      
    }
