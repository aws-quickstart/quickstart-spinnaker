#!/bin/bash

    socket=$HOME/.ssh/spinnaker-tunnel.ctl

    if [ "$1" == "start" ]; then
      if [ ! \( -e ${socket} \) ]; then
        echo "Starting tunnel to Spinnaker..."
        ssh -f -N spinnaker-start && echo "Done."
      else
        echo "Tunnel to Spinnaker running."
      fi
    fi

    if [ "$1" == "stop" ]; then
      if [ \( -e ${socket} \) ]; then
        echo "Stopping tunnel to Spinnaker..."
        ssh -O "exit" spinnaker-stop && echo "Done."
      else
        echo "Tunnel to Spinnaker stopped."
      fi
    fi
