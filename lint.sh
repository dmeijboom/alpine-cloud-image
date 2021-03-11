#!/bin/bash

sudo salt-call state.highstate --file-root=./config --local --retcode-passthrough mocked=True
