## Dana

### Models

* User
 * name
 * points
 * status (chasing or activating)
* Summit
  * location
  * points
  * last_activated_id
* Contact
  * chaser_id
  * activator_id
  * summit_id
  * frequency / band
  * time

### Classes

* Spot
 * activator
 * summit
 * frequency/band
 * distance

### User Stories

* User can get a list of recent activators (Read)
* User can create a spot (Create)
* User can change their status (Update)
* User can delete their profile and spots (Delete)

#### Stretch Goal

* A summit tracks the user that activated it last
* Test data from reverse beacon network
* Sota API integration (list of activators and summit info)
