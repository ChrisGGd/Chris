int valt;                        //输入参数进行调试
#define anjian 2
void setup() {
  Serial.begin(9600);        // 打开串口设置波特率
  pinMode(anjian,INPUT);
}

void   loop() {


  if(digitalRead(anjian)  ==  HIGH)
  {
    valt  =  1;
  }

  Serial.print(valt);              // 送一个数到Processing
  delay(300);
valt=0;
}



