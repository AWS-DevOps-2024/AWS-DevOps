
DEDUPLICATION: It will avoid writing the same data
APPLICATION SIZE: Readable data from a VM (Virtual Machine).

When we configure the backup for any VM, Full backup is always going to be the Initial/First backup.

Example:
---------------
1. Let's say we have VM with four blocks of Data each block contains 1 GB of Data
   Then, total blocks size would be 4 GB

![alt text]({D314FFDD-FB74-4DB4-AE8A-313E7EBBD521}.png)

FULL BACKUP:
---------------
    --> Application size : 4 GB
    --> Data written on the backup disk: 4 GB (A+B+C+D)  
    --> Deduplication Savings: 0%
    --> Baseline Data: A+B+C+D (4GB)
