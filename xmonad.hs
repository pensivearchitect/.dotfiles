import XMonad
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.SpawnOn
import XMonad.Config.Gnome
import System.IO

myBorderColor = "#dddddd"
myWorkSpaces = ["1:emacs", "2:firefox", "3:mail", "4:im", "5:stuff", "6:anything"]
myStartupHook :: X ()
myStartupHook = do spawnOn "1:emacs" "emacs"
                   spawnOn "2:firefox" "firefox"

main = do
  xmonad $ defaultConfig
    { terminal = "/usr/bin/gnome-terminal"
    , modMask = mod1Mask
    , workspaces = myWorkSpaces
    , borderWidth = 0
    , layoutHook = spacing 30 $ Tall 1 (3/100) (1/2)
    , startupHook = myStartupHook
    , focusedBorderColor = myBorderColor
    , manageHook = manageDocks <+> manageSpawn <+> manageHook defaultConfig
    } `additionalKeys`
    [ ((mod1Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock") ]
