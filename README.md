# Stanford-CS-193p-Assignments-1-2-Memorize

This repository is my work in progress on assignments 1-2 «Memorizie» at Stanford University's course CS193p. Lectures are available for everyone at https://cs193p.sites.stanford.edu/
 
- [x] Currently the cards appear in a predictable order (the matches are always side-by-side, making the game very easy). Shuffle the cards.
- [x] Our cards are currently arranged in a single row (we’ll fix that next week). That’s making our cards really tall and skinny (especially in portrait) which doesn’t look very good. Force each card to have a width to height ratio of 2:3 (this will result in empty space above and/or below your cards, which is fine).
- [x] Have your game start up with a random number of pairs of cards between 2 pairs and 5 pairs.
- [x] Your game should still shuffle the cards.
- [x] Architect the concept of a “theme” into your game. A theme consists of a name for the theme, a set of emoji to use, a number of cards to show (which, for at least one, but not all themes, should be random), and an appropriate color to use to draw (e.g. orange would be appropriate for a Halloween theme).
- [x] Support at least 6 different themes in your game.
- [x] A new theme should be able to be added to your game with a single line of code.
- [x] Add a “New Game” button to your UI which begins a brand new game. This new game should have a randomly chosen theme. You can put this button anywhere you think looks best in your UI.
- [ ] Show the theme’s name somewhere in your UI.
- [x] Keep score in your game by giving 2 points for every match and penalizing 1 point for every previously seen card that is involved in a mismatch.
- [x] Display the score in your UI in whatever way you think looks best.
- [x] Your UI should work in portrait or landscape on any iOS device. The cards can have any aspect ratio you’d like. This probably will not require any work on your part (that’s part of the power of SwiftUI), but be sure to continue to experiment with running on different simulators in Xcode to be sure.
