
#LOAD "MXJ.IS"         ;Ԥ����ָ��ϵͳ
#SET RAM 0260h = 5500h  ;������0260H��ԪԤ������5500h

        org   0
start:
        LDD R0,0F1h    ;������������R0
        LDD R1 ,01h  ;��01h����������R1�������жϴ�������ż
        AND R1,R0    ;��������01h����
        LDD R2,00h   ;��00h����R2��
        CMP R1,R2    ;�������Ϊ1��������������Ϊ0������ż��
        JE even_num  ;������־λΪ1������ת��even_num��
        
		RRC R0       ;R0���ƣ���R0����2
        STA 0000h,R0   ;װ�ص�RAM��ַΪ0000h
        jmp finish	 ;����finish��

even_num:
        LDD  R1,07h  ;��07h����R1
        AND  R1,R0   ;ȡ��R0����λ������R1

        LDD  R2,38h   ;��38h����R2
        AND  R2,R0    ;ȡ��R0�м���λ������R2
        
		RLC  R2		  ;R2����һλ
        ADD  R2,R1    ;R2��R1��ӣ��������R2
        STA  0000h, R2 ;��R2�Ľ������RAM��ַΪ0000h

        LDD  R1, 0C0h   ;��0Ch����R1
        AND  R0,R1      ;ȡ��R0ǰ��λ������R0
        ;��R0ѭ������6λ
        RRC  R0
        RRC  R0
        RRC  R0
        RRC  R0
        RRC  R0
        RRC  R0
        STA  0001h,R0    ;��R0����RAM�е�ַΪ0001h��
        
        
finish:
        LDD R0,00h
        end
        