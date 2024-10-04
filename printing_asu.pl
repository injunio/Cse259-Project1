drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- 
  N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1).

drawHorizontalLine(Symbol, 0) :- nl.
drawHorizontalLine(Symbol, N) :- drawSymbol(Symbol, N).

drawVerticalLinesWithSpace(Symbol, 0, Width).
drawVerticalLinesWithSpace(Symbol, Height, Width) :- 
  Height > 0,
  write(Symbol),
  drawSymbol(' ', Width - 2),
  write(Symbol),
  nl,
  Height1 is Height - 1,
  drawVerticalLinesWithSpace(Symbol, Height1, Width).


/*-------------------------------------------------------------------------------------------------*/
/* draw A */
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  ColumnNumber >= TextWidth.

/* 
 * Covers the left-most and the right-most columns that only have stars 
 */
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (
    (ColumnNumber >= 0, ColumnNumber < FontSize);
    (ColumnNumber >= FontSize * 2, ColumnNumber < TextWidth )
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).


/* 
 * Covers the middle segment
 * Will have either stars or spaces 
 */
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= 0, CurrentLine < FontSize);
    (CurrentLine >= FontSize * 2 , CurrentLine < FontSize * 3)
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).


drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= FontSize, CurrentLine < 2 * FontSize);
    (CurrentLine >= FontSize * 3, CurrentLine < TextHeight)
  ),
  drawSymbol(' ', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).
/* draw A */
/*-------------------------------------------------------------------------------------------------*/


/*-------------------------------------------------------------------------------------------------*/
/* WRITE RULES FOR drawS HERE*/
/*-------------------------------------------------------------------------------------------------*/
/* draw S */

/*
*Rule 1 is our base case. It makes sure we are staying in the correct location for S
*/
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  ColumnNumber >= TextWidth.

/*
*Rule 2 will print out the three horizontal lines of S
*/
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  /*This restricts our column access*/
  (ColumnNumber >= 0, ColumnNumber < TextWidth),
  /*These restrict our row access, and allows the * to be printed in 3 specific locations*/
  (
    (CurrentLine >= 0, CurrentLine < FontSize);
    (CurrentLine >= FontSize*2, CurrentLine < FontSize*3);
    (CurrentLine >= FontSize*4, CurrentLine < TextHeight)
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/*
* Rule 3 prints the single box of * on the 2nd row
*/
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= 0, ColumnNumber < FontSize),
  (CurrentLine >= FontSize, CurrentLine < FontSize*2),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/*
* Rule 4 prints the single box of * on the 4th row
*/
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize*2, ColumnNumber < TextWidth),
  (CurrentLine >= FontSize*3, CurrentLine < FontSize*4),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/*
*Rule 5 prints the Spaces on the 2nd row
*/
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < TextWidth),
  (CurrentLine >= FontSize, CurrentLine < FontSize*2),
  drawSymbol(' ', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/*
*Rule 6 prints the Spaces on the 4th row
*/
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= 0, ColumnNumber < FontSize*2),
  (CurrentLine >= FontSize*3, CurrentLine < FontSize*4),
  drawSymbol(' ', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* draw S */
/*-------------------------------------------------------------------------------------------------*/
/* WRITE RULES FOR drawU HERE*/
/*-------------------------------------------------------------------------------------------------*/
/* draw U */

/* the first rule just checks if ColumnNumber is greater than width of letter U */
drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  ColumnNumber >= TextWidth.

/* the second rule does the left-most and right-most columns*/ 
/* for the U, this is the same as A, where it's just all star symbols for the segments */

drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (
    (ColumnNumber >= 0, ColumnNumber < FontSize);
    (ColumnNumber >= FontSize * 2, ColumnNumber < TextWidth )
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawU(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* 
 * Covers the middle segment
 * Will have either stars or spaces 
 */
 /* the third rule tells where the spaces belong in the middle segment */
 /* for U, this is until the last lines (font size) at the bottom */ 
drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= 0, CurrentLine < FontSize*4);
    (CurrentLine >= FontSize * 2 , CurrentLine < FontSize * 3)
  ),
  drawSymbol(' ', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawU(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* fourth rule tells the stared areas in the middle segment */
/* for U, this is the bottom section */ 
drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= FontSize, CurrentLine < 2 * FontSize);
    (CurrentLine >= FontSize * 3, CurrentLine < TextHeight)
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawU(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

  /* draw U */

  /* draw the text with appropriate spacing*/

draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, CurrentLine, TextWidth, TextHeight) :-
  CurrentLine >= TextHeight.
draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, CurrentLine, TextWidth, TextHeight) :-
  CurrentLine < TextHeight,
  ColumnNumber is 0,
  write('|'), drawSymbol(' ', LeftRightMargin),
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber),
  /*---------------------------------------------*/
  /** CALL YOUR RULES HERE **/
  % add spaces here between A and S
  drawSymbol(' ', SpaceBetweenCharacters),
  ColumnNumber is 0,
  % call drawS
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber),
  % add spaces here between S and U
  drawSymbol(' ', SpaceBetweenCharacters),
  ColumnNumber is 0,
  % call drawU
  drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber),
  /*---------------------------------------------*/
  drawSymbol(' ', LeftRightMargin),
  write('|'),
  nl,
  NextLine is CurrentLine + 1,
  draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, NextLine, TextWidth, TextHeight).



/* this will be initiating the variables and will be called from asu() */
drawVerticalLinesWithCharacters(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :-
  CurrentLine is 0,
  TextWidth is FontSize * 3,
  TextHeight is FontSize * 5,
  draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, CurrentLine, TextWidth, TextHeight).



/* this will be used from the console */
asu(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :-
  /* verify that the variables are integers */
  integer(LeftRightMargin), integer(BottomTopMargin), integer(SpaceBetweenCharacters), integer(FontSize),

  /* calculate the height and width */
  Width is (LeftRightMargin * 2 + SpaceBetweenCharacters * 2 + FontSize * 3 * 3 + 2),
  Height is (BottomTopMargin * 2 + FontSize * 5),

  /* top horizontal line of the box */
  drawHorizontalLine('-', Width),
  nl,

  /* the empty space in the top */
  drawVerticalLinesWithSpace('|', BottomTopMargin, Width),

  /* the actual text */
  drawVerticalLinesWithCharacters(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize),

  /* the empty space in the bottom */
  drawVerticalLinesWithSpace('|', BottomTopMargin, Width),

  /* bottom horizontal line of the box */
  drawHorizontalLine('-', Width).
