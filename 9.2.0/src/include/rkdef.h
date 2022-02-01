//
// Created by yigonghu on 2/1/22.
//
#ifndef _rkdef_h
#define _rkdef_h

#include <pthread.h>
#define RKLOGMAX 1000000

struct Rec {
  pthread_t tid;  // assume the pointer are different
  long long duration;
};

sig_atomic_t all_log_count;
struct Rec all_log[RKLOGMAX];




inline void put_log( pthread_t t, long long d) {
  size_t count = all_log_count++;
  if (count < RKLOGMAX) {
    all_log[count].tid = t;
    all_log[count].duration = d;
  }
}

#endif //_rkdef_h

