# Conway's Game of Life

![game of life example](../images/Gospers_glider_gun.gif)

The Game of life is a zero player game developed in the 70s by John Horton Conway. Check out the [wikipedia article](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) for a full description.
The evolving state of the game is determined by the initial configuration - some configurations become infinitely evolving constellations, others eventually evolve into a stable patterns, whilst others die off completely.
It is commonly used as a tech test as it can be solved in many different ways that clearly show the level of the programmer.

### The Brief

The rules are as follows:

* The game evolves in turns, commonly known as 'ticks'.
* All changes occur at the same time.
* Any live cell with 2 or 3 live neighbours survives until next tick.
* Any live cell with less than 2 live neighbours dies (underpopulation).
* Any live cell with more than 3 live neighbours dies (overpopulation).
* Any dead cell with exactly 3 neighbours becomes a live cell (reproduction).

### My approach

#### Iterating logic

The code is provided with, for example, a 3x3 grid of 1's (live) and 0's (dead):
<table>
  <tr><th>1</th><th>0</th><th>1</th></tr>
  <tr><th>0</th><th>1</th><th>1</th></tr>
  <tr><th>0</th><th>0</th><th>1</th></tr>
</table>

These are stored in an array of arrays with an added a layer of 0's around the grid to allow me to easily iterate over groups of 3x3:
<table>
  <tr><th>0</th><th>0</th><th>0</th><th>0</th><th>0</th></tr>
  <tr><th>0</th><th>1</th><th>0</th><th>1</th><th>0</th></tr>
  <tr><th>0</th><th>0</th><th>1</th><th>1</th><th>0</th></tr>
  <tr><th>0</th><th>0</th><th>0</th><th>1</th><th>0</th></tr>
  <tr><th>0</th><th>0</th><th>0</th><th>0</th><th>0</th></tr>
</table>

```
[[0, 0, 0, 0, 0], [0, 1, 0, 1 ,0], [0, 0, 1, 1, 0], [0, 0, 0, 1, 0], [0, 0, 0, 0, 0]]
```

So, starting with the number at array `index[1][1]`, I can iterate over the original grid, taking each number and it's eight neighbours, and evaluating whether the central number (`index[1][1]`) should live or die, based on the sum of the neighbours. If we were to stick with just the original 3x3 grid, this would have involved different processes for the top, bottom, left and right numbers... all but the central number in a 3x3 grid.

#### Testing

In early testing, I used basic grids and wrote expectations based on what I calculated their results should be. But I realised that my understanding of the rules could have been flawed. This game was created in 1970, so there are many resources dedicated to it. Using some of Conway's original findings, I recreated some small grids with predictable results; a 2x2 grid of live cells should never change ('stable') for example, so I wrote a test to check that the grid did not change after 20 'ticks'. I also found a shape known as a 'glider', which regenerated every 4 ticks, one cell up and left, a test is written to track the progress of this shape across an 8x8 grid over 20 ticks. With these externally validated tests, I can be sure that the game-logic is functioning correctly.
