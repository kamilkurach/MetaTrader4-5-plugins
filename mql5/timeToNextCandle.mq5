
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

void OnStart()
   {
   string timeFrame = StringSubstr(EnumToString(_Period), 7);
   long periodSec = PeriodSeconds(_Period);
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
   
   while(true) 
      {
      datetime currentTime = TimeCurrent();
      datetime candleOpenTime  = iTime(Symbol(),_Period,0);
      
      switch(_Period)
         {
         case PERIOD_M1:
            {
            long diff = periodSec - ((long) currentTime - (long) candleOpenTime);
            string timer = TimeToString(diff, TIME_MINUTES | TIME_SECONDS);
            string text = "NEXT [" + timeFrame + "] CANDLE IN: " + StringSubstr(timer, 3);
            ObjectSetString(0,value,OBJPROP_TEXT,text);
            ChartRedraw(0);
            }
         case PERIOD_M5:
            {
            long diff = periodSec - ((long) currentTime - (long) candleOpenTime);
            string timer = TimeToString(diff, TIME_MINUTES | TIME_SECONDS);
            string text = "NEXT [" + timeFrame + "] CANDLE IN: " + StringSubstr(timer, 3);
            ObjectSetString(0,value,OBJPROP_TEXT,text);
            ChartRedraw(0);
            }
         case PERIOD_M15:
            {
            long diff = periodSec - ((long) currentTime - (long) candleOpenTime);
            string timer = TimeToString(diff, TIME_MINUTES | TIME_SECONDS);
            string text = "NEXT [" + timeFrame + "] CANDLE IN: " + StringSubstr(timer, 3);
            ObjectSetString(0,value,OBJPROP_TEXT,text);
            ChartRedraw(0);
            }
         case PERIOD_M30:
            {
            long diff = periodSec - ((long) currentTime - (long) candleOpenTime);
            string timer = TimeToString(diff, TIME_MINUTES | TIME_SECONDS);
            string text = "NEXT [" + timeFrame + "] CANDLE IN: " + StringSubstr(timer, 3);
            ObjectSetString(0,value,OBJPROP_TEXT,text);
            ChartRedraw(0);
            }
         }
      }
   }

//+------------------------------------------------------------------+
