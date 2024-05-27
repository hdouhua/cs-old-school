#!/usr/bin/env bash

multipass stop vm1
multipass delete vm1

multipass stop vm2
multipass delete vm2

multipass purge
