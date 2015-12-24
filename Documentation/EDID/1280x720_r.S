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
//# 1280x720 59.74 Hz (CVT 0.92M9-R) hsync: 44.27 kHz; pclk: 63.75 MHz
//Modeline "1280x720R"   63.75  1280 1328 1360 1440  720 723 728 741 +hsync -vsync
#define CVT_hdisp 1280
#define CVT_hsyncstart 1328
#define CVT_hsyncend 1360
#define CVT_htotal 1440

#define CVT_vdisp  720
#define CVT_vsyncstart 723
#define CVT_vsyncend 728
#define CVT_vtotal 7741


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
