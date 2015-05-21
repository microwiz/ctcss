# ctcss-attiny
ctcss-attiny
CONTENTS OF THIS FILE
---------------------
   
 * Introduction
 * History
 * Requirements
 * FAQ
 * Maintainers

* Introduction:
This project is about CTCSS (Continuous Tone-Coded Squelch System) encoder. For more information about CTCSS please read http://en.wikipedia.org/wiki/Continuous_Tone-Coded_Squelch_System. 

Originally this project was intended for a Kenwood TM201B VHF 2M radio transceiver that did not come with a CTCSS board. This is the only reason that this encoder uses a TU3 (Kenwood Tone Board for TM201B) connector pinout. This design did not use all signals from TU3 pinout (like PTT and tone select signal) being a proof of concept. We have successfully used the design with a TM201B emitting a 100Hz CTCSS signal on local repeater.

General information about this project is available here "http://blog.bhargavaz.us/2010/12/ctcss-encoder-for-transceivers.html".


* History:
	This Project was originally conceived in year 2005 for Kenwood TM201B transceiver.
	Software was originally developed in Atmel AVR Studio.
	While other designs were migrated from CVS to GIT, this design was lost in translation. Also we  moved from one locaton to other and switched operating systems, it caused this design to disappear from radar.
	There were many reuqests about this design on web and email that made us resurrect this project. We had to re-draw the schematic from built protype. Original schematic was drawn in Eagle but the current one is drawn using open source gEDA.`
	Still trying to find the original assembly language program file for this. Hopefully with help of find + archives we should be able to find it.
intainers


* Requirements:
	(a) Schematics - The schematics are captured using gEDA software. Please refer to gEDA project here "http://wiki.geda-project.org/". Schematics are also published in PDF.
	(b) ASM - Permiting time, the software may use and be available using GNU AVR Assembler AVRA.
	

* FAQ:
	* Would the PCB/Kit be avaiable?
		We hope so, depending on requests and time availibility.
		

* Maintainers:
	Chetan Bhargava / KG6NFG / Microwiz Technologies
 	More invited, Please contribute.
