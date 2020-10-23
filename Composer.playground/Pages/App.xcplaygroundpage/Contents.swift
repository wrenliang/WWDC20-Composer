/*:
* * * *
## Table of Contents
- [Homepage](Homepage)
- [Using Samples](Samples)
- [App Demo!](App)

* * * *
# Application Demo
 For the optimal experience, **minimize the side and bottom tabs** in Xcode for more screen space. Needless to say, **Sound is required** for this Playground.
 
 ## Steps
 1. Choose the foundational chords for your piece. These are prebuilt so you do not need to know any of the theory to get going! Just hit listen on some and pick one you like.
 
 2. Then, you can compose the melody that will play on top of the chords. This part is much more open ended, and is up to you to express your creativity.
 
 3. Listen to your creation!
 
 **Note**: You can always go back and change something if you like. Just tap the section again and you will be given a prompt.
 * * * *
*/
import PlaygroundSupport

let AppController = NavigationController(rootViewController: ComposerMenuViewController())
PlaygroundPage.current.liveView = AppController
/*:
 ## Tips!
  - Have some variation in note length (don't exclusively use Quarter notes or Eighth notes, mix them in with each other!)
  - Try to start and end on either the first, fourth, or fifth note (C3, F3, G3)
    - These notes are called the tonic note, subdominant note, and dominant note, respectively
  - Have the courage to experiment! It can be hard to come up with a tune spontaneously, so keep playing around and I'm sure you'll figure something out!
 
 */
