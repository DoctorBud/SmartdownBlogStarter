---
title: Dungeon Game Starter Title
smartdown: true
---

##### Beginnings of a Dungeon Game

[Character Name](:?N)

```p5js/playable

var spriteX;
var spriteY;
var statusHeight = 30;
var controlHeight = 50;
var trapezoidWidth = 100;
var trapezoidHeight = 200;
var upButton, downButton, leftButton, rightButton, spaceButton;

p5.setup = function () {
  p5.createCanvas(100, 100);
  p5.textSize(20);
  p5.textFont('Helvetica');
  p5.strokeWeight(2);

  function makeButton(label, right, bottom, keyCode) {
    var result = p5.createButton(label);
    result.class('btn-mobile-button');
    result.style('right', right + 'px');
    result.style('bottom', bottom + 'px');
    result.size(25, 25);
    result.mouseClicked(function() {
      p5.handleKey(keyCode);
    });
    return result;
  }

  upButton = makeButton('&uparrow;', 40, 65, p5.UP_ARROW);
  downButton = makeButton('&downarrow;', 40, 5, p5.DOWN_ARROW);
  leftButton = makeButton('&leftarrow;', 70, 35, p5.LEFT_ARROW);
  rightButton = makeButton('&rightarrow;', 10, 35, p5.RIGHT_ARROW);
  spaceButton = makeButton('&infin;', 40, 35, 32);

  p5.windowResized();
};

p5.windowResized = function() {
  p5.resizeCanvas(p5.windowWidth - 40, 400);

  if (!spriteX) {
    spriteX = p5.width / 2;
  }
  if (!spriteY) {
    spriteY = p5.height / 2;
  }
  if (spriteX > p5.width) {
    spriteX = p5.width;
  }
  if (spriteY > p5.height) {
    spriteY = p5.height;
  }
};

p5.handleKey = function(key) {
  var delta = 5;
  if (key === p5.LEFT_ARROW) {
    spriteX -= delta;
    if (spriteX < 0) {
      spriteX = 0;
    }
  }
  else if (key === p5.RIGHT_ARROW) {
    spriteX += delta;
    if (spriteX > p5.width) {
      spriteX = p5.width;
    }
  }
  else if (key === p5.UP_ARROW) {
    spriteY -= delta;
    if (spriteY < 0) {
      spriteY = 0;
    }
  }
  else if (key === p5.DOWN_ARROW) {
    spriteY += delta;
    if (spriteY > p5.height) {
      spriteY = p5.height;
    }
  }
  else if (key === 32) {
    spriteX = p5.width / 2;
    spriteY = p5.height / 2;
  }
};

p5.keyPressed = function(e) {
  var validKeys = [
    p5.LEFT_ARROW,
    p5.RIGHT_ARROW,
    p5.UP_ARROW,
    p5.DOWN_ARROW,
    32
  ];

  if (validKeys.indexOf(p5.keyCode) < 0) {
    return true;
  }
  else {
    p5.handleKey(p5.keyCode);
  }
};

p5.draw = function () {
  // if (p5.keyIsPressed) {
  //   p5.keyPressed();
  // }

  p5.background('lightgray');

  var forwardViewWidth = p5.width;
  var forwardViewHeight = p5.height - statusHeight;
  var forwardViewX = 0;
  var forwardViewY = statusHeight;
  var trapezoidX = forwardViewX + forwardViewWidth / 2 - trapezoidWidth / 2;
  var trapezoidY = forwardViewY + forwardViewHeight / 2 - trapezoidHeight / 2;
  p5.fill('lightblue');
  p5.stroke('darkslateblue');
  p5.rect(trapezoidX, trapezoidY, trapezoidWidth, trapezoidHeight);
  p5.fill('lightyellow');
  p5.quad(
    forwardViewX, forwardViewY,
    trapezoidX, trapezoidY,
    trapezoidX, trapezoidY + trapezoidHeight,
    forwardViewX, forwardViewY + forwardViewHeight);
  p5.quad(
    forwardViewX + forwardViewWidth, forwardViewY,
    forwardViewX + trapezoidX + trapezoidWidth, trapezoidY,
    forwardViewX + trapezoidX + trapezoidWidth, trapezoidY + trapezoidHeight,
    forwardViewX + forwardViewWidth, forwardViewY + forwardViewHeight);
  p5.fill('black');
  p5.stroke('black');
  var yDelta = 25;  // FIXME - Trigonometry needed here
  p5.rect(forwardViewX + forwardViewWidth / 6, forwardViewY + yDelta,
          1, forwardViewHeight - 2 * yDelta);
  p5.rect(forwardViewX + 5 * forwardViewWidth / 6, forwardViewY + yDelta,
          1, forwardViewHeight - 2 * yDelta);

  p5.fill('red');
  p5.stroke('darkslateblue');
  p5.ellipse(spriteX, spriteY, 10, 10);

  p5.fill('black');
  p5.rect(0, 0, p5.width, statusHeight);
  var name = env.N || 'Dungeoneer';
  p5.fill('lightgreen');
  p5.stroke('lightgreen');
  p5.text(name, 5, 0.75 * statusHeight);
};

```
