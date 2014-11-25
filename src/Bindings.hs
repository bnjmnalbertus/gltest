module Bindings (display, reshape, keyboardMouse) where

import Graphics.UI.GLUT
import Display

reshape :: ReshapeCallback
reshape s@(Size w h) = do
  viewport $= (Position 0 0, s)
  postRedisplay Nothing

keyboardMouse :: KeyboardMouseCallback
keyboardMouse _key _state _modifiers _position = return ()
