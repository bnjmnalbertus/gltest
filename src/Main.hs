module Main where

import Graphics.UI.GLUT

myPoints :: [(GLfloat, GLfloat, GLfloat)]
myPoints = [ (sin (2*pi*k/12), cos (2*pi*k/12), 0) | k <- [1..12] ]

main :: IO ()
main = do
  (_progname, _args) <- getArgsAndInitialize
  _window <- createWindow "Hello World!"
  displayCallback $= display
  reshapeCallback $= Just reshape
  keyboardMouseCallback $= Just keyboardMouse
  mainLoop

