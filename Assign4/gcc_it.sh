#!/bin/bash

gcc -m32 $1 -fno-stack-protector -z execstack -ggdb -o $1.run

