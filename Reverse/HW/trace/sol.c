#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/ptrace.h>

pid_t pid;
int status;

int open_file() {
    int fd, flag;
    mode_t mode;

    flag = 577; // O_TRUNC | O_CREAT | O_WRONLY
    mode = 511; // rw- --x --x
    
    fd = open("/tmp/cs_2022_fall_ouo", flag, mode);

    char *buf = 0x4020;  // begin of the .data section (0x3020 to 0x6900)
    size_t size = 0x38E1;
    write(fd, buf, size);

    return close(fd);
}

void fork_child() {
    pid = fork();
    if(!pid)
        trace_me();
    if(pid < 0)
        exit(1);

    wait(&status);

    if(WTERMSIG(status) == 0)
        exit(1);
}

void trace_me() {
    if(ptrace(PTRACE_TRACEME, 0, 0, 0) == -1)
        exit(1);
    execl("/tmp/cs_2022_fall_ouo", "cs_2022_fall_ouo", 0);
    exit(1);
}

void trace_process() {
    // ptrace(enum __ptrace_request request, pid_t pid, void *addr, void *data)

    // 執行這個指令後在下一個指令暫停
    ptrace(PTRACE_SINGLESTEP, pid, 0, 0);

    waitpid(pid, &status, 0);

    if(WTERMSIG(status) == 0)
        exit(1);

    // Copy the tracee's general-purpose or floating-point
    // registers, respectively, to the address `data` in the tracer.
    ptrace(PTRACE_GETREGS, pid, 0, 0x7960);
}

void trace_text() {
    if (ptrace(PTRACE_PEEKTEXT, pid, 0x79E0, 0) == 0xE8CBCCDEADBEEFE8)
        ptrace(PTRACE_POKETEXT, pid, 0x79E0, 0x9090909090909090);
}

unsigned char flag[] = {
  0x37, 0x3D, 0x30, 0x36, 0x0A, 0x25, 0x03, 0x30, 0x12, 0x42, 
  0x2E, 0x3C, 0x42, 0x2E, 0x40, 0x37, 0x2E, 0x24, 0x2E, 0x12, 
  0x30, 0x3F, 0x0C, 0x00
};

int main() {
    // open_file();
    // fork_child();

    // while(1) {
    //     trace_process();
    //     trace_text();
    // }

    for(int i = 0; i < 24; i++) {
        flag[i] ^= 0x71;
    }

    printf("%s\n", flag);
}