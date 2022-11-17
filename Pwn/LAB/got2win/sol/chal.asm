
share/chal:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    rsp,0x8
  401008:	48 8b 05 e9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fe9]        # 403ff8 <__gmon_start__@Base>
  40100f:	48 85 c0             	test   rax,rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	call   rax
  401016:	48 83 c4 08          	add    rsp,0x8
  40101a:	c3                   	ret    

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 2f 00 00    	push   QWORD PTR [rip+0x2fe2]        # 404008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	f2 ff 25 e3 2f 00 00 	bnd jmp QWORD PTR [rip+0x2fe3]        # 404010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102d:	0f 1f 00             	nop    DWORD PTR [rax]
  401030:	f3 0f 1e fa          	endbr64 
  401034:	68 00 00 00 00       	push   0x0
  401039:	f2 e9 e1 ff ff ff    	bnd jmp 401020 <_init+0x20>
  40103f:	90                   	nop
  401040:	f3 0f 1e fa          	endbr64 
  401044:	68 01 00 00 00       	push   0x1
  401049:	f2 e9 d1 ff ff ff    	bnd jmp 401020 <_init+0x20>
  40104f:	90                   	nop
  401050:	f3 0f 1e fa          	endbr64 
  401054:	68 02 00 00 00       	push   0x2
  401059:	f2 e9 c1 ff ff ff    	bnd jmp 401020 <_init+0x20>
  40105f:	90                   	nop
  401060:	f3 0f 1e fa          	endbr64 
  401064:	68 03 00 00 00       	push   0x3
  401069:	f2 e9 b1 ff ff ff    	bnd jmp 401020 <_init+0x20>
  40106f:	90                   	nop
  401070:	f3 0f 1e fa          	endbr64 
  401074:	68 04 00 00 00       	push   0x4
  401079:	f2 e9 a1 ff ff ff    	bnd jmp 401020 <_init+0x20>
  40107f:	90                   	nop
  401080:	f3 0f 1e fa          	endbr64 
  401084:	68 05 00 00 00       	push   0x5
  401089:	f2 e9 91 ff ff ff    	bnd jmp 401020 <_init+0x20>
  40108f:	90                   	nop
  401090:	f3 0f 1e fa          	endbr64 
  401094:	68 06 00 00 00       	push   0x6
  401099:	f2 e9 81 ff ff ff    	bnd jmp 401020 <_init+0x20>
  40109f:	90                   	nop
  4010a0:	f3 0f 1e fa          	endbr64 
  4010a4:	68 07 00 00 00       	push   0x7
  4010a9:	f2 e9 71 ff ff ff    	bnd jmp 401020 <_init+0x20>
  4010af:	90                   	nop
  4010b0:	f3 0f 1e fa          	endbr64 
  4010b4:	68 08 00 00 00       	push   0x8
  4010b9:	f2 e9 61 ff ff ff    	bnd jmp 401020 <_init+0x20>
  4010bf:	90                   	nop

Disassembly of section .plt.sec:

00000000004010c0 <write@plt>:
  4010c0:	f3 0f 1e fa          	endbr64 
  4010c4:	f2 ff 25 4d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f4d]        # 404018 <write@GLIBC_2.2.5>
  4010cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010d0 <__stack_chk_fail@plt>:
  4010d0:	f3 0f 1e fa          	endbr64 
  4010d4:	f2 ff 25 45 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f45]        # 404020 <__stack_chk_fail@GLIBC_2.4>
  4010db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010e0 <printf@plt>:
  4010e0:	f3 0f 1e fa          	endbr64 
  4010e4:	f2 ff 25 3d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f3d]        # 404028 <printf@GLIBC_2.2.5>
  4010eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010f0 <close@plt>:
  4010f0:	f3 0f 1e fa          	endbr64 
  4010f4:	f2 ff 25 35 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f35]        # 404030 <close@GLIBC_2.2.5>
  4010fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000401100 <read@plt>:
  401100:	f3 0f 1e fa          	endbr64 
  401104:	f2 ff 25 2d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f2d]        # 404038 <read@GLIBC_2.2.5>
  40110b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000401110 <setvbuf@plt>:
  401110:	f3 0f 1e fa          	endbr64 
  401114:	f2 ff 25 25 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f25]        # 404040 <setvbuf@GLIBC_2.2.5>
  40111b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000401120 <open@plt>:
  401120:	f3 0f 1e fa          	endbr64 
  401124:	f2 ff 25 1d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f1d]        # 404048 <open@GLIBC_2.2.5>
  40112b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000401130 <__isoc99_scanf@plt>:
  401130:	f3 0f 1e fa          	endbr64 
  401134:	f2 ff 25 15 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f15]        # 404050 <__isoc99_scanf@GLIBC_2.7>
  40113b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000401140 <exit@plt>:
  401140:	f3 0f 1e fa          	endbr64 
  401144:	f2 ff 25 0d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f0d]        # 404058 <exit@GLIBC_2.2.5>
  40114b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000401150 <_start>:
  401150:	f3 0f 1e fa          	endbr64 
  401154:	31 ed                	xor    ebp,ebp
  401156:	49 89 d1             	mov    r9,rdx
  401159:	5e                   	pop    rsi
  40115a:	48 89 e2             	mov    rdx,rsp
  40115d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  401161:	50                   	push   rax
  401162:	54                   	push   rsp
  401163:	45 31 c0             	xor    r8d,r8d
  401166:	31 c9                	xor    ecx,ecx
  401168:	48 c7 c7 36 12 40 00 	mov    rdi,0x401236
  40116f:	ff 15 7b 2e 00 00    	call   QWORD PTR [rip+0x2e7b]        # 403ff0 <__libc_start_main@GLIBC_2.34>
  401175:	f4                   	hlt    
  401176:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40117d:	00 00 00 

0000000000401180 <_dl_relocate_static_pie>:
  401180:	f3 0f 1e fa          	endbr64 
  401184:	c3                   	ret    
  401185:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40118c:	00 00 00 
  40118f:	90                   	nop

0000000000401190 <deregister_tm_clones>:
  401190:	b8 70 40 40 00       	mov    eax,0x404070
  401195:	48 3d 70 40 40 00    	cmp    rax,0x404070
  40119b:	74 13                	je     4011b0 <deregister_tm_clones+0x20>
  40119d:	b8 00 00 00 00       	mov    eax,0x0
  4011a2:	48 85 c0             	test   rax,rax
  4011a5:	74 09                	je     4011b0 <deregister_tm_clones+0x20>
  4011a7:	bf 70 40 40 00       	mov    edi,0x404070
  4011ac:	ff e0                	jmp    rax
  4011ae:	66 90                	xchg   ax,ax
  4011b0:	c3                   	ret    
  4011b1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4011b8:	00 00 00 00 
  4011bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000004011c0 <register_tm_clones>:
  4011c0:	be 70 40 40 00       	mov    esi,0x404070
  4011c5:	48 81 ee 70 40 40 00 	sub    rsi,0x404070
  4011cc:	48 89 f0             	mov    rax,rsi
  4011cf:	48 c1 ee 3f          	shr    rsi,0x3f
  4011d3:	48 c1 f8 03          	sar    rax,0x3
  4011d7:	48 01 c6             	add    rsi,rax
  4011da:	48 d1 fe             	sar    rsi,1
  4011dd:	74 11                	je     4011f0 <register_tm_clones+0x30>
  4011df:	b8 00 00 00 00       	mov    eax,0x0
  4011e4:	48 85 c0             	test   rax,rax
  4011e7:	74 07                	je     4011f0 <register_tm_clones+0x30>
  4011e9:	bf 70 40 40 00       	mov    edi,0x404070
  4011ee:	ff e0                	jmp    rax
  4011f0:	c3                   	ret    
  4011f1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4011f8:	00 00 00 00 
  4011fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401200 <__do_global_dtors_aux>:
  401200:	f3 0f 1e fa          	endbr64 
  401204:	80 3d 8d 2e 00 00 00 	cmp    BYTE PTR [rip+0x2e8d],0x0        # 404098 <completed.0>
  40120b:	75 13                	jne    401220 <__do_global_dtors_aux+0x20>
  40120d:	55                   	push   rbp
  40120e:	48 89 e5             	mov    rbp,rsp
  401211:	e8 7a ff ff ff       	call   401190 <deregister_tm_clones>
  401216:	c6 05 7b 2e 00 00 01 	mov    BYTE PTR [rip+0x2e7b],0x1        # 404098 <completed.0>
  40121d:	5d                   	pop    rbp
  40121e:	c3                   	ret    
  40121f:	90                   	nop
  401220:	c3                   	ret    
  401221:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  401228:	00 00 00 00 
  40122c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401230 <frame_dummy>:
  401230:	f3 0f 1e fa          	endbr64 
  401234:	eb 8a                	jmp    4011c0 <register_tm_clones>

0000000000401236 <main>:
  401236:	f3 0f 1e fa          	endbr64 
  40123a:	55                   	push   rbp
  40123b:	48 89 e5             	mov    rbp,rsp
  40123e:	48 83 ec 20          	sub    rsp,0x20
  401242:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  401249:	00 00 
  40124b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  40124f:	31 c0                	xor    eax,eax
  401251:	48 8b 05 38 2e 00 00 	mov    rax,QWORD PTR [rip+0x2e38]        # 404090 <stdin@GLIBC_2.2.5>
  401258:	b9 00 00 00 00       	mov    ecx,0x0
  40125d:	ba 02 00 00 00       	mov    edx,0x2
  401262:	be 00 00 00 00       	mov    esi,0x0
  401267:	48 89 c7             	mov    rdi,rax
  40126a:	e8 a1 fe ff ff       	call   401110 <setvbuf@plt>
  40126f:	48 8b 05 0a 2e 00 00 	mov    rax,QWORD PTR [rip+0x2e0a]        # 404080 <stdout@GLIBC_2.2.5>
  401276:	b9 00 00 00 00       	mov    ecx,0x0
  40127b:	ba 02 00 00 00       	mov    edx,0x2
  401280:	be 00 00 00 00       	mov    esi,0x0
  401285:	48 89 c7             	mov    rdi,rax
  401288:	e8 83 fe ff ff       	call   401110 <setvbuf@plt>
  40128d:	be 00 00 00 00       	mov    esi,0x0
  401292:	48 8d 05 6f 0d 00 00 	lea    rax,[rip+0xd6f]        # 402008 <_IO_stdin_used+0x8>
  401299:	48 89 c7             	mov    rdi,rax
  40129c:	b8 00 00 00 00       	mov    eax,0x0
  4012a1:	e8 7a fe ff ff       	call   401120 <open@plt>
  4012a6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  4012a9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  4012ac:	ba 30 00 00 00       	mov    edx,0x30
  4012b1:	48 8d 0d e8 2d 00 00 	lea    rcx,[rip+0x2de8]        # 4040a0 <flag>
  4012b8:	48 89 ce             	mov    rsi,rcx
  4012bb:	89 c7                	mov    edi,eax
  4012bd:	e8 3e fe ff ff       	call   401100 <read@plt>
  4012c2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  4012c5:	89 c7                	mov    edi,eax
  4012c7:	e8 24 fe ff ff       	call   4010f0 <close@plt>
  4012cc:	ba 0d 00 00 00       	mov    edx,0xd
  4012d1:	48 8d 05 40 0d 00 00 	lea    rax,[rip+0xd40]        # 402018 <_IO_stdin_used+0x18>
  4012d8:	48 89 c6             	mov    rsi,rax
  4012db:	bf 01 00 00 00       	mov    edi,0x1
  4012e0:	e8 db fd ff ff       	call   4010c0 <write@plt>
  4012e5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  4012ec:	00 
  4012ed:	48 8d 05 31 0d 00 00 	lea    rax,[rip+0xd31]        # 402025 <_IO_stdin_used+0x25>
  4012f4:	48 89 c7             	mov    rdi,rax
  4012f7:	b8 00 00 00 00       	mov    eax,0x0
  4012fc:	e8 df fd ff ff       	call   4010e0 <printf@plt>
  401301:	48 8d 45 f0          	lea    rax,[rbp-0x10]
  401305:	48 89 c6             	mov    rsi,rax
  401308:	48 8d 05 27 0d 00 00 	lea    rax,[rip+0xd27]        # 402036 <_IO_stdin_used+0x36>
  40130f:	48 89 c7             	mov    rdi,rax
  401312:	b8 00 00 00 00       	mov    eax,0x0
  401317:	e8 14 fe ff ff       	call   401130 <__isoc99_scanf@plt>
  40131c:	48 8d 05 17 0d 00 00 	lea    rax,[rip+0xd17]        # 40203a <_IO_stdin_used+0x3a>
  401323:	48 89 c7             	mov    rdi,rax
  401326:	b8 00 00 00 00       	mov    eax,0x0
  40132b:	e8 b0 fd ff ff       	call   4010e0 <printf@plt>
  401330:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  401334:	ba 08 00 00 00       	mov    edx,0x8
  401339:	48 89 c6             	mov    rsi,rax
  40133c:	bf 00 00 00 00       	mov    edi,0x0
  401341:	e8 ba fd ff ff       	call   401100 <read@plt>
  401346:	48 8d 05 07 0d 00 00 	lea    rax,[rip+0xd07]        # 402054 <_IO_stdin_used+0x54>
  40134d:	48 89 c7             	mov    rdi,rax
  401350:	b8 00 00 00 00       	mov    eax,0x0
  401355:	e8 86 fd ff ff       	call   4010e0 <printf@plt>
  40135a:	ba 30 00 00 00       	mov    edx,0x30
  40135f:	48 8d 05 3a 2d 00 00 	lea    rax,[rip+0x2d3a]        # 4040a0 <flag>
  401366:	48 89 c6             	mov    rsi,rax
  401369:	bf 01 00 00 00       	mov    edi,0x1
  40136e:	e8 8d fd ff ff       	call   401100 <read@plt>
  401373:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  401376:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  40137a:	7f 0a                	jg     401386 <main+0x150>
  40137c:	bf 01 00 00 00       	mov    edi,0x1
  401381:	e8 ba fd ff ff       	call   401140 <exit@plt>
  401386:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  401389:	83 e8 01             	sub    eax,0x1
  40138c:	48 98                	cdqe   
  40138e:	48 8d 15 0b 2d 00 00 	lea    rdx,[rip+0x2d0b]        # 4040a0 <flag>
  401395:	c6 04 10 00          	mov    BYTE PTR [rax+rdx*1],0x0
  401399:	48 8d 05 00 2d 00 00 	lea    rax,[rip+0x2d00]        # 4040a0 <flag>
  4013a0:	48 89 c6             	mov    rsi,rax
  4013a3:	48 8d 05 be 0c 00 00 	lea    rax,[rip+0xcbe]        # 402068 <_IO_stdin_used+0x68>
  4013aa:	48 89 c7             	mov    rdi,rax
  4013ad:	b8 00 00 00 00       	mov    eax,0x0
  4013b2:	e8 29 fd ff ff       	call   4010e0 <printf@plt>
  4013b7:	b8 00 00 00 00       	mov    eax,0x0
  4013bc:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  4013c0:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  4013c7:	00 00 
  4013c9:	74 05                	je     4013d0 <main+0x19a>
  4013cb:	e8 00 fd ff ff       	call   4010d0 <__stack_chk_fail@plt>
  4013d0:	c9                   	leave  
  4013d1:	c3                   	ret    

Disassembly of section .fini:

00000000004013d4 <_fini>:
  4013d4:	f3 0f 1e fa          	endbr64 
  4013d8:	48 83 ec 08          	sub    rsp,0x8
  4013dc:	48 83 c4 08          	add    rsp,0x8
  4013e0:	c3                   	ret    
