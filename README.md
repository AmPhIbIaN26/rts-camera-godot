# rts-camera-godot

This script isn't exactly "plug and play",unless it is in the root node. Since it's my first time making anything in any kind on game engine, if you have any suggestions here is my [twitter](https://twitter.com/AmPhIbIaN26). Feel free to use or contribute to the code any how you want, just mention my attribution that's it. 

### Present Features
* Movement with 'W','A','S','D'.
* Movement with cursor when at the edge of the screen, like some RTS games.
* Panning left and right with 'Q' and 'E'.
* Tilting up and down with 'R' and 'F'.
* Zoom in and out with scroll wheel.
* Point and look while pressing middle mouse and dragging.
* Majority of the variables are exported to make tweaking, on the go, easy.

### To-do/Upcoming features
 * Make movement smoother.
 * Add follow camera.
 * Add de-accelaration to tilting in tilt_node.
 * Make zooming smooth
 
 
### Setup
![Setup](/Screenshots/scene_tree.png)<br />
Make sure the nodes are arranged as shown above.
* '*move_node*' and '*tilt_node*' are **Position3D** node
* '*camera*' is a **Camera** node

### Script Description
#### move_node
  It is responsible for movement around the scene and also the panning left and right.<br />
  * area_percent - the percentage of the screen form the edge which will detect the cursor to move the camera.
  * acc - acceleration of the camera while moving over the scene.
  * dec - de-acceleration of the camera while moving over the scene.
  * MAX_SPEED - maximum speed the camera can attain while moving.
  * ang_acc - acceleration of camera while panning left or right.
  * ang_dec - de-acceleration of the camera while panning left or right.
  * MAX_ANG_SPEED - maximum speed the camera can attain while panning left or right.
  * MOUSE_SENSITIVITY - sensitivity of the mouse while pressing the middle mouse button and dragging the camera horizontally.
  <br /><br />
#### tilt_node
  It is responsible for tilting the camera up or down.<br />
  * ang_acc - acceleration of camera while tilting up or down.
  * MAX_ANG_SPEED - maximum speed the camera can attain while tilting up or down.
  * low - how low the camera can go while tilting(in terms of radian).
  * high - how high the camera can go while tilting(in terms of radian).
  * MOUSE_SENSITIVITY - sensitivity of the mouse while pressing the middle mouse button and dragging the camera vertically.
  <br /><br />
#### camera
  It is responsible for zooming in and out.
  * zoom_factor - the amount of zoom in each tick of the scroll wheel.
  * max_zoom - limit of zooming out.
  * min_zoom - limit of zooming in.
 
  ### Acknowledgement
   I would really like to thank the people [godot discord server](https://discordapp.com/invite/zH7NUgz) who really helped me to clear      my doubts and teach me new and alternative methods to approach any problem.
   And special thanks to these people from the [discord server](https://discordapp.com/invite/zH7NUgz) who really help me a lot
   * **TheDuriel**
   * **TakedownBIG** [twitter](https://twitter.com/CantaloupeStud1)
   * **kidscancode**
   * **WingedAdventurer**
   * **DagobertDick**
   * **Nwallen**
   * **kubecz3k**
