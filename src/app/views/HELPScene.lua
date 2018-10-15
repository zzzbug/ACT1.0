
local HELPScene = class("HELPScene", cc.load("mvc").ViewBase)


function HELPScene:onCreate()
    local node = cc.CSLoader:createNode("HELP/HELPScene.csb")
       node:addTo(self) 
    local button = node:getChildByName("Button_1")
          button:addTouchEventListener(function(ref, type) 
                if type == ccui.TouchEventType.ended then                  
                  self:onLayer()
                  end          
                  end         ) 
end
function HELPScene:onShareBtnClickEvent(scene)
  release_print("HELP")
  local prolayer = HELPScene:create(scene)
  scene:addChild(prolayer)
end
function HELPScene:onLayer()
release_print("dating")
self:removeFromParent()
end
return HELPScene