#include <signal.h>
// sigsetmask(2)

#include <unistd.h>
// sleep(3)


int main(void) {
	sigsetmask(-1);
	for (;;) sleep(99999);
}
