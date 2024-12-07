# Race Condition Bug in Shell Script

This repository demonstrates a race condition bug in a simple bash script.

## Description
The script uses two concurrent processes to increment a shared counter. Due to the lack of proper synchronization, the final counter value may not be the expected value (2 in this case) because the processes are accessing and modifying the shared resource simultaneously.

## How to Reproduce
1. Clone this repository.
2. Run the `bug.sh` script.
3. Observe that the final counter value is not always 2.

## Solution
The provided solution (`bugSolution.sh`) utilizes a lock mechanism to prevent this race condition.