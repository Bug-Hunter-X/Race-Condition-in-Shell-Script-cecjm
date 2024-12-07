#!/bin/bash

# This script demonstrates a race condition bug.

counter=0

function increment_counter() {
  local new_counter=$((counter + 1))
  counter=$new_counter
}

# Create two processes to increment the counter concurrently.
increment_counter &
increment_counter &

# Wait for the processes to finish.
wait

# Print the final counter value.  It may not be 2 due to race condition. 
echo "Counter: $counter"