#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

counter=0
lock_file="/tmp/counter.lock"

function increment_counter() {
  # Acquire the lock
  flock -n $lock_file || exit 1

  local new_counter=$((counter + 1))
  counter=$new_counter

  # Release the lock
  flock -u $lock_file
}

# Create two processes to increment the counter concurrently.
increment_counter &
increment_counter &

# Wait for the processes to finish.
wait

# Print the final counter value.  This will always be 2
echo "Counter: $counter"