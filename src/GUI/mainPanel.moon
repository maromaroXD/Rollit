loader = assert require 'src/DataLoaders'
main = {}

main.create = (loveF, centerArea) ->
  main = loveF.Create "panel"
  width = Graphics.getWidth!
  height = Graphics.getHeight!
  with main
    \SetPos 0, 35
    \SetSize width, height - 35


  -- Prompt
  promptForm = loveF.Create "form", main
  promptFormX =  centerArea[1] + 10 + 230
  promptFormY =  centerArea[2]
  promptFormW =  550
  promptFormH =  390
  with promptForm
    \SetName "Log"
    \SetSize promptFormW, promptFormH
    \SetPos promptFormX, promptFormY
    \SetLayoutType "vertical"
  logClist = loveF.Create "columnlist", main
  with logClist
    \SetPos promptFormX, promptFormY
    \SetSize promptFormW, promptFormH
    \SetDefaultColumnWidth promptFormW
    \AddColumn "Logs"
    \AddColumn "Result"
    \SetColumnWidth 1, 448
    \SetColumnWidth 2, 100
    \AddRow "Rolled 1 D20 +cha(0) ", "17"
    \AddRow "Rolled 1 D12 +cha(0) ", "5"
    \SetAllRowsFont Graphics.newFont(15)



  -- Character
  characterForm = loveF.Create "form", main
  with characterForm
    \SetName "Character"
    \SetSize 225, 50
    \SetPos centerArea[1] + 10, centerArea[2]
    \SetLayoutType "horizontal"
  characterChoices = loveF.Create "multichoice", main
  with characterChoices
    \SetPos centerArea[1] + 65, centerArea[2] + 15
    \SetSize 165, 30
    \SetChoice "Choose a character"
  addCharBtn = loveF.Create "imagebutton", main
  with addCharBtn
    \SetText ""
    \SetImage "res/add.png"
    \SetSize 45, 30
    \SetPos centerArea[1] + 15, centerArea[2] + 15
  loader.loadMultichoice characterChoices, Data.characters





  -- Die Type
  dieForm = loveF.Create "form", main
  with dieForm
    \SetName "Die Type"
    \SetSize 225, 50
    \SetPos centerArea[1] + 10, centerArea[2] + 60
    \SetLayoutType "horizontal"
  dieType = loveF.Create "multichoice", main
  with dieType
    \SetPos centerArea[1] + 65, centerArea[2] + 75
    \SetSize 165, 30
    \SetChoice "Choose a die"
  dieImage = loveF.Create "image", main
  with dieImage
    \SetImage "res/default.png"
    \SetPos centerArea[1] + 15, centerArea[2] + 75
    \SetSize 45, 30
  loader.loadMultichoice dieType, Data.dieTypes


  -- Number of Dices
  dieFromN = loveF.Create "form", main
  with dieFromN
    \SetName "Number of Dices"
    \SetSize 225, 50
    \SetPos centerArea[1] + 10, centerArea[2] + 120
    \SetLayoutType "horizontal"
  numberbox = loveF.Create "numberbox", main
  with numberbox
    \SetPos centerArea[1] + 15, centerArea[2] + 135
    \SetSize 215, 30
    \SetMin 0
    \SetMax 1000
    .canmodify = true



  -- Attributes
  dieForm = loveF.Create "form", main
  with dieForm
    \SetName "Attributes"
    \SetSize 225, 100
    \SetPos centerArea[1] + 10, centerArea[2] + 180
    \SetLayoutType "horizontal"
  attribPrim = loveF.Create "multichoice", main
  with attribPrim
    \SetPos centerArea[1] + 70, centerArea[2] + 200
    \SetSize 160, 30
    \SetChoice "Select an attribute"
  loader.loadMultichoice attribPrim, Data.attribsPrim
  modifP = loveF.Create "numberbox", main
  with modifP
    \SetSize 45, 30
    \SetPos centerArea[1] + 15, centerArea[2] + 200


  attribSec = loveF.Create "multichoice", main
  with attribSec
    \SetPos centerArea[1] + 70, centerArea[2] + 240
    \SetSize 160, 30
    \SetChoice "Select an attribute"
  loader.loadMultichoice attribSec, Data.attribsSec
  modifS = loveF.Create "numberbox", main
  with modifS
    \SetSize 45, 30
    \SetPos centerArea[1] + 15, centerArea[2] + 240


  -- Modifier
  dieForm = loveF.Create "form", main
  with dieForm
    \SetName "Modifier"
    \SetSize 225, 50
    \SetPos centerArea[1] + 10, centerArea[2] + 290
    \SetLayoutType "horizontal"
  numberboxModi = loveF.Create "numberbox", main
  with numberboxModi
    \SetPos centerArea[1] + 15, centerArea[2] + 305
    \SetSize 215, 30
    .canmodify = true

  -- Settings
  settingsBtn = loveF.Create "imagebutton", main
  with settingsBtn
    \SetImage "res/settings.png"
    \SetSize 45, 30
    \SetPos centerArea[1] + 10, centerArea[2] + 360
    \SizeToImage!
    \SetText ""

  rollBtn = loveF.Create "button", main
  with rollBtn
    \SetText "Roll"
    \SetSize 175, 30
    \SetPos centerArea[1] + 60, centerArea[2] + 360




main
