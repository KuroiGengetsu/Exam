	.586
DATA	SEGMENT	USE16
BUF	DB	255, ?, 255 DUP(?) ; 读取的字符都存放在 BUF 中
NUM	DB	0		   ; 最终符合的个数
NUMSTR	DB	?,?,?,'$'	   ; 个数的字符串格式
RESULT	DB	255 DUP(?), ?, ?   ; 符合的字符
DATA	ENDS

CODE	SEGMENT	USE16
	ASSUME	CS:CODE, DS:DATA
BEG:	MOV	AX,	DATA
	MOV	DS,	AX

	;; 读取字符串放入 BUF 中
	MOV	AH,	0AH
	LEA	DX,	BUF
	INT	21H

	;; 将偏移地址放入指针
	LEA	BX,	RESULT
	LEA	SI,	BUF+2

	;; 循环的次数
	MOV	CL,	BUF+1
	MOV	CH,	0

	;; 显示换行字符
	MOV	AH,	02H
	MOV	DL,	0AH
	INT	21H

	;; 比较大小
AGA:	CMP	BYTE PTR [SI],	42H
	JB	NEXT
	CMP	BYTE PTR [SI],	45H
	JA	NEXT
	;; 符合的字符都放入 RESULT 中
	MOV	AL,	BYTE PTR [SI]
	MOV	BYTE PTR [BX],	AL
	INC	BX
	INC	NUM
NEXT:	INC	SI
	LOOP	AGA

	;; 对 RESULT 字符后的内容进行处理, 回车换行美元符号
	MOV	BYTE PTR [BX],	0AH
	MOV	BYTE PTR [BX+1],	0DH
	MOV	BYTE PTR [BX+2],	'$'
	;; 显示结果的字符串
	LEA	DX,	RESULT
	MOV	AH,	09H
	INT	21H

	;; 求百位数
	MOV	AL,	NUM	; 被除数 AX
	MOV	AH,	0
	MOV	BH,	100	; 除数
	DIV	BH
	;; 除数变成 ASCII
	ADD	AL, '0'
	MOV	NUMSTR,	AL	; 百位送入 NUMSTR 第一位
	;; 求十位数与个位数
	MOV	AL,	AH	; 余数送入 被除数 AX
	MOV	AH,	0	; 高位置零
	MOV	BH,	10	; 除数
	DIV	BH
	ADD	AL,	'0'	; 变成 ASCII
	ADD	AH,	'0'
	MOV	NUMSTR+1,	AL ; 十位送入 NUMSTR 第二位
	MOV	NUMSTR+2,	AH ; 个位送入 NUMSTR 第三位
	CMP	BYTE PTR NUMSTR,	'0'
	JNZ	DISP		; 如果百位不是 0, 跳到 DISP
	;; 将十位、个位 挪到 百位、十位的位置, 因为百位是0, 多余
	PUSH	WORD PTR NUMSTR+1
	POP	WORD PTR NUMSTR
	MOV	BYTE PTR NUMSTR+2,	'$'
DISP:	MOV	AH,	09H
	LEA	DX, NUMSTR
	INT	21H

	;; 返回 DOS
	MOV	AH,	4CH
	INT	21H
CODE	ENDS
	END	BEG

