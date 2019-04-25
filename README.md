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

### Script Description
#### move_node
  It is responsible for movement around the scene and also the panning left and right.
  * area_percent - percentage of screen form the edge which will detect the cursor to move the camera.
  * acc - accelaration of the camera while moving over the scene.
  * dec - de-accelaration of the camera while moving over the scene.
  * MAX_SPEED - maximum speed the camera can attain while moving.
  * ang_acc - acceleration of camera while panning left or right.
  * ang_dec - de-acceleration of camera while panning left or right.
  * MAX_ANG_SPEED - maximum speed the camera can attain while panning left or right.
  * MOUSE_SENSITIVITY - sensitivity of the mouse while pressins the middle mouse button and dragging the camera horizontally
