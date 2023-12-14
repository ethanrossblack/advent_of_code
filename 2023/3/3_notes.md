   | 0|1|2|3|4|5|6|7|8|9
   |----------------------
 0 | 4 6 7 . . 1 1 4 . .
 1 | . . . * . . . . . .
 2 | . . 3 5 . . 6 3 3 .
 3 | . . . . . . # . . .
 4 | 6 1 7 * . . . . . .
 5 | . . . . . + . 5 8 .
 6 | . . 5 9 2 . . . . .
 7 | . . . . . . 7 5 5 .
 8 | . . . $ . * . . . .
 9 | . 6 6 4 . 5 9 8 . .

Valid if 
- a symbol is adjacent to a number

Approaches
- Find all the symbols, check if they have a number adjacent to them.
- Check each number, see if there is a symbol adjacent to it

A symbol is any non-integer or `.` character



Coordinates: grid[a][b..c]
- `a` = line, the `y` coordinate, if you will
- `b` = index of where the number starts
- `c` = index of where the number ends

### Sides 
- `grid[a][b - 1]` (if b > 0)
- `grid[a][c + 1]` (if c < line.size)

### Above/Diagonal
If `a > 0`...
- `grid[a - 1][(b - 1)..(c + 1)]`
  - if `b == 0`, then `grid[a - 1][b..(c + 1)]`
  - if `c - 1 == grid[a].size`, then `grid[a - 1][(b - 1)..c]`

### Below/Diagonal
If `a + 1 < grid.size`...
- `grid[a + 1][(b - 1)..(c + 1)]`
  - if `b == 0`, then `grid[a + 1][b..(c + 1)]`
  - if `c - 1 == grid[a].size`, then `grid[a + 1][(b - 1)..c]`




FOR EXAMPLE, 775

Coordinates: grid[7][6..8]
Possible spaces for a character
- Sides: grid[7][5] OR grid[7][9]
- Above/Diagonal: grid[6][5..9]
- Below/Diagonal: grid[8][5..9]
grid[8][5] is a `*`, so this is a valid number


