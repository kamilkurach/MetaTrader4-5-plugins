import MetaTrader5 as mt5
from time import sleep
import sys

SYMBOL = "EURUSD"
SLEEP_TIME = 0.001

if not mt5.initialize():
   print("initialize() failed")
   mt5.shutdown()

try:
   while True:
      spread = mt5.symbol_info(SYMBOL).spread
      digits = mt5.symbol_info(SYMBOL).digits
      swap_long = mt5.symbol_info(SYMBOL).swap_long
      swap_short = mt5.symbol_info(SYMBOL).swap_short
      raw_time = mt5.symbol_info_tick(SYMBOL)[0]
      raw_bid = mt5.symbol_info_tick(SYMBOL)[1]
      raw_ask = mt5.symbol_info_tick(SYMBOL)[2]
      bid = round(raw_bid, digits)
      ask = round(raw_ask, digits)
    
      result = "TIME: {0} DIGITS: {4} SWAP_LONG: {5} SWAP_SHORT: {6} BID: {1} ASK: {2} SPREAD: {3}".format(
         raw_time,
         bid,
         ask,
         spread,
         digits,
         swap_long,
         swap_short)
    
      print(result)
      sleep(SLEEP_TIME)
    
except KeyboardInterrupt:
   mt5.shutdown()
   sys.exit(0)
