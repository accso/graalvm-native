#include <iostream>
#include <libmymath.h>

int main() {
    graal_isolate_t       *isolate = NULL;
    graal_isolatethread_t *thread = NULL;

    if (graal_create_isolate(NULL, &isolate, &thread) != 0) {
        fprintf(stderr, "initialization error\n");
        return 1;
    }
	
    int result1 = add(thread, 2, 3);
    printf("result from 2 + 3 = %d\n", result1);

    int result2 = multiply(thread, 5, 7);
    printf("result from 5 * 7 = %d\n", result2);

    return 0;
}
