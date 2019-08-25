
#LOAD "MXJ.IS"         ;预调入指令系统
#SET RAM 0260h = 5500h  ;数据区0260H单元预置数据5500h

        org   0
start:
        LDD R0,0F1h    ;将待测数传入R0
        LDD R1 ,01h  ;将01h立即数传入R1，用于判断待测数奇偶
        AND R1,R0    ;待测数与01h相与
        LDD R2,00h   ;将00h传入R2中
        CMP R1,R2    ;相减，若为1，则是奇数；若为0，则是偶数
        JE even_num  ;如果零标志位为1，则跳转到even_num段
        
		RRC R0       ;R0右移，即R0除以2
        STA 0000h,R0   ;装载到RAM地址为0000h
        jmp finish	 ;跳到finish段

even_num:
        LDD  R1,07h  ;将07h传入R1
        AND  R1,R0   ;取得R0后三位并传入R1

        LDD  R2,38h   ;将38h传入R2
        AND  R2,R0    ;取得R0中间三位并传入R2
        
		RLC  R2		  ;R2左移一位
        ADD  R2,R1    ;R2和R1相加，结果传入R2
        STA  0000h, R2 ;将R2的结果放在RAM地址为0000h

        LDD  R1, 0C0h   ;将0Ch传入R1
        AND  R0,R1      ;取得R0前两位并传入R0
        ;将R0循环右移6位
        RRC  R0
        RRC  R0
        RRC  R0
        RRC  R0
        RRC  R0
        RRC  R0
        STA  0001h,R0    ;将R0传入RAM中地址为0001h的
        
        
finish:
        LDD R0,00h
        end
        