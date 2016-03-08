INF 19

;Start of code from C:\Users\Bailey\Documents\GitHub\gui-vm\NK4VM2\NK4VM2\bin\Debug\Files\ASMs\IDEDriverTest.txt


;Included driver.s

NOP 1000
LOD N_[F]
STR CHIP_SELECT
LOD N_[0]
STR STATUS_BUS
LOD N_[4]
STR STATUS_BUS
LOD N_[0]
STR STATUS_BUS

LOD ADDRESS[0]
STR IDE_DRIVER.DataPtr[0]
LOD ADDRESS[1]
STR IDE_DRIVER.DataPtr[1]
LOD ADDRESS[2]
STR IDE_DRIVER.DataPtr[2]
LOD ADDRESS[3]
STR IDE_DRIVER.DataPtr[3]
LOD SEC[0]
STR IDE_DRIVER.SecNum[0]
LOD SEC[1]
STR IDE_DRIVER.SecNum[1]
LOD CYL[0]
STR IDE_DRIVER.Cyl[0]
LOD CYL[1]
STR IDE_DRIVER.Cyl[1]
LOD CYL[2]
STR IDE_DRIVER.Cyl[2]
LOD CYL[3]
STR IDE_DRIVER.Cyl[3]
LOD READ[0]
STR IDE_DRIVER.ZeroToWrite[0]

LOD &(RETURN[0])[0]
STR IDE_DRIVER.Exit[1]
LOD &(RETURN[0])[1]
STR IDE_DRIVER.Exit[2]
LOD &(RETURN[0])[2]
STR IDE_DRIVER.Exit[3]
LOD &(RETURN[0])[3]
STR IDE_DRIVER.Exit[4]
LOD N_[0]
NOP 1000
JMP IDE_DRIVER.Enter
RETURN:
LOD IDE_DRIVER.Status[0]
STR STAT[0]
LOD IDE_DRIVER.Status[1]
STR STAT[1]
LOD N_[0]
JMP 0xC350
HLT


;End of code from C:\Users\Bailey\Documents\GitHub\gui-vm\NK4VM2\NK4VM2\bin\Debug\Files\ASMs\IDEDriverTest.txt

;Start of code from driver.s


IDE_DRIVER.Enter:

#Subject to change if necessary
LOD N_[0]
STR CHIP_SELECT[0]

#Arrange our location table
LOD IDE_DRIVER.Cyl[2]
STR IDE_DRIVER.Cyl23[0]
LOD IDE_DRIVER.Cyl[3]
STR IDE_DRIVER.Cyl23[1]
LOD IDE_DRIVER.Cyl[0]
STR IDE_DRIVER.Cyl01[0]
LOD IDE_DRIVER.Cyl[1]
STR IDE_DRIVER.Cyl01[1]

#Setup our pointers for the location loop
LOD &(IDE_DRIVER.RegTable[0])[0]
STR IDE_DRIVER.RegPtr[1]
LOD &(IDE_DRIVER.RegTable[0])[1]
STR IDE_DRIVER.RegPtr[2]
LOD &(IDE_DRIVER.RegTable[0])[2]
STR IDE_DRIVER.RegPtr[3]
LOD &(IDE_DRIVER.RegTable[0])[3]
STR IDE_DRIVER.RegPtr[4]
LOD &(IDE_DRIVER.LocTable[0])[0]
STR IDE_DRIVER.LocPtr1[1]
LOD &(IDE_DRIVER.LocTable[0])[1]
STR IDE_DRIVER.LocPtr1[2]
LOD &(IDE_DRIVER.LocTable[0])[2]
STR IDE_DRIVER.LocPtr1[3]
LOD &(IDE_DRIVER.LocTable[0])[3]
STR IDE_DRIVER.LocPtr1[4]

LOD N_[0]
STR IDE_DRIVER.LocationLoop[0]

IDE_DRIVER.SetupLoop:

#Enter sector count - always 1

LOD N_[4]
STR STATUS_BUS[0]
IDE_DRIVER.RegPtr:
LOD 0x0000
STR DATA_BUS
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
IDE_DRIVER.LocPtr1:
LOD 0x0000
STR DATA_BUS
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.LocPtr1[4]
STR IDE_DRIVER.LocPtr2[4]
LOD N_[0]
ADD IDE_DRIVER.LocPtr1[3]
STR IDE_DRIVER.LocPtr2[3]
LOD N_[0]
ADD IDE_DRIVER.LocPtr1[2]
STR IDE_DRIVER.LocPtr2[2]
LOD N_[0]
ADD IDE_DRIVER.LocPtr1[1]
STR IDE_DRIVER.LocPtr2[1]

LOD N_[4]
STR STATUS_BUS[0]
IDE_DRIVER.LocPtr2:
LOD 0x0000
STR DATA_BUS
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.LocPtr2[4]
STR IDE_DRIVER.LocPtr1[4]
LOD N_[0]
ADD IDE_DRIVER.LocPtr2[3]
STR IDE_DRIVER.LocPtr1[3]
LOD N_[0]
ADD IDE_DRIVER.LocPtr2[2]
STR IDE_DRIVER.LocPtr1[2]
LOD N_[0]
ADD IDE_DRIVER.LocPtr2[1]
STR IDE_DRIVER.LocPtr1[1]

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.RegPtr[4]
STR IDE_DRIVER.RegPtr[4]
LOD N_[0]
ADD IDE_DRIVER.RegPtr[3]
STR IDE_DRIVER.RegPtr[3]
LOD N_[0]
ADD IDE_DRIVER.RegPtr[2]
STR IDE_DRIVER.RegPtr[2]
LOD N_[0]
ADD IDE_DRIVER.RegPtr[1]
STR IDE_DRIVER.RegPtr[1]
LOD N_[0]
ADD N_[0]
LOD N_[1]
ADD IDE_DRIVER.LocationLoop[0]
STR IDE_DRIVER.LocationLoop[0]
#will never cause carry, and leaves value in acc

ADD N_[B]
STR macro[0]
LOD N_[0]
ADD N_[0]
LOD macro[0]
ADD N_[F]
CXA 0
NND N_[1]
NND N_[1]
NND N_[F]
JMP IDE_DRIVER.SetupLoop
#Repeat 5 times

#Control flow splits here:
#If they wrote zero to ZeroToWrite, skip
#ahead to the write driver

LOD N_[0]
STR IDE_DRIVER.LoopCount[0]
LOD N_[0]
STR IDE_DRIVER.LoopCount[1]
LOD N_[0]
STR IDE_DRIVER.LoopCount[2]
LOD N_[0]
STR IDE_DRIVER.LoopCount[3]

LOD IDE_DRIVER.ZeroToWrite
JMP IDE_DRIVER.Write

#-----------------------------------------------------------------
#Code to read:


#Tell it to start reading
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[f]
STR DATA_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[2]
STR DATA_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR DATA_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

IDE_DRIVER.CheckReadLoop:
#Wait for ready

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[f]
STR DATA_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD DATA_BUS
STR IDE_DRIVER.Status[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[8]
STR STATUS_BUS[0]
LOD DATA_BUS
STR IDE_DRIVER.Status[1]
LOD N_[0]
STR STATUS_BUS[0]



#Loop until MSB of .Status[1] is 1
LOD IDE_DRIVER.Status[1]
ADD N_[8]
LOD N_[0]
ADD N_[0]
JMP IDE_DRIVER.CheckReadLoop

#Drive is ready, time to start reading

LOD IDE_DRIVER.DataPtr[0]
STR IDE_DRIVER.RPtr4[1]
LOD IDE_DRIVER.DataPtr[1]
STR IDE_DRIVER.RPtr4[2]
LOD IDE_DRIVER.DataPtr[2]
STR IDE_DRIVER.RPtr4[3]
LOD IDE_DRIVER.DataPtr[3]
STR IDE_DRIVER.RPtr4[4]

IDE_DRIVER.ReadLoop:

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[8]
STR DATA_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

#When it starts presenting data,
#take that data and put it into memory.
#Increment the memory pointer each time;
#writing sixteen bits each time through
#this loop.

LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.RPtr4[4]
STR IDE_DRIVER.RPtr3[4]
LOD N_[0]
ADD IDE_DRIVER.RPtr4[3]
STR IDE_DRIVER.RPtr3[3]
LOD N_[0]
ADD IDE_DRIVER.RPtr4[2]
STR IDE_DRIVER.RPtr3[2]
LOD N_[0]
ADD IDE_DRIVER.RPtr4[1]
STR IDE_DRIVER.RPtr3[1]
LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.RPtr3[4]
STR IDE_DRIVER.RPtr2[4]
LOD N_[0]
ADD IDE_DRIVER.RPtr3[3]
STR IDE_DRIVER.RPtr2[3]
LOD N_[0]
ADD IDE_DRIVER.RPtr3[2]
STR IDE_DRIVER.RPtr2[2]
LOD N_[0]
ADD IDE_DRIVER.RPtr3[1]
STR IDE_DRIVER.RPtr2[1]
LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.RPtr2[4]
STR IDE_DRIVER.RPtr1[4]
LOD N_[0]
ADD IDE_DRIVER.RPtr2[3]
STR IDE_DRIVER.RPtr1[3]
LOD N_[0]
ADD IDE_DRIVER.RPtr2[2]
STR IDE_DRIVER.RPtr1[2]
LOD N_[0]
ADD IDE_DRIVER.RPtr2[1]
STR IDE_DRIVER.RPtr1[1]


LOD N_[8]
STR STATUS_BUS[0]
LOD DATA_BUS
IDE_DRIVER.RPtr1:
STR 0x0000
LOD N_[0]
STR STATUS_BUS[0]


LOD N_[8]
STR STATUS_BUS[0]
LOD DATA_BUS
IDE_DRIVER.RPtr2:
STR 0x0000
LOD N_[0]
STR STATUS_BUS[0]


LOD N_[8]
STR STATUS_BUS[0]
LOD DATA_BUS
IDE_DRIVER.RPtr3:
STR 0x0000
LOD N_[0]
STR STATUS_BUS[0]


LOD N_[8]
STR STATUS_BUS[0]
LOD DATA_BUS
IDE_DRIVER.RPtr4:
STR 0x0000
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.RPtr1[4]
STR IDE_DRIVER.RPtr4[4]
LOD N_[0]
ADD IDE_DRIVER.RPtr1[3]
STR IDE_DRIVER.RPtr4[3]
LOD N_[0]
ADD IDE_DRIVER.RPtr1[2]
STR IDE_DRIVER.RPtr4[2]
LOD N_[0]
ADD IDE_DRIVER.RPtr1[1]
STR IDE_DRIVER.RPtr4[1]

#Control flow - this loop only goes around 256 times

LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.LoopCount[1]
STR IDE_DRIVER.LoopCount[1]
LOD N_[0]
ADD IDE_DRIVER.LoopCount[0]
STR IDE_DRIVER.LoopCount[0]
LOD N_[0]
ADD N_[0]
STR macro[0]
LOD N_[0]
ADD N_[0]
LOD macro[0]
ADD N_[F]
CXA 0
NND N_[1]
NND N_[1]
NND N_[F]
JMP IDE_DRIVER.DoneReadLoop

LOD N_[0]
JMP IDE_DRIVER.ReadLoop

IDE_DRIVER.DoneReadLoop:




LOD N_[0]
JMP IDE_DRIVER.Done

#-----------------------------------------------------------------------------

IDE_DRIVER.Write:
#Tell it to start writing (0x30 to reg F)


LOD N_[4]
STR STATUS_BUS[0]
LOD N_[f]
STR DATA_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[3]
STR DATA_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR DATA_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

#execute

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]



LOD IDE_DRIVER.DataPtr[0]
STR IDE_DRIVER.WPtr4[1]
LOD IDE_DRIVER.DataPtr[1]
STR IDE_DRIVER.WPtr4[2]
LOD IDE_DRIVER.DataPtr[2]
STR IDE_DRIVER.WPtr4[3]
LOD IDE_DRIVER.DataPtr[3]
STR IDE_DRIVER.WPtr4[4]

IDE_DRIVER.WriteLoop:

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[8]
STR DATA_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

#This code self-modifies by inserting the data pointer
#provided into the LOD instructions below, then incrementing it
#and putting the result in the other LOD instruction

LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.WPtr4[4]
STR IDE_DRIVER.WPtr3[4]
LOD N_[0]
ADD IDE_DRIVER.WPtr4[3]
STR IDE_DRIVER.WPtr3[3]
LOD N_[0]
ADD IDE_DRIVER.WPtr4[2]
STR IDE_DRIVER.WPtr3[2]
LOD N_[0]
ADD IDE_DRIVER.WPtr4[1]
STR IDE_DRIVER.WPtr3[1]
LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.WPtr3[4]
STR IDE_DRIVER.WPtr2[4]
LOD N_[0]
ADD IDE_DRIVER.WPtr3[3]
STR IDE_DRIVER.WPtr2[3]
LOD N_[0]
ADD IDE_DRIVER.WPtr3[2]
STR IDE_DRIVER.WPtr2[2]
LOD N_[0]
ADD IDE_DRIVER.WPtr3[1]
STR IDE_DRIVER.WPtr2[1]
LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.WPtr2[4]
STR IDE_DRIVER.WPtr1[4]
LOD N_[0]
ADD IDE_DRIVER.WPtr2[3]
STR IDE_DRIVER.WPtr1[3]
LOD N_[0]
ADD IDE_DRIVER.WPtr2[2]
STR IDE_DRIVER.WPtr1[2]
LOD N_[0]
ADD IDE_DRIVER.WPtr2[1]
STR IDE_DRIVER.WPtr1[1]

LOD N_[4]
STR STATUS_BUS[0]
IDE_DRIVER.WPtr1:
LOD 0x0000
STR DATA_BUS
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
IDE_DRIVER.WPtr2:
LOD 0x0000
STR DATA_BUS
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
IDE_DRIVER.WPtr3:
LOD 0x0000
STR DATA_BUS
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[4]
STR STATUS_BUS[0]
IDE_DRIVER.WPtr4:
LOD 0x0000
STR DATA_BUS
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.WPtr1[4]
STR IDE_DRIVER.WPtr4[4]
LOD N_[0]
ADD IDE_DRIVER.WPtr1[3]
STR IDE_DRIVER.WPtr4[3]
LOD N_[0]
ADD IDE_DRIVER.WPtr1[2]
STR IDE_DRIVER.WPtr4[2]
LOD N_[0]
ADD IDE_DRIVER.WPtr1[1]
STR IDE_DRIVER.WPtr4[1]

#execute

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[4]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

#Control flow - this loop only goes around 256 times

LOD N_[8]
ADD N_[8]
LOD N_[0]
ADD IDE_DRIVER.LoopCount[1]
STR IDE_DRIVER.LoopCount[1]
LOD N_[0]
ADD IDE_DRIVER.LoopCount[0]
STR IDE_DRIVER.LoopCount[0]
LOD N_[0]
ADD N_[0]
STR macro[0]
LOD N_[0]
ADD N_[0]
LOD macro[0]
ADD N_[F]
CXA 0
NND N_[1]
NND N_[1]
NND N_[F]
JMP IDE_DRIVER.DoneWriteLoop

LOD N_[0]
JMP IDE_DRIVER.WriteLoop

IDE_DRIVER.DoneWriteLoop:

IDE_DRIVER.CheckWriteLoop:

#Check for error codes

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[f]
STR DATA_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

#execute

LOD N_[8]
STR STATUS_BUS[0]
LOD DATA_BUS
STR IDE_DRIVER.Status[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[8]
STR STATUS_BUS[0]
LOD DATA_BUS
STR IDE_DRIVER.Status[1]
LOD N_[0]
STR STATUS_BUS[0]

#Loop until MSB of .Status[1] is 0
LOD IDE_DRIVER.Status[1]
ADD N_[8]
LOD N_[0]
ADD N_[0]
STR macro[0]
LOD N_[0]
ADD N_[0]
LOD macro[0]
ADD N_[F]
CXA 0
NND N_[1]
NND N_[1]
NND N_[F]
JMP IDE_DRIVER.CheckWriteLoop

#Check the status register one last time,
#leaving the code for the higher-level coder.

LOD N_[4]
STR STATUS_BUS[0]
LOD N_[f]
STR DATA_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

LOD N_[8]
STR STATUS_BUS[0]
LOD N_[0]
STR STATUS_BUS[0]

#execute

LOD N_[8]
STR STATUS_BUS[0]
LOD DATA_BUS
STR IDE_DRIVER.Status[0]
LOD N_[0]
STR STATUS_BUS[0]
LOD N_[8]
STR STATUS_BUS[0]
LOD DATA_BUS
STR IDE_DRIVER.Status[1]
LOD N_[0]
STR STATUS_BUS[0]

IDE_DRIVER.Done:
LOD N_[15]
STR CHIP_SELECT[0]
#Exit - this needs the return address to be supplied
LOD N_[0]
IDE_DRIVER.Exit:
JMP 0x0000


;End of code from driver.s
;Start of data sections
;Start of data from C:\Users\Bailey\Documents\GitHub\gui-vm\NK4VM2\NK4VM2\bin\Debug\Files\ASMs\IDEDriverTest.txt

ADDRESS: .data 4 0d50000
SEC: .data 2 0x01
CYL: .data 4 0x0000
READ: .data 1 0x1
STAT: .data 2



;End of data from C:\Users\Bailey\Documents\GitHub\gui-vm\NK4VM2\NK4VM2\bin\Debug\Files\ASMs\IDEDriverTest.txt

;Start of data from driver.s

IDE_DRIVER.Cyl: .data 4
IDE_DRIVER.ZeroToWrite: .data 1
IDE_DRIVER.RegTable: .data 5 0xABCDE
IDE_DRIVER.LocTable:
IDE_DRIVER.SecCount: .data 2 0x01
IDE_DRIVER.SecNum: .data 2
IDE_DRIVER.Cyl23: .data 2
IDE_DRIVER.Cyl01: .data 2
IDE_DRIVER.Head: .data 2 0xE0
IDE_DRIVER.DataPtr: .data 4
IDE_DRIVER.LoopCount: .data 2 0x0
IDE_DRIVER.LocationLoop: .data 1 0x0
IDE_DRIVER.Status: .data 2

;End of data from driver.s

;memory space used by macros
macro: .data 1

