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

Starting with a 3x3 grid of 1's (live) and 0's (dead):
<table>
<tr><th>1</th><th>0</th><th>1</th></tr>
<tr><th>0</th><th>1</th><th>1</th></tr>
<tr><th>0</th><th>0</th><th>1</th></tr>
</table>

 I added a layer of 0's around the grid to allow me to easily itterate each number in the original grid and it's neighbours:
 <table>
 <tr><th><th>0</th><th>0</th><th>0</th><th>0</th><th>0</th></tr>
 <tr><th>0</th><strong><th>1</th><th>0</th><th>1</th></strong><th>0</th></tr>
 <tr><th>0</th><strong><th>0</th><th>1</th><th>1</th></strong><th>0</th></tr>
 <tr><th>0</th><strong><th>0</th><th>0</th><th>1</th></strong><th>0</th></tr>
 <tr><th><th>0</th><th>0</th><th>0</th><th>0</th><th>0</th></tr>
</table>
