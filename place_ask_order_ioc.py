# TEST SCRIPT

import MetaTrader5 as mt5

SYMBOL = "EURUSD"
LOT_SIZE = 0.01

if not mt5.initialize():
   print("initialize() failed")
   mt5.shutdown()

point = mt5.symbol_info(SYMBOL).point
price = mt5.symbol_info_tick(SYMBOL).ask
deviation = 10

request = {
   "action": mt5.TRADE_ACTION_DEAL,
   "symbol": SYMBOL,
   "volume": LOT_SIZE,
   "type": mt5.ORDER_TYPE_BUY,
   "price": price,
   "sl": price - 25 * point,
   "tp": price + 25 * point,
   "deviation": deviation,
   "magic": 230678,
   "comment": "test",
   "type_time": mt5.ORDER_TIME_GTC,
   "type_filling": mt5.ORDER_FILLING_IOC,
}

result = mt5.order_send(request)
print(result)

mt5.shutdown()

# TEST SCRIPT
