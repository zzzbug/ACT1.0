
local REGISTERScene = class("REGISTERScene", cc.load("mvc").ViewBase)
local GAMEScene = require("src.app.views.GAMEScene")

function REGISTERScene:onCreate()
    local node = cc.CSLoader:createNode("REGISTER/REGISTERScene.csb")
       node:addTo(self) 
      self.edit_new = ccui.EditBox:create(cc.size(400,60), "")
		:move(600,400)
        :setAnchorPoint(0.5,0.5)
		:setFontName("fonts/round_body.ttf")
		:setPlaceholderFontName("fonts/round_body.ttf")
		:setFontSize(25)
		:setPlaceholderFontSize(25)
		:setMaxLength(10)
       -- :setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
		:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
		:setPlaceHolder("请输入账号")
        :addTo(node)   
      self.edit_password = ccui.EditBox:create(cc.size(400,60), "")
		:move(600,300)
        :setAnchorPoint(0.5,0.5)
		:setFontName("fonts/round_body.ttf")
		:setPlaceholderFontName("fonts/round_body.ttf")
		:setFontSize(25)
		:setPlaceholderFontSize(25)
		:setMaxLength(10)
        :setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
		:setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
		:setPlaceHolder("请输入密码")
        :addTo(node)  
    local node1 =  node:getChildByName("Panel_1") 
    local button = node1:getChildByName("Button_1")
    self.Text_2 = node1:getChildByName("Text_2")
          button:addTouchEventListener(function(ref, type) 
                if type == ccui.TouchEventType.ended then                  
                  self:onLayer()
                  end          
                  end         ) 
      local button1 = node1:getChildByName("Button_2")
            button1:addTouchEventListener(function(ref, type) 
                if type == ccui.TouchEventType.ended then                  
                  self:onSure()
                  end          
                  end         ) 
end
function REGISTERScene:onShareBtnClickEvent(scene)
  release_print("REGISTER")
  local prolayer = REGISTERScene:create(scene)
  scene:addChild(prolayer)
end
function REGISTERScene:onSure()
 szAccoun = self.edit_new:getText()
local szPass = self.edit_password:getText()
if #szAccoun < 1 then
self.Text_2:setString("账号不能为0")
return
end
if #szPass < 1 then
self.Text_2:setString("密码不能为0")
return
end
if #szPass == #szAccoun then
self.Text_2:setString("账号密码不能相同")
return
end
self:onGAME()
end
function REGISTERScene:onLayer()
release_print("dating")
self:removeFromParent()
end

function REGISTERScene:onGAME()
     GAMEScene:onShareBtnClickEvent(self)
end
return REGISTERScene