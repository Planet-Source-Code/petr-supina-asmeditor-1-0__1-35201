        ��  ��                    (   H E L P   ��e       0        Index for NASM Documentation 0.98.34
Peter Scale 2002

[3]

2.1|db|dw|dd|dq|dt|
2.2|resb|resw|resd|resq|rest|
2.3|incbin|
2.4|equ|
2.5|times|
6|seg|wrt|
7|strict|

[4]

1.1|%define|%idefine|
1.2|%xdefine|%ixdefine|
1.4|%undef|
1.5|%assign|%iassign|
2.1|%strlen|
2.2|%substr|
3|%macro|%imacro|%endm|%endmacro|
3.5|%0|
3.6|%rotate|
4|%elif|%else|%endif|elif|else|endif|
4.1|%ifdef|%ifndef|%elifdef|%elifndef|ifdef|ifndef|
4.2|%ifmacro|
4.3|%ifctx|%ifnctx|%elifctx|%elifnctx|
4.4|%if|if|
4.5|%ifidn|%ifidni|%ifnidn|%ifnidni|%elifidn|%elifidni|%elifnidn|%elifnidni|
4.6|%ifid|%ifnid|%ifnum|%ifnnum|%ifstr|%ifnstr|%elifid|%elifnid|%elifnnum|%elifnstr|%elifnum|%elifstr|
4.7|%error|
5|%rep|%endrep|%exitrep|
6|%include|include|
7.1|%push|%pop|
7.4|%repl|
8|%clear|
8.1|__nasm_major__|__nasm_minor__|__nasm_subminor__|__nasm_patchlevel__|
8.2|__nasm_version_id__|
8.3|__nasm_ver__|
8.4|__file__|__line__|
8.5|struc|endstruc|
8.6|istruc|at|iend|
8.7|align|alignb|
9.1|%arg|arg|
9.2|%stacksize|
9.3|%local|local|
10.1|%line|

[5]

1|bits|
1.1|use16|use32|
2|segment|section|
2.1|__sect__|
3|absolute|
4|extern|
5|global|
6|common|
7|cpu|

[6]

1.1|org|
2.2|group|
2.3|uppercase|
2.4|import|
2.5|export|
9.1|library|
9.2|module|

[B.4]

1|aaa|aas|aam|aad|
2|adc|
3|add|
4|addpd|
5|addps|
6|addsd|
7|addss|
8|and|
9|andnpd|
10|andnps|
11|andpd|
12|andps|
13|arpl|
14|bound|
15|bsf|bsr|
16|bswap|
17|bt|btc|btr|bts|
18|call|
19|cbw|cwd|cdq|cwde|
20|clc|cld|cli|clts|
21|clflush|
22|cmc|
23|cmova|cmovae|cmovb|cmovbe|cmovc|cmove|cmovg|cmovge|cmovl|cmovle|cmovna|cmovnae|cmovnb|cmovnbe|cmovnc|cmovne|cmovng|cmovnge|cmovnl|cmovnle|cmovno|cmovnp|cmovns|cmovnz|cmovo|cmovp|cmovpe|cmovpo|cmovs|cmovz|
24|cmp|
25|cmppd|cmpeqpd|cmpltpd|cmplepd|cmpunordpd|cmpnepd|cmpnltpd|cmpnlepd|cmpordpd|
26|cmpps|cmpeqps|cmpltps|cmpleps|cmpunordps|cmpneps|cmpnltps|cmpnleps|cmpordps|
27|cmpsb|cmpsw|cmpsd|
28|cmpsd|cmpeqsd|cmpltsd|cmplesd|cmpunordsd|cmpnesd|cmpnltsd|cmpnlesd|cmpordsd|
29|cmpss|cmpeqss|cmpltss|cmpless|cmpunordss|cmpness|cmpnltss|cmpnless|cmpordss|
30|cmpxchg|cmpxchg486|
31|cmpxchg8b|
32|comisd|
33|comiss|
34|cpuid|
35|cvtdq2pd|
36|cvtdq2ps|
37|cvtpd2dq|
38|cvtpd2pi|
39|cvtpd2ps|
40|cvtpi2pd|
41|cvtpi2ps|
42|cvtps2dq|
43|cvtps2pd|
44|cvtps2pi|
45|cvtsd2si|
46|cvtsd2ss|
47|cvtsi2sd|
48|cvtsi2ss|
49|cvtss2sd|
50|cvtss2si|
51|cvttpd2dq|
52|cvttpd2pi|
53|cvttps2dq|
54|cvttps2pi|
55|cvttsd2si|
56|cvttss2si|
57|daa|das|
58|dec|
59|div|
60|divpd|
61|divps|
62|divsd|
63|divss|
64|emms|
65|enter|
66|f2xm1|
67|fabs|
68|fadd|faddp|
69|fbld|fbstp|
70|fchs|
71|fclex|fnclex|
72|fcmovb|fcmove|fcmovbe|fcmovu|fcmovnb|fcmovne|fcmovnbe|fcmovnu|
73|fcom|fcomp|fcompp|fcomi|fcomip|
74|fcos|
75|fdecstp|
76|fdisi|fndisi|feni|fneni|
77|fdiv|fdivp|fdivr|fdivrp|
78|femms|
79|ffree|ffreep|
80|fiadd|
81|ficom|ficomp|
82|fidiv|fidivr|
83|fild|fist|fistp|
84|fimul|
85|fincstp|
86|finit|fninit|
87|fisub|fisubr|
88|fld|
89|fld1|fldl2e|fldl2t|fldlg2|fldln2|fldpi|fldz|
90|fldcw|
91|fldenv|
92|fmul|fmulp|
93|fnop|
94|fpatan|fptan|
95|fprem|fprem1|
96|frndint|
97|fsave|fnsave|frstor|
98|fscale|
99|fsetpm|
100|fsin|fsincos|
101|fsqrt|
102|fst|fstp|
103|fstcw|fnstcw|
104|fstenv|fnstenv|
105|fstsw|fnstsw|
106|fsub|fsubp|fsubr|fsubrp|
107|ftst|
108|fucom|fucomp|fucompp|fucomi|fucomip|
109|fxam|
110|fxch|
111|fxrstor|
112|fxsave|
113|fxtract|
114|fyl2x|fyl2xp1|
115|hlt|
116|ibts|
117|idiv|
118|imul|
119|in|
120|inc|
121|insb|insw|insd|
122|int|
123|int3|int1|icebp|int01|
124|into|
125|invd|
126|invlpg|
127|iret|iretw|iretd|
128|ja|jae|jb|jbe|jc|je|jg|jge|jl|jle|jna|jnae|jnb|jnbe|jnc|jne|jng|jnge|jnl|jnle|jno|jnp|jns|jnz|jo|jp|jpe|jpo|js|jz|
129|jcxz|jecxz|
130|jmp|
131|lahf|
132|lar|
133|ldmxcsr|
134|lds|les|lfs|lgs|lss|
135|lea|
136|leave|
137|lfence|
138|lgdt|lidt|lldt|
139|lmsw|
140|loadall|loadall286|
141|lodsb|lodsw|lodsd|
142|loop|loope|loopz|loopne|loopnz|
143|lsl|
144|ltr|
145|maskmovdqu|
146|maskmovq|
147|maxpd|
148|maxps|
149|maxsd|
150|maxss|
151|mfence|
152|minpd|
153|minps|
154|minsd|
155|minss|
156|mov|
157|movapd|
158|movaps|
159|movd|
160|movdq2q|
161|movdqa|
162|movdqu|
163|movhlps|
164|movhpd|
165|movhps|
166|movlhps|
167|movlpd|
168|movlps|
169|movmskpd|
170|movmskps|
171|movntdq|
172|movnti|
173|movntpd|
174|movntps|
175|movntq|
176|movq|
177|movq2dq|
178|movsb|movsw|movsd|
179|movsd|
180|movss|
181|movsx|movzx|
182|movupd|
183|movups|
184|mul|
185|mulpd|
186|mulps|
187|mulsd|
188|mulss|
189|neg|not|
190|nop|
191|or|
192|orpd|
193|orps|
194|out|
195|outsb|outsw|outsd|
196|packssdw|packsswb|packuswb|
197|paddb|paddw|paddd|
198|paddq|
199|paddsb|paddsw|
200|paddsiw|
201|paddusb|paddusw|
202|pand|pandn|
203|pause|
204|paveb|
205|pavgb|pavgw|
206|pavgusb|
207|pcmpeqb|pcmpeqw|pcmpeqd|pcmpgtb|pcmpgtw|pcmpgtd|
208|pdistib|
209|pextrw|
210|pf2id|
211|pf2iw|
212|pfacc|
213|pfadd|
214|pfcmpeq|pfcmpge|pfcmpgt|
215|pfmax|
216|pfmin|
217|pfmul|
218|pfnacc|
219|pfpnacc|
220|pfrcp|
221|pfrcpit1|
222|pfrcpit2|
223|pfrsqit1|
224|pfrsqrt|
225|pfsub|
226|pfsubr|
227|pi2fd|
228|pf2iw|
229|pinsrw|
230|pmachriw|
231|pmaddwd|
232|pmagw|
233|pmaxsw|
234|pmaxub|
235|pminsw|
236|pminub|
237|pmovmskb|
238|pmulhrwc|pmulhriw|
239|pmulhrwa|
240|pmulhuw|
241|pmulhw|pmullw|
242|pmuludq|
243|pmvzb|pmvnzb|pmvlzb|pmvgezb|
244|pop|
245|popa|popaw|popad|
246|popf|popfw|popfd|
247|por|
248|prefetch|prefetchw|
249|prefetchnta|prefetcht0|prefetcht1|prefetcht2|
250|psadbw|
251|pshufd|
252|pshufhw|
253|pshuflw|
254|pshufw|
255|psllw|pslld|psllq|pslldq|
256|psraw|psrad|
257|psrlw|psrld|psrlq|psrldq|
258|psubb|psubw|psubd|psubq|
259|psubsb|psubsw|psubusb|psubusw|
260|psubsiw|
261|pswapd|
262|punpckhbw|punpckhwd|punpckhdq|punpckhqdq|punpcklbw|punpcklwd|punpckldq|punpcklqdq|
263|push|
264|pusha|pushaw|pushad|
265|pushf|pushfw|pushfd|
266|pxor|
267|rcl|rcr|
268|rcpps|
269|rcpss|
270|rdmsr|
271|rdpmc|
272|rdshr|
273|rdtsc|
274|ret|retf|retn|
275|rol|ror|
276|rsdc|
277|rsldt|
278|rsm|
279|rsqrtps|
280|rsqrtss|
281|rsts|
282|sahf|
283|sal|sar|
284|salc|
285|sbb|
286|scasb|scasw|scasd|
287|seta|setae|setb|setbe|setc|sete|setg|setge|setl|setle|setna|setnae|setnb|setnbe|setnc|setne|setng|setnge|setnl|setnle|setno|setnp|setns|setnz|seto|setp|setpe|setpo|sets|setz|
288|sfence|
289|sgdt|sidt|sldt|
290|shl|shr|
291|shld|shrd|
292|shufpd|
293|shufps|
294|smi|
295|smint|smintold|
296|smsw|
297|sqrtpd|
298|sqrtps|
299|sqrtsd|
300|sqrtss|
301|stc|std|sti|
302|stmxcsr|
303|stosb|stosw|stosd|
304|str|
305|sub|
306|subpd|
307|subps|
308|subsd|
309|subss|
310|svdc|
311|svldt|
312|svts|
313|syscall|
314|sysenter|
315|sysexit|
316|sysret|
317|test|
318|ucomisd|
319|ucomiss|
320|ud0|ud1|ud2|
321|umov|
322|unpckhpd|
323|unpckhps|
324|unpcklpd|
325|unpcklps|
326|verr|verw|
327|wait|
328|wbinvd|
329|wrmsr|
330|wrshr|
331|xadd|
332|xbts|
333|xchg|
334|xlat|xlatb|
335|xor|
336|xorpd|
337|xorps| Z  $   A S M   ��e     0        [BITS 32]
enter 9,0
push ebx
push esi
push edi
mov eax,1
cpuid
test edx,800000h
setnz [ebp-9]
fninit
mov dword[ebp-8],0
mov ecx,[ebp+8]
foo#00000001:
rdtsc
mov [ebp-4],eax
cld
times 8 nop
clc
rdtsc
sub eax,[ebp-4]
sub [ebp-8],eax
dec ecx
jnz foo#00000001
mov ecx,[ebp+8]
foo#00000002:
push ebp
push ecx
rdtsc
mov [ebp-4],eax
cld
times 8 nop
custom:
clc
rdtsc
pop ecx
pop ebp
sub eax,[ebp-4]
cmp byte[ebp-9],0
jz short foo#00000003
emms
foo#00000003:
fninit
add [ebp-8],eax
dec ecx
jnz foo#00000002
mov eax,[ebp-8]
pop edi
pop esi
pop ebx
leave
ret 16
  ;   $   B I N   ��e     0        U��SVW�[�ف�    Q��Y1�u1���E�}���W�O�E�����_^[��  R   $   B I N   ��f     0        U��SVW� �U�} u��}� ����0�G��u������ �u���0��w���F��u�������1�_^[��   