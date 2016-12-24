#!/bin/bash
# -*- coding:utf-8 -*-

# Get Settings
. `dirname $0`/narou_update.settings

# Load function
. `dirname $0`/narou_update_func.sh

# run check
wait_other_script

### main ###
pushd $NAROU_DIR

# Update
#$NAROU update -n
$NAROU update -n -gl
$NAROU mail hotentry

tag_add_noconv ./log/`ls -1t log | head -1`

$NAROU tag -a $NOCONV_TAG `$NAROU list -t modified | cat`
$NAROU tag -d modified `$NAROU list -t modified | cat`

$NAROU freeze --on tag:end
$NAROU freeze --on tag:404

popd
# EOF
