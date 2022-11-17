
share/chal:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 4a 2f 00 00    	push   QWORD PTR [rip+0x2f4a]        # 3f70 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 4b 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f4b]        # 3f78 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nop    DWORD PTR [rax]
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	push   0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	push   0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	push   0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmp 1020 <_init+0x20>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	push   0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmp 1020 <_init+0x20>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	push   0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	push   0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	push   0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0a 00 00 00       	push   0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmp 1020 <_init+0x20>
    10df:	90                   	nop

Disassembly of section .plt.got:

00000000000010e0 <__cxa_finalize@plt>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	f2 ff 25 0d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f0d]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    10eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

00000000000010f0 <seccomp_init@plt>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	f2 ff 25 85 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e85]        # 3f80 <seccomp_init@Base>
    10fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001100 <seccomp_rule_add@plt>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	f2 ff 25 7d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e7d]        # 3f88 <seccomp_rule_add@Base>
    110b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001110 <write@plt>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	f2 ff 25 75 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e75]        # 3f90 <write@GLIBC_2.2.5>
    111b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001120 <seccomp_load@plt>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	f2 ff 25 6d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e6d]        # 3f98 <seccomp_load@Base>
    112b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001130 <mmap@plt>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	f2 ff 25 65 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e65]        # 3fa0 <mmap@GLIBC_2.2.5>
    113b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001140 <seccomp_release@plt>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	f2 ff 25 5d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e5d]        # 3fa8 <seccomp_release@Base>
    114b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001150 <close@plt>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	f2 ff 25 55 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e55]        # 3fb0 <close@GLIBC_2.2.5>
    115b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001160 <read@plt>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	f2 ff 25 4d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e4d]        # 3fb8 <read@GLIBC_2.2.5>
    116b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001170 <open@plt>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	f2 ff 25 45 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e45]        # 3fc0 <open@GLIBC_2.2.5>
    117b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001180 <perror@plt>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	f2 ff 25 3d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e3d]        # 3fc8 <perror@GLIBC_2.2.5>
    118b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001190 <exit@plt>:
    1190:	f3 0f 1e fa          	endbr64 
    1194:	f2 ff 25 35 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e35]        # 3fd0 <exit@GLIBC_2.2.5>
    119b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

00000000000011a0 <_start>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	31 ed                	xor    ebp,ebp
    11a6:	49 89 d1             	mov    r9,rdx
    11a9:	5e                   	pop    rsi
    11aa:	48 89 e2             	mov    rdx,rsp
    11ad:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    11b1:	50                   	push   rax
    11b2:	54                   	push   rsp
    11b3:	45 31 c0             	xor    r8d,r8d
    11b6:	31 c9                	xor    ecx,ecx
    11b8:	48 8d 3d ca 00 00 00 	lea    rdi,[rip+0xca]        # 1289 <main>
    11bf:	ff 15 13 2e 00 00    	call   QWORD PTR [rip+0x2e13]        # 3fd8 <__libc_start_main@GLIBC_2.34>
    11c5:	f4                   	hlt    
    11c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    11cd:	00 00 00 

00000000000011d0 <deregister_tm_clones>:
    11d0:	48 8d 3d 39 2e 00 00 	lea    rdi,[rip+0x2e39]        # 4010 <__TMC_END__>
    11d7:	48 8d 05 32 2e 00 00 	lea    rax,[rip+0x2e32]        # 4010 <__TMC_END__>
    11de:	48 39 f8             	cmp    rax,rdi
    11e1:	74 15                	je     11f8 <deregister_tm_clones+0x28>
    11e3:	48 8b 05 f6 2d 00 00 	mov    rax,QWORD PTR [rip+0x2df6]        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    11ea:	48 85 c0             	test   rax,rax
    11ed:	74 09                	je     11f8 <deregister_tm_clones+0x28>
    11ef:	ff e0                	jmp    rax
    11f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    11f8:	c3                   	ret    
    11f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001200 <register_tm_clones>:
    1200:	48 8d 3d 09 2e 00 00 	lea    rdi,[rip+0x2e09]        # 4010 <__TMC_END__>
    1207:	48 8d 35 02 2e 00 00 	lea    rsi,[rip+0x2e02]        # 4010 <__TMC_END__>
    120e:	48 29 fe             	sub    rsi,rdi
    1211:	48 89 f0             	mov    rax,rsi
    1214:	48 c1 ee 3f          	shr    rsi,0x3f
    1218:	48 c1 f8 03          	sar    rax,0x3
    121c:	48 01 c6             	add    rsi,rax
    121f:	48 d1 fe             	sar    rsi,1
    1222:	74 14                	je     1238 <register_tm_clones+0x38>
    1224:	48 8b 05 c5 2d 00 00 	mov    rax,QWORD PTR [rip+0x2dc5]        # 3ff0 <_ITM_registerTMCloneTable@Base>
    122b:	48 85 c0             	test   rax,rax
    122e:	74 08                	je     1238 <register_tm_clones+0x38>
    1230:	ff e0                	jmp    rax
    1232:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1238:	c3                   	ret    
    1239:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001240 <__do_global_dtors_aux>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	80 3d d5 2d 00 00 00 	cmp    BYTE PTR [rip+0x2dd5],0x0        # 4020 <completed.0>
    124b:	75 2b                	jne    1278 <__do_global_dtors_aux+0x38>
    124d:	55                   	push   rbp
    124e:	48 83 3d a2 2d 00 00 	cmp    QWORD PTR [rip+0x2da2],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1255:	00 
    1256:	48 89 e5             	mov    rbp,rsp
    1259:	74 0c                	je     1267 <__do_global_dtors_aux+0x27>
    125b:	48 8b 3d a6 2d 00 00 	mov    rdi,QWORD PTR [rip+0x2da6]        # 4008 <__dso_handle>
    1262:	e8 79 fe ff ff       	call   10e0 <__cxa_finalize@plt>
    1267:	e8 64 ff ff ff       	call   11d0 <deregister_tm_clones>
    126c:	c6 05 ad 2d 00 00 01 	mov    BYTE PTR [rip+0x2dad],0x1        # 4020 <completed.0>
    1273:	5d                   	pop    rbp
    1274:	c3                   	ret    
    1275:	0f 1f 00             	nop    DWORD PTR [rax]
    1278:	c3                   	ret    
    1279:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001280 <frame_dummy>:
    1280:	f3 0f 1e fa          	endbr64 
    1284:	e9 77 ff ff ff       	jmp    1200 <register_tm_clones>

0000000000001289 <main>:
    1289:	f3 0f 1e fa          	endbr64 
    128d:	55                   	push   rbp
    128e:	48 89 e5             	mov    rbp,rsp
    1291:	48 83 ec 20          	sub    rsp,0x20
    1295:	41 b9 00 00 00 00    	mov    r9d,0x0
    129b:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
    12a1:	b9 22 00 00 00       	mov    ecx,0x22
    12a6:	ba 07 00 00 00       	mov    edx,0x7
    12ab:	be 00 10 00 00       	mov    esi,0x1000
    12b0:	bf 00 00 00 00       	mov    edi,0x0
    12b5:	e8 76 fe ff ff       	call   1130 <mmap@plt>
    12ba:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    12be:	48 83 7d f0 ff       	cmp    QWORD PTR [rbp-0x10],0xffffffffffffffff
    12c3:	75 19                	jne    12de <main+0x55>
    12c5:	48 8d 05 3c 0d 00 00 	lea    rax,[rip+0xd3c]        # 2008 <_IO_stdin_used+0x8>
    12cc:	48 89 c7             	mov    rdi,rax
    12cf:	e8 ac fe ff ff       	call   1180 <perror@plt>
    12d4:	bf 01 00 00 00       	mov    edi,0x1
    12d9:	e8 b2 fe ff ff       	call   1190 <exit@plt>
    12de:	be 00 00 00 00       	mov    esi,0x0
    12e3:	48 8d 05 23 0d 00 00 	lea    rax,[rip+0xd23]        # 200d <_IO_stdin_used+0xd>
    12ea:	48 89 c7             	mov    rdi,rax
    12ed:	b8 00 00 00 00       	mov    eax,0x0
    12f2:	e8 79 fe ff ff       	call   1170 <open@plt>
    12f7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    12fa:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
    12fe:	75 19                	jne    1319 <main+0x90>
    1300:	48 8d 05 16 0d 00 00 	lea    rax,[rip+0xd16]        # 201d <_IO_stdin_used+0x1d>
    1307:	48 89 c7             	mov    rdi,rax
    130a:	e8 71 fe ff ff       	call   1180 <perror@plt>
    130f:	bf 01 00 00 00       	mov    edi,0x1
    1314:	e8 77 fe ff ff       	call   1190 <exit@plt>
    1319:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    131c:	ba 30 00 00 00       	mov    edx,0x30
    1321:	48 8d 0d 18 2d 00 00 	lea    rcx,[rip+0x2d18]        # 4040 <flag>
    1328:	48 89 ce             	mov    rsi,rcx
    132b:	89 c7                	mov    edi,eax
    132d:	e8 2e fe ff ff       	call   1160 <read@plt>
    1332:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    1335:	89 c7                	mov    edi,eax
    1337:	e8 14 fe ff ff       	call   1150 <close@plt>
    133c:	ba 21 00 00 00       	mov    edx,0x21
    1341:	48 8d 05 e0 0c 00 00 	lea    rax,[rip+0xce0]        # 2028 <_IO_stdin_used+0x28>
    1348:	48 89 c6             	mov    rsi,rax
    134b:	bf 01 00 00 00       	mov    edi,0x1
    1350:	e8 bb fd ff ff       	call   1110 <write@plt>
    1355:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1359:	ba 00 10 00 00       	mov    edx,0x1000
    135e:	48 89 c6             	mov    rsi,rax
    1361:	bf 00 00 00 00       	mov    edi,0x0
    1366:	e8 f5 fd ff ff       	call   1160 <read@plt>
    136b:	bf 00 00 00 00       	mov    edi,0x0
    1370:	e8 7b fd ff ff       	call   10f0 <seccomp_init@plt>
    1375:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1379:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    137d:	b9 00 00 00 00       	mov    ecx,0x0
    1382:	ba 3c 00 00 00       	mov    edx,0x3c
    1387:	be 00 00 ff 7f       	mov    esi,0x7fff0000
    138c:	48 89 c7             	mov    rdi,rax
    138f:	b8 00 00 00 00       	mov    eax,0x0
    1394:	e8 67 fd ff ff       	call   1100 <seccomp_rule_add@plt>
    1399:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    139d:	b9 00 00 00 00       	mov    ecx,0x0
    13a2:	ba e7 00 00 00       	mov    edx,0xe7
    13a7:	be 00 00 ff 7f       	mov    esi,0x7fff0000
    13ac:	48 89 c7             	mov    rdi,rax
    13af:	b8 00 00 00 00       	mov    eax,0x0
    13b4:	e8 47 fd ff ff       	call   1100 <seccomp_rule_add@plt>
    13b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    13bd:	48 89 c7             	mov    rdi,rax
    13c0:	e8 5b fd ff ff       	call   1120 <seccomp_load@plt>
    13c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    13c9:	48 89 c7             	mov    rdi,rax
    13cc:	e8 6f fd ff ff       	call   1140 <seccomp_release@plt>
    13d1:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    13d5:	b8 00 00 00 00       	mov    eax,0x0
    13da:	ff d2                	call   rdx
    13dc:	b8 00 00 00 00       	mov    eax,0x0
    13e1:	c9                   	leave  
    13e2:	c3                   	ret    

Disassembly of section .fini:

00000000000013e4 <_fini>:
    13e4:	f3 0f 1e fa          	endbr64 
    13e8:	48 83 ec 08          	sub    rsp,0x8
    13ec:	48 83 c4 08          	add    rsp,0x8
    13f0:	c3                   	ret    
