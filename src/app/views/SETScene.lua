
local SETScene = class("SETScene", cc.load("mvc").ViewBase)

function SETScene:onCreate()
    local node = cc.CSLoader:createNode("SET/SETScene.csb")
       node:addTo(self) 
    local node1 = node:getChildByName("Panel_1")
    local button = node1:getChildByName("Button_1")
          button:addTouchEventListener(function(ref, type) 
                if type == ccui.TouchEventType.ended then                  
                  self:onLayer()
                  end          
                  end         ) 
     local CheckBox = node1:getChildByName("CheckBox_1")
         if AudioEngine:isMusicPlaying() == false then
           CheckBox:setSelected(false)
          end
           CheckBox:addTo(node1) 
           CheckBox :addTouchEventListener(function(sender,eventType) 
             if eventType == ccui.CheckBoxEventType.selected then
               AudioEngine:getInstance():pauseMusic()               
            elseif eventType == ccui.CheckBoxEventType.unselected then
              AudioEngine:getInstance():resumeMusic() 
                  end   end      ) 
      local slider = node1:getChildByName("Slider_1")
            slider :addEventListener(function(ref, type) 
                if type == ccui.TouchEventType.ended then    
               AudioEngine:getInstance():setMusicVolume(slider:getPercent() )
                print( slider:getPercent())
                end
                
            end)
end
function SETScene:onShareBtnClickEvent(scene)
  release_print("SET")
  local prolayer = SETScene:create(scene)
  scene:addChild(prolayer)
end
function SETScene:onLayer()
release_print("dating")
self:removeFromParent()
end
return SETScene