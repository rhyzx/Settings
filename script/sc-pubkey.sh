#!/usr/bin/env sh
ssh $@ 'mkdir -p .ssh && cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub