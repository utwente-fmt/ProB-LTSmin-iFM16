MACHINE NQueens
CONSTANTS n,queens
PROPERTIES
 n = 8 &
 queens : 1..n >-> 1..n /* for each column the row in which the queen is in */
 &
 !(q1,q2).(q1:1..n & q2:2..n & q2>q1
    => queens(q1)+q2-q1 /= queens(q2) & queens(q1)-q2+q1 /= queens(q2))

OPERATIONS
  r<--Get(yy) = PRE yy:1..n THEN r:= queens(yy) END
END

