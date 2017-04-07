IntList collatzArray;
FloatList rotateArray;

void setup(){
  size(1000, 1000);
  for(int i = 1; i <= 1000; i++){
    collatzArray = new IntList();
    rotateArray = new FloatList();
    collatz(i);
  }
}

void draw(){
  for(int i = collatzArray.size()-1; i >= 0; i--){
    float px = map(i, 0, collatzArray.size(), 0, width);
    float px2 = map(i+1, 0, collatzArray.size(), 0, width);
    //point(px, collatzArray.get(i));
    if(i+1 < collatzArray.size()){
      line(px, collatzArray.get(i), px2, collatzArray.get(i+1));
    }
  }
  
}

boolean collatz(int num){
  collatzArray.append(num);
  if(num == 1){
    println(collatzArray.size());
    println(rotateArray.size());
    return true;
  }
  if(num%2 == 0){
    num = num/2;
    rotateArray.append(-QUARTER_PI);
    collatz(num);
  }
  else{
    rotateArray.append(QUARTER_PI);
    num = num*3+1;
    collatz(num);
  }
  return false;
}