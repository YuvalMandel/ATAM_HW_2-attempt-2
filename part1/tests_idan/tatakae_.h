//
// Created by boazmoav on 24/08/2021.
// Edited by idanbaruch on 25/12/2021.
//

#ifndef HW2_WET_STUDENTS_CODE_H
#define HW2_WET_STUDENTS_CODE_H
#include <stdint.h>

void keyMixing(uint8_t input[4][4], uint8_t key[4][4]);
void byteSubstitution(uint8_t input[4][4]);
void shiftRows(uint8_t input[4][4]);

#endif //HW2_WET_STUDENTS_CODE_H
