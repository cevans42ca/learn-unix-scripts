#include <stdio.h>
#include <stdlib.h> // For rand(), srand(), exit()
#include <signal.h>
#include <unistd.h> // For sleep(), getpid(), alarm()
#include <time.h>   // For time()
#include <string.h> // For strcmp()

// Array of taunts
const char *TAKE_THAT[] = {
    "Better luck next time!",
    "You missed!  I could do this all day!",
    "You can't kill me in a way that matters!",
    "You can't kill me!  I will not die!",
    "You can't kill me!  I am invincible!",
    "You can't kill me!  I will rise again!"
};
const int NUM_TAUNTS = sizeof(TAKE_THAT) / sizeof(TAKE_THAT[0]);

// Global flag to indicate it's time to exit
volatile sig_atomic_t time_to_exit = 0;

// Signal handler for SIGTERM
void sigterm_handler(int signum) {
    // Pick a random taunt
    int taunt_index = rand() % NUM_TAUNTS;
    printf("Bob the Undying (PID: %d) received SIGTERM: %s\n", getpid(), TAKE_THAT[taunt_index]);
    // No exit() call here, effectively ignoring the signal
}

// Signal handler for SIGALRM
void sigalrm_handler(int signum) {
    printf("Bob the Undying (PID: %d) received SIGALRM.  Time to rest...\n", getpid());
    time_to_exit = 1; // Set the flag to indicate exit
}


int main(int argc, char *argv[]) {
    // Check for the "--yes-really" argument
    if (argc < 2 || strcmp(argv[1], "--yes-really") != 0) {
        fprintf(stderr, "Bob should only be awoken as part of the black stripe exercises.\n");
        fprintf(stderr, "If you're ready, execute 'bobtheundying --yes-really &'.\n");
        return 1; // Exit with an error code
    }

    // Seed the random number generator
    srand(time(NULL));

    printf("Bob the Undying (PID: %d):  I am Bob!  I live again!\n", getpid());

    // Register the signal handler for SIGTERM
    if (signal(SIGTERM, sigterm_handler) == SIG_ERR) {
        perror("signal");
        return 1; // Exit with an error if signal registration fails
    }

    // Register the signal handler for SIGALRM
    if (signal(SIGALRM, sigalrm_handler) == SIG_ERR) {
        perror("signal");
        return 1; // Exit with an error if signal registration fails
    }

    // Set the alarm for 5 minutes (300 seconds)
    alarm(300); // 5 minutes * 60 seconds/minute

    // Keep the process running until the alarm signal.
    while (!time_to_exit) {
        sleep(10);
    }

    printf("bob (PID: %d) died of old age.\n", getpid());
    return 0; // Exit gracefully
}
