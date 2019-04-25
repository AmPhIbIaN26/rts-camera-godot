# rts-camera-godot

This script isn't exactly "plug and play" unless it is in the root node. 

### Present Features
* Movement with 'W','A','S','D'
* Movement with cursor when at the edge of the screen, like some RTS games
* Panning left and right with 'Q' and 'E'
* Tilting up and down with 'R' and 'F'
* Zoom in and out with scroll wheel
* Point and look while pressing middle mouse and dragging
* Majority of the variables are exported to make tweaking, on the go, easy

### To-do/Upcoming features
 * More smooth motions to movement
 * Follow camera



### Setup
![Setup](/scene_tree.png)<br />
Make sure the nodes are arranged as shown above.
* '*move_node*' and '*tilt_node*' are **Position3D** node
* '*camera*' is a **Camera** node
