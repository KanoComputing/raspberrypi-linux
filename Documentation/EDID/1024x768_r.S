/*
   1024x768.S: EDID data set for standard 1024x768 60 Hz monitor

   Copyright (C) 2011 Carsten Emde <C.Emde@osadl.org>

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License
   as published by the Free Software Foundation; either version 2
   of the License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA.
*/

/* EDID */
#define VERSION 1
#define REVISION 3

// from http://unix.stackexchange.com/questions/97023/how-to-make-edid

// cvt 1024 768 60 -r gives:
//# 1024x768 59.87 Hz (CVT 0.79M3-R) hsync: 47.30 kHz; pclk: 56.00 MHz
//Modeline "1024x768R"   56.00  1024 1072 1104 1184  768 771 775 790 +hsync -vsync
#define CVT_hdisp 1024
#define CVT_hsyncstart 1072
#define CVT_hsyncend 1104
#define CVT_htotal 1184

#define CVT_vdisp  768
#define CVT_vsyncstart 771
#define CVT_vsyncend 775
#define CVT_vtotal 790


#define XPIX CVT_hdisp
#define XBLANK (CVT_htotal-CVT_hdisp)
#define XOFFSET (CVT_hsyncstart-CVT_hdisp)
#define XPULSE (CVT_hsyncend-CVT_hsyncstart)

#define YPIX CVT_vdisp
#define YBLANK (CVT_vtotal-CVT_vdisp)
#define YOFFSET (63+(CVT_vsyncstart-CVT_vdisp))
#define YPULSE (63+(CVT_vsyncend-CVT_vsyncstart))
	

/* Display */
#define CLOCK 65000 /* kHz */
#define XY_RATIO XY_RATIO_4_3
#define DPI 72
#define VFREQ 60 /* Hz */
#define TIMING_NAME "Kano Screen"
#define ESTABLISHED_TIMING2_BITS 0x08 /* Bit 3 -> 1024x768 @60 Hz */
#define HSYNC_POL 0
#define VSYNC_POL 0
#define CRC 0x55

#include "edid.S"
