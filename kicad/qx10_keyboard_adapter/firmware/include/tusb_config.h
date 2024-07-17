#ifndef _PICO_TUSB_CONFIG_H
#define _PICO_TUSB_CONFIG_H

#define CFG_TUSB_MCU                OPT_MCU_RP2040
#define CFG_TUSB_RHPORT0_MODE       OPT_MODE_HOST

#if CFG_TUSB_MCU == OPT_MCU_RP2040
#define CFG_TUH_RPI_PIO_USB   0
#define BOARD_TUH_RHPORT      CFG_TUH_RPI_PIO_USB
#endif

// RHPort number used for host can be defined by board.mk, default to port 0
#ifndef BOARD_TUH_RHPORT
#define BOARD_TUH_RHPORT      0
#endif

// RHPort max operational speed can defined by board.mk
#ifndef BOARD_TUH_MAX_SPEED
#define BOARD_TUH_MAX_SPEED   OPT_MODE_DEFAULT_SPEED
#endif

#define CFG_TUSB_MEM_SECTION
#define CFG_TUSB_MEM_ALIGN          __attribute__ ((aligned(4)))

#define CFG_TUH_ENABLED  (1)
#define CFG_TUH_MAX_SPEED     BOARD_TUH_MAX_SPEED


#define CFG_TUH_ENUMERATION_BUFSIZE 1024

#define CFG_TUH_HUB                 1
#define CFG_TUH_CDC                 0
#define CFG_TUH_HID                 4 // typical keyboard + mouse device can have 3-4 HID interfaces
#define CFG_TUH_MSC                 0
#define CFG_TUH_VENDOR              0


#define CFG_TUH_DEVICE_MAX          (CFG_TUH_HUB ? 4 : 1) // hub typically has 4 ports


#define CFG_TUH_HID_EP_BUFSIZE      64
#define CFG_TUH_HID_EPOUT_BUFSIZE   64

#endif
