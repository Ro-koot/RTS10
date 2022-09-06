/*
******************************************************************************
**
** @file        : Minimal LinkerScript.ld
**
** @author      : Harry Broeders
**
** @brief       : Linker script for STM32F411VETx Device from STM32F4 series
**                      512Kbytes FLASH
**                      128Kbytes RAM
**
**                Set heap size, stack size and stack location according
**                to application requirements.
**
**                Set memory bank area and size if external memory is used
**
**  Target      : STMicroelectronics STM32
**
**  Distribution: The file is distributed as is, without any warranty
**                of any kind.
**
******************************************************************************
** @attention
**
** Copyright (c) 2022 Hogeschool Rotterdam.
** All rights reserved.
**
** This software is licensed under terms that can be found in the LICENSE file
** in the root directory of this software component.
** If no LICENSE file comes with this software, it is provided AS-IS.
**
******************************************************************************
*/

/* Entry Point */
ENTRY(main)

/* Memories definition */
MEMORY
{
  RAM     (xrw)    : ORIGIN = 0x20000000,   LENGTH = 128K
  FLASH    (rx)    : ORIGIN = 0x08000000,   LENGTH = 512K
}

/* Sections */
SECTIONS
{
  /* The program code and other data into "FLASH" Rom type memory */
  .text :
  {
    . = ALIGN(4);
    *(.text)           /* .text sections (code) */
  } >FLASH
  /* Initialized data sections into "RAM" Ram type memory */
  .data :
  {
    . = ALIGN(4);
    *(.data)           /* .data sections */
  } >RAM AT> FLASH
}
