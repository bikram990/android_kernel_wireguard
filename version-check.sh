#!/bin/bash
# SPDX-License-Identifier: GPL-2.0
#
# Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.

set -e
[[ -n $1 && -f $1/Makefile ]]
[[ $(< "$1/Makefile") =~ VERSION[[:space:]]*=[[:space:]]*([0-9]+).*PATCHLEVEL[[:space:]]*=[[:space:]]*([0-9]+).*SUBLEVEL[[:space:]]*=[[:space:]]*([0-9]+) ]]
LINUX_VERSION_CODE=$(( (${BASH_REMATCH[1]} * 65536) + (${BASH_REMATCH[2]} * 256) + ${BASH_REMATCH[3]} ))
(( LINUX_VERSION_CODE >= ((3 * 65536) + (10 * 256) + 0) ))
