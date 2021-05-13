#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ozone scm --init
ozone scm &

#wait for scm startup
export WAITFOR=localhost:9876

/opt/hadoop/libexec/entrypoint.sh ozone datanode &

/opt/hadoop/libexec/entrypoint.sh ozone om --init
/opt/hadoop/libexec/entrypoint.sh ozone om &
sleep 15
/opt/hadoop/libexec/entrypoint.sh ozone recon &
/opt/hadoop/libexec/entrypoint.sh ozone s3g
