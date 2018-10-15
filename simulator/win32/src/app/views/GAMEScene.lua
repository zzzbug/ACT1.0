
local GAMEScene = class("GAMEScene", cc.load("mvc").ViewBase)

function GAMEScene:onCreate()
    local node = cc.CSLoader:createNode("GAME/GAMEScene.csb")
       node:addTo(self)
    local node1 = node:getChildByName("Panel_1")
    local node2 = node:getChildByName("Panel_2")
    local node3 = node:getChildByName("Panel_3")
    local node4 = cc.CSLoader:createNode("TIPS/Skeleton.csb")
          node4:setVisible(false)
          node4:setPosition(500,300)
          node4:addTo(node)
    self.name = node2:getChildByName("Text_1")
    local Text_2 = node4:getChildByName("Text_2")
    if szAccoun ~= nil then
    self.name:setString("账号:"..szAccoun)
    else
    self.name:setString("账号:游客")
    end
   self.LoadingBar = node2:getChildByName("LoadingBar_1")
   self.LoadingBar1 = node3:getChildByName("LoadingBar_1")
       -- LoadingBar:setPercent(sum)
      local sum = 100
    local button = node1:getChildByName("Button_1")
          button:addTouchEventListener(function(ref, type) 
                if type == ccui.TouchEventType.ended then                  
                  self:onLayer()
                  end          
                  end         )
    local button2 = node2:getChildByName("Button_4")
          button2:addTouchEventListener(function(ref, type) 
                if type == ccui.TouchEventType.ended then
                num = math.random(1, 10)
                sum = sum - num  
                print(num)
                self.LoadingBar1:setPercent(sum) 
                if num >=5 then
                node4:setVisible(true)
                Text_2:setString("人品爆发触发技能:雷霆万钧(伤害+5)")
                end
                if  sum <= 0 then
                node4:setVisible(true)
                print("敌人以死亡")
                end                
                  end         
                  end         )
     local button3 = node2:getChildByName("Button_5")
           button3:addTouchEventListener(function(ref, type) 
                if type == ccui.TouchEventType.ended then
                num = math.random(1, 10)
                if num >=5 then
                node4:setVisible(true)
                Text_2:setString("人品爆发触发技能:金钟罩(伤害-5)")
                end
                end      
                  end         )
     local button4 = node3:getChildByName("Button_2")
           button4:addTouchEventListener(function(ref, type)  
                if type == ccui.TouchEventType.ended then
                num = math.random(1, 10)
                sum = sum - num  
                self.LoadingBar:setPercent(sum) 
                if  sum <= 0 then
                node4:setVisible(true)
                Text_2:setString("失败再接再励")
                 print("敌人以死亡")
                end  
                end              
                  end)
    local button5 = node3:getChildByName("Button_3")
          button5:addTouchEventListener(function(ref, type) 
                if type == ccui.TouchEventType.ended then                  
                 num = math.random(1, 10)
                 if num >=5 then
                 node4:setVisible(true)
                 Text_2:setString("青山不改绿水长流(告辞)")
                 end
                  end          
                  end         )

end
function GAMEScene:onLayer()
release_print("dating")
self:removeFromParent()
end

function GAMEScene:onShareBtnClickEvent(scene)
  release_print("GAME")
  local prolayer = GAMEScene:create(scene)
  scene:addChild(prolayer)
end
return GAMEScene
