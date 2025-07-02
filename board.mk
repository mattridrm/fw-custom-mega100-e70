BOARDCPPSRC =  $(BOARD_DIR)/board_configuration.cpp \
    $(BOARD_DIR)/firmware/pinouts.cpp \


BOARDINC += $(BOARD_DIR)/generated/controllers/generated

# defines SHORT_BOARD_NAME
include $(BOARD_DIR)/meta-info.env

# reduce memory usage monitoring
DDEFS += -DRAM_UNUSED_SIZE=100

# assign critical LED to a non-existent pin
DDEFS += -DLED_CRITICAL_ERROR_BRAIN_PIN=Gpio::I15


# we do not have much Lua RAM, let's drop some fancy functions
DDEFS += -DWITH_LUA_CONSUMPTION=FALSE
DDEFS += -DWITH_LUA_PID=FALSE
DDEFS += -DWITH_LUA_STOP_ENGINE=FALSE

# TS on usart 3
# Hardware serial port on UART 3 -> PB10/PB11
DDEFS += -DSTM32_SERIAL_USE_USART3=TRUE
DDEFS += -DTS_SECONDARY_UxART_PORT=SD3 
DDEFS += -DEFI_TS_SECONDARY_IS_SERIAL=TRUE
DDEFS += -DEFI_USE_UART_DMA=TRUE
