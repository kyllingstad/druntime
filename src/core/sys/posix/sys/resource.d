/**
 * D header file for POSIX.
 *
 * Copyright: Copyright (c) 2013, the authors.
 * License:   <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors:   Lars Tandle Kyllingstad
 * Standards: The Open Group Base Specifications Issue 7, IEEE Std 1003.1-2008
 */
module core.sys.posix.sys.resource;
version (Posix):

public import core.sys.posix.sys.time;
public import core.sys.posix.sys.types: id_t;
import core.sys.posix.config;

nothrow extern(C):

//
// XOpen (XSI)
//
/*
enum
{
    PRIO_PROCESS,
    PRIO_PGRP,
    PRIO_USER,
}

alias ulong rlim_t;

enum
{
    RLIM_INFINITY,
    RLIM_SAVED_MAX,
    RLIM_SAVED_CUR,
}

enum
{
    RUSAGE_SELF,
    RUSAGE_CHILDREN,
}

struct rlimit
{
    rlim_t rlim_cur;
    rlim_t rlim_max;
}

struct rusage
{
    timeval ru_utime;
    timeval ru_stime;
}

enum
{
    RLIMIT_CORE,
    RLIMIT_CPU,
    RLIMIT_DATA,
    RLIMIT_FSIZE,
    RLIMIT_NOFILE,
    RLIMIT_STACK,
    RLIMIT_AS,
}

int getpriority(int, id_t);
int getrlimit(int, rlimit*);
int getrusage(int, rusage*);
int setpriority(int, id_t, int);
int setrlimit(int, const rlimit*);
*/


version (linux)
{

    enum
    {
        PRIO_PROCESS = 0,
        PRIO_PGRP    = 1,
        PRIO_USER    = 2,
    }

    static if (__USE_FILE_OFFSET64)
         alias ulong rlim_t;
    else
         alias c_ulong rlim_t;

    static if (__USE_FILE_OFFSET64)
        enum RLIM_INFINITY = 0xffffffffffffffffUL;
    else
        enum RLIM_INFINITY = cast(c_ulong)(~0UL);

    enum RLIM_SAVED_MAX = RLIM_INFINITY;
    enum RLIM_SAVED_CUR = RLIM_INFINITY;

    enum
    {
        RUSAGE_SELF     =  0,
        RUSAGE_CHILDREN = -1,
    }

    enum
    {
        RLIMIT_CORE   = 4,
        RLIMIT_CPU    = 0,
        RLIMIT_DATA   = 2,
        RLIMIT_FSIZE  = 1,
        RLIMIT_NOFILE = 7,
        RLIMIT_STACK  = 3,
        RLIMIT_AS     = 9,
    }
}
else version (OSX)
{
}
else version (FreeBSD)
{
}
else version (Solaris)
{
}
else static assert (false, "Unsupported platform");

struct rlimit
{
    rlim_t rlim_cur;
    rlim_t rlim_max;
}

struct rusage
{
    timeval ru_utime;
    timeval ru_stime;
}

int getpriority(int, id_t);
int getrlimit(int, rlimit*);
int getrusage(int, rusage*);
int setpriority(int, id_t, int);
int setrlimit(int, const rlimit*);
