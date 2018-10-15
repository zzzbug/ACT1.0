
local MainScene = class("MainScene", cc.load("mvc").ViewBase)
local GAMEScene = require("src.app.views.GAMEScene")
local HELPScene = require("src.app.views.HELPScene")
local REGISTERScene = require("src.app.views.REGISTERScene")
local RANKINGSScene = require("src.app.views.RANKINGSScene")
local SETScene = require("src.app.views.SETScene")
print = release_print
function MainScene:onCreate()
    release_print("111111111111111111111")
    local node = cc.CSLoader:createNode("HELLO/HELLOScene.csb")
       node:addTo(self)
    local node1 = node:getChildByName("Panel_1")
    local button = node1:getChildByName("Button_1")
          button:addTouchEventListener(function(ref, type) 
                if type == ccui.TouchEventType.ended then                  
                  self:onGAME()
                  end          
                  end         )
    local button2 = node1:getChildByName("Button_2")
          button2:addTouchEventListener(function(ref, type)                   
                 if type == ccui.TouchEventType.ended then
         	        self:onHELP()
                  end         
                  end         )
     local button3 = node1:getChildByName("Button_3")
           button3:addTouchEventListener(function(ref, type)                   
                 if type == ccui.TouchEventType.ended then
         	        self:onREGISTER()
                  end         
                  end         )
     local button4 = node1:getChildByName("Button_4")
           button4:addTouchEventListener(function(ref, type)                   
                 if type == ccui.TouchEventType.ended then
         	        self:onRANKINGS()
                  end         
                  end         )
     local button5 = node1:getChildByName("Button_5")
           button5:addTouchEventListener(function(ref, type)                   
                 if type == ccui.TouchEventType.ended then
         	        self:onSET()
                  end         
                  end         )

  cc.SimpleAudioEngine:getInstance():playMusic("sound/backgroud01.mp3", true)
  AudioEngine:getInstance():setMusicVolume(0.1)

end
function MainScene:onGAME()
     GAMEScene:onShareBtnClickEvent(self)
end
function MainScene:onHELP()
     HELPScene:onShareBtnClickEvent(self)
end
function MainScene:onREGISTER()
     REGISTERScene:onShareBtnClickEvent(self)
end
function MainScene:onRANKINGS()
     RANKINGSScene:onShareBtnClickEvent(self)
end
function MainScene:onSET()
     SETScene:onShareBtnClickEvent(self)
end

function MainScene:onShareBtnClickEvent(scene)
  release_print("layer")
  local prolayer = MainScene:create(scene)
  scene:addChild(prolayer)
end
return MainScene
