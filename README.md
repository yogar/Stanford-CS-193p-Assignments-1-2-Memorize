# Stanford-CS-193p-Memorize

This repository is my work in progress on assignments 1,2,5 «Memorizie» at Stanford University's course CS193p. Lectures are available for everyone at https://cs193p.sites.stanford.edu/

## Assignments 1-2

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

## Assignment 5

- [x] Remove the “random number of cards” theme option from your Memorize game. Each theme will now have its own specific, pre-defined number of cards. In other words, how many cards are in a game is part of the theme for that game and it can no longer be “random”.
- [x] Every time a new game starts, print a JSON representation of the theme being used for that game out to the console. All elements of the theme (its name, the emojis to choose from, how many pairs of cards to show and the color of the theme) must be included.


## Assignment 6
- [x] Your Memorize application should now show a “theme chooser” UI when it launches. See attached images for examples, but you can be creative with how you show each theme.
- [x] Use a List to display the themes.
- [x] Each row in the List shows the name of the theme, the color of the theme, how
many cards in the theme and some sampling of the emoji in the theme.
- [x] Touching on a theme in the List navigates (i.e. the List is in a NavigationView) to playing a game with that theme.
- [х] While playing a game, the name of the theme should be on screen somewhere and you should also continue to support existing functionality like score, new game, etc. (but you may rearrange the UI if you wish).
- [ ] It is okay if going from playing a game back to the chooser and then back to the game in progress restarts the game, though savvy implementations would probably not do that (except when the theme in question is modified (see below) since that would almost certainly want to restart the game).
- [ ]  Provide some UI to add a new theme to the List in your chooser.
- [ ] The chooser must support an Edit Mode where you can delete themes and where you can access some UI (i.e. a button or image in each row) which will bring up a Theme Editor UI for that theme modally (i.e. via sheet or popover).
- [ ] The Theme Editor must use a Form.
- [ ] In the Theme Editor, allow the user to edit the name of the theme, to add emoji to the theme, to remove emoji from the theme and to specify how many cards are in the theme. (It is Extra Credit to be able to edit the color of the theme.)
- [ ] The themes must be persistent (i.e. relaunching your app should not cause all the theme editing you’ve done to be lost).
- [ ] Your UI should work and look nice on both iPhone and iPad.
- [ ] Get your application work on a physical iOS device of your choice.
