
share/chal:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    rsp,0x8
  401008:	48 8b 05 e9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fe9]        # 403ff8 <__gmon_start__>
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
  401039:	f2 e9 e1 ff ff ff    	bnd jmp 401020 <.plt>
  40103f:	90                   	nop
  401040:	f3 0f 1e fa          	endbr64 
  401044:	68 01 00 00 00       	push   0x1
  401049:	f2 e9 d1 ff ff ff    	bnd jmp 401020 <.plt>
  40104f:	90                   	nop
  401050:	f3 0f 1e fa          	endbr64 
  401054:	68 02 00 00 00       	push   0x2
  401059:	f2 e9 c1 ff ff ff    	bnd jmp 401020 <.plt>
  40105f:	90                   	nop
  401060:	f3 0f 1e fa          	endbr64 
  401064:	68 03 00 00 00       	push   0x3
  401069:	f2 e9 b1 ff ff ff    	bnd jmp 401020 <.plt>
  40106f:	90                   	nop
  401070:	f3 0f 1e fa          	endbr64 
  401074:	68 04 00 00 00       	push   0x4
  401079:	f2 e9 a1 ff ff ff    	bnd jmp 401020 <.plt>
  40107f:	90                   	nop
  401080:	f3 0f 1e fa          	endbr64 
  401084:	68 05 00 00 00       	push   0x5
  401089:	f2 e9 91 ff ff ff    	bnd jmp 401020 <.plt>
  40108f:	90                   	nop

Disassembly of section .plt.sec:

0000000000401090 <fread@plt>:
  401090:	f3 0f 1e fa          	endbr64 
  401094:	f2 ff 25 7d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f7d]        # 404018 <fread@GLIBC_2.2.5>
  40109b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010a0 <write@plt>:
  4010a0:	f3 0f 1e fa          	endbr64 
  4010a4:	f2 ff 25 75 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f75]        # 404020 <write@GLIBC_2.2.5>
  4010ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010b0 <read@plt>:
  4010b0:	f3 0f 1e fa          	endbr64 
  4010b4:	f2 ff 25 6d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f6d]        # 404028 <read@GLIBC_2.2.5>
  4010bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010c0 <strcmp@plt>:
  4010c0:	f3 0f 1e fa          	endbr64 
  4010c4:	f2 ff 25 65 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f65]        # 404030 <strcmp@GLIBC_2.2.5>
  4010cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010d0 <malloc@plt>:
  4010d0:	f3 0f 1e fa          	endbr64 
  4010d4:	f2 ff 25 5d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f5d]        # 404038 <malloc@GLIBC_2.2.5>
  4010db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010e0 <fopen@plt>:
  4010e0:	f3 0f 1e fa          	endbr64 
  4010e4:	f2 ff 25 55 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f55]        # 404040 <fopen@GLIBC_2.2.5>
  4010eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

00000000004010f0 <_start>:
  4010f0:	f3 0f 1e fa          	endbr64 
  4010f4:	31 ed                	xor    ebp,ebp
  4010f6:	49 89 d1             	mov    r9,rdx
  4010f9:	5e                   	pop    rsi
  4010fa:	48 89 e2             	mov    rdx,rsp
  4010fd:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  401101:	50                   	push   rax
  401102:	54                   	push   rsp
  401103:	49 c7 c0 e0 12 40 00 	mov    r8,0x4012e0
  40110a:	48 c7 c1 70 12 40 00 	mov    rcx,0x401270
  401111:	48 c7 c7 d6 11 40 00 	mov    rdi,0x4011d6
  401118:	ff 15 d2 2e 00 00    	call   QWORD PTR [rip+0x2ed2]        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  40111e:	f4                   	hlt    
  40111f:	90                   	nop

0000000000401120 <_dl_relocate_static_pie>:
  401120:	f3 0f 1e fa          	endbr64 
  401124:	c3                   	ret    
  401125:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40112c:	00 00 00 
  40112f:	90                   	nop

0000000000401130 <deregister_tm_clones>:
  401130:	b8 78 40 40 00       	mov    eax,0x404078
  401135:	48 3d 78 40 40 00    	cmp    rax,0x404078
  40113b:	74 13                	je     401150 <deregister_tm_clones+0x20>
  40113d:	b8 00 00 00 00       	mov    eax,0x0
  401142:	48 85 c0             	test   rax,rax
  401145:	74 09                	je     401150 <deregister_tm_clones+0x20>
  401147:	bf 78 40 40 00       	mov    edi,0x404078
  40114c:	ff e0                	jmp    rax
  40114e:	66 90                	xchg   ax,ax
  401150:	c3                   	ret    
  401151:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  401158:	00 00 00 00 
  40115c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401160 <register_tm_clones>:
  401160:	be 78 40 40 00       	mov    esi,0x404078
  401165:	48 81 ee 78 40 40 00 	sub    rsi,0x404078
  40116c:	48 89 f0             	mov    rax,rsi
  40116f:	48 c1 ee 3f          	shr    rsi,0x3f
  401173:	48 c1 f8 03          	sar    rax,0x3
  401177:	48 01 c6             	add    rsi,rax
  40117a:	48 d1 fe             	sar    rsi,1
  40117d:	74 11                	je     401190 <register_tm_clones+0x30>
  40117f:	b8 00 00 00 00       	mov    eax,0x0
  401184:	48 85 c0             	test   rax,rax
  401187:	74 07                	je     401190 <register_tm_clones+0x30>
  401189:	bf 78 40 40 00       	mov    edi,0x404078
  40118e:	ff e0                	jmp    rax
  401190:	c3                   	ret    
  401191:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  401198:	00 00 00 00 
  40119c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000004011a0 <__do_global_dtors_aux>:
  4011a0:	f3 0f 1e fa          	endbr64 
  4011a4:	80 3d ca 2e 00 00 00 	cmp    BYTE PTR [rip+0x2eca],0x0        # 404075 <completed.8061>
  4011ab:	75 13                	jne    4011c0 <__do_global_dtors_aux+0x20>
  4011ad:	55                   	push   rbp
  4011ae:	48 89 e5             	mov    rbp,rsp
  4011b1:	e8 7a ff ff ff       	call   401130 <deregister_tm_clones>
  4011b6:	c6 05 b8 2e 00 00 01 	mov    BYTE PTR [rip+0x2eb8],0x1        # 404075 <completed.8061>
  4011bd:	5d                   	pop    rbp
  4011be:	c3                   	ret    
  4011bf:	90                   	nop
  4011c0:	c3                   	ret    
  4011c1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4011c8:	00 00 00 00 
  4011cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000004011d0 <frame_dummy>:
  4011d0:	f3 0f 1e fa          	endbr64 
  4011d4:	eb 8a                	jmp    401160 <register_tm_clones>

00000000004011d6 <main>:
  4011d6:	f3 0f 1e fa          	endbr64 
  4011da:	55                   	push   rbp
  4011db:	48 89 e5             	mov    rbp,rsp
  4011de:	48 83 ec 10          	sub    rsp,0x10
  4011e2:	bf 10 00 00 00       	mov    edi,0x10
  4011e7:	e8 e4 fe ff ff       	call   4010d0 <malloc@plt>
  4011ec:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4011f0:	48 8d 35 0d 0e 00 00 	lea    rsi,[rip+0xe0d]        # 402004 <_IO_stdin_used+0x4>
  4011f7:	48 8d 3d 08 0e 00 00 	lea    rdi,[rip+0xe08]        # 402006 <_IO_stdin_used+0x6>
  4011fe:	e8 dd fe ff ff       	call   4010e0 <fopen@plt>
  401203:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  401207:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  40120b:	ba 00 10 00 00       	mov    edx,0x1000
  401210:	48 89 c6             	mov    rsi,rax
  401213:	bf 00 00 00 00       	mov    edi,0x0
  401218:	e8 93 fe ff ff       	call   4010b0 <read@plt>
  40121d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  401221:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  401225:	48 89 d1             	mov    rcx,rdx
  401228:	ba 01 00 00 00       	mov    edx,0x1
  40122d:	be 10 00 00 00       	mov    esi,0x10
  401232:	48 89 c7             	mov    rdi,rax
  401235:	e8 56 fe ff ff       	call   401090 <fread@plt>
  40123a:	48 8d 35 cf 0d 00 00 	lea    rsi,[rip+0xdcf]        # 402010 <_IO_stdin_used+0x10>
  401241:	48 8d 3d 28 2e 00 00 	lea    rdi,[rip+0x2e28]        # 404070 <owo>
  401248:	e8 73 fe ff ff       	call   4010c0 <strcmp@plt>
  40124d:	85 c0                	test   eax,eax
  40124f:	74 16                	je     401267 <main+0x91>
  401251:	ba 10 00 00 00       	mov    edx,0x10
  401256:	48 8d 35 03 2e 00 00 	lea    rsi,[rip+0x2e03]        # 404060 <flag>
  40125d:	bf 01 00 00 00       	mov    edi,0x1
  401262:	e8 39 fe ff ff       	call   4010a0 <write@plt>
  401267:	b8 00 00 00 00       	mov    eax,0x0
  40126c:	c9                   	leave  
  40126d:	c3                   	ret    
  40126e:	66 90                	xchg   ax,ax

0000000000401270 <__libc_csu_init>:
  401270:	f3 0f 1e fa          	endbr64 
  401274:	41 57                	push   r15
  401276:	4c 8d 3d 93 2b 00 00 	lea    r15,[rip+0x2b93]        # 403e10 <__frame_dummy_init_array_entry>
  40127d:	41 56                	push   r14
  40127f:	49 89 d6             	mov    r14,rdx
  401282:	41 55                	push   r13
  401284:	49 89 f5             	mov    r13,rsi
  401287:	41 54                	push   r12
  401289:	41 89 fc             	mov    r12d,edi
  40128c:	55                   	push   rbp
  40128d:	48 8d 2d 84 2b 00 00 	lea    rbp,[rip+0x2b84]        # 403e18 <__do_global_dtors_aux_fini_array_entry>
  401294:	53                   	push   rbx
  401295:	4c 29 fd             	sub    rbp,r15
  401298:	48 83 ec 08          	sub    rsp,0x8
  40129c:	e8 5f fd ff ff       	call   401000 <_init>
  4012a1:	48 c1 fd 03          	sar    rbp,0x3
  4012a5:	74 1f                	je     4012c6 <__libc_csu_init+0x56>
  4012a7:	31 db                	xor    ebx,ebx
  4012a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4012b0:	4c 89 f2             	mov    rdx,r14
  4012b3:	4c 89 ee             	mov    rsi,r13
  4012b6:	44 89 e7             	mov    edi,r12d
  4012b9:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
  4012bd:	48 83 c3 01          	add    rbx,0x1
  4012c1:	48 39 dd             	cmp    rbp,rbx
  4012c4:	75 ea                	jne    4012b0 <__libc_csu_init+0x40>
  4012c6:	48 83 c4 08          	add    rsp,0x8
  4012ca:	5b                   	pop    rbx
  4012cb:	5d                   	pop    rbp
  4012cc:	41 5c                	pop    r12
  4012ce:	41 5d                	pop    r13
  4012d0:	41 5e                	pop    r14
  4012d2:	41 5f                	pop    r15
  4012d4:	c3                   	ret    
  4012d5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
  4012dc:	00 00 00 00 

00000000004012e0 <__libc_csu_fini>:
  4012e0:	f3 0f 1e fa          	endbr64 
  4012e4:	c3                   	ret    

Disassembly of section .fini:

00000000004012e8 <_fini>:
  4012e8:	f3 0f 1e fa          	endbr64 
  4012ec:	48 83 ec 08          	sub    rsp,0x8
  4012f0:	48 83 c4 08          	add    rsp,0x8
  4012f4:	c3                   	ret    
