/*
 * Professional Linux Programming - Trig functions
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAX_INPUT 25

int main(int argc, char** argv)
{
    char input[MAX_INPUT];
    double angle;
    printf("Give me an angle (in radians) ==> ");
    if(!fgets(input, MAX_INPUT, stdin)){
        perror("an error occured.\n");
    }
    angle = strtod(input, NULL);

    printf("sin(%e) = %e\n", angle, sin(angle));
    printf("cos(%e) = %e\n", angle, cos(angle));
    printf("tan(%e) = %e\n", angle, tan(angle));

    return 0;
}
