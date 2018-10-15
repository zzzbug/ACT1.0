
local RANKINGSScene = class("RANKINGSScene", cc.load("mvc").ViewBase)


function RANKINGSScene:onCreate()
    local node = cc.CSLoader:createNode("RANKINGS/RANKINGSScene.csb")
       node:addTo(self) 
    local node1 = node:getChildByName("Panel_1")
    local button = node1:getChildByName("Button_1")
          button:addTouchEventListener(function(ref, type) 
                if type == ccui.TouchEventType.ended then                  
                  self:onLayer()
                  end          
                    end ) 
      self.listView =node1:getChildByName("ListView_1")
      self.listView:setScrollBarEnabled(false)
      self.listView:addTo(node1)
      nametable={"小明","小红","小亮","小车","小草"} 
      resulttable={1,2,3,4,5}
     for i = 1, 5 do  
        local layout = ccui.Layout:create();
            layout:setContentSize(cc.size(400, 50));	
            layout:setBackGroundColorType(ccui.LayoutBackGroundColorType.solid);
            layout:setBackGroundColor(cc.c3b(255, 255, 255));
        local text = ccui.Text:create()
            text:move(50,20)
            text:setFontSize(20)
            text:setFontName("fonts/round_body.ttf")
            text:setColor(cc.c3b(255,0,0))
            text:setString("昵称:"..nametable[i])
            text:addTo(layout) 
        local text1 = ccui.Text:create()
            text1:move(300,20)
            text1:setFontSize(20)
            text1:setFontName("fonts/round_body.ttf")
            text1:setColor(cc.c3b(255,0,0))
            text1:setString("成绩:"..resulttable[i])
            text1:addTo(layout) 
       self.listView:pushBackCustomItem(layout);  
    end  
end
function RANKINGSScene:onShareBtnClickEvent(scene)
  release_print("RANKINGS")
  local prolayer = RANKINGSScene:create(scene)
  scene:addChild(prolayer)
end
function RANKINGSScene:onLayer()
release_print("dating")
self:removeFromParent()
end
return RANKINGSScene