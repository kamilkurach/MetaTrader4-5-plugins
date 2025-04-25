
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

void OnStart()
   {
   ENUM_TIMEFRAMES period = Period();
   string timeFrame = StringSubstr(EnumToString(period), 7);
   long periodSec = PeriodSeconds(period);
   string text = "NEXT [" + timeFrame + "] CANDLE IN: ";
   
   string value = "time_to_next_candle";
   ObjectCreate(0,value,OBJ_LABEL,0,0,0);           
   ObjectSetInteger(0,value,OBJPROP_XDISTANCE,25);
   ObjectSetInteger(0,value,OBJPROP_YDISTANCE,25);
   ObjectSetInteger(0,value,OBJPROP_COLOR,clrYellow);
   ObjectSetString(0,value,OBJPROP_TEXT, text);
   ObjectSetString(0,value,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,value,OBJPROP_FONTSIZE, 20);
   ObjectSetDouble(0,value,OBJPROP_ANGLE, 360);
   ObjectSetInteger(0,value,OBJPROP_SELECTABLE,false);
   ChartRedraw(0);
   
   while(true) {
      datetime currentTime = TimeCurrent();
      datetime candleOpenTime  = iTime(Symbol(),period,0);
      
      if (timeFrame == "M1")
      {
         long diff = periodSec - ((long) currentTime - (long) candleOpenTime);
         string text = "NEXT [" + timeFrame + "] CANDLE IN: " + (string) diff;
         ObjectSetString(0,value,OBJPROP_TEXT,text);
         ChartRedraw(0);
      }
      if (timeFrame == "M5")
      {
         long diff = periodSec - ((long) currentTime - (long) candleOpenTime);
         string text = "NEXT [" + timeFrame + "] CANDLE IN: " + (string) diff;
         ObjectSetString(0,value,OBJPROP_TEXT,text);
         ChartRedraw(0);
      }
   }                                
   }

//+------------------------------------------------------------------+
