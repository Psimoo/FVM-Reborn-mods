package com.aurora.ui.maogoutd.xiaowu
{
   import a_4714.AssetsLoader;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4754.a_2161;
   import com.aurora.protocol.hallserver.CSmallRoomItemVO;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class TDSmallHouseUI extends Sprite
   {
      
      public var smallHouseRenturBtn:SimpleButton;
      
      public var m_EditBtn:SimpleButton;
      
      public var m_PackageBtn:SimpleButton;
      
      public var m_SureBtn:SimpleButton;
      
      public var m_CancelBtn:SimpleButton;
      
      private var a_1660:a_4463;
      
      public var m_PackagePane:SmallUserPackage;
      
      private var m_MoveVectory:Array = new Array();
      
      private var m_stLoader:AssetsLoader;
      
      private var currentCard:MoveItem;
      
      private var m_EidtBool:Boolean = false;
      
      public var m_containerWall:MovieClip;
      
      public var m_containerFloor:MovieClip;
      
      public var mc_backGroundImage:MovieClip;
      
      private var mc_backImage:Bitmap;
      
      private var a_1236:int;
      
      public var role:a_4463;
      
      private var m_BackImageID:uint;
      
      private var deleteItemCache:Array = new Array();
      
      private var isPutting:Boolean = false;
      
      public function TDSmallHouseUI()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStageEvent);
      }
      
      private function onAddedToStageEvent(a_4730:Event) : void
      {
         if(this.mc_backImage == null)
         {
            this.mc_backImage = new Bitmap();
            this.mc_backGroundImage.addChild(this.mc_backImage);
         }
         UtilMoveManager.getinstance().m_stage = stage;
         this.m_CancelBtn.visible = false;
         this.m_SureBtn.visible = false;
         this.m_EditBtn.visible = true;
         this.m_EidtBoolean = false;
         this.m_PackagePane.visible = false;
         this.m_PackagePane.deletedic = new Dictionary();
         while(this.deleteItemCache.length > 0)
         {
            this.deleteItemCache.pop();
         }
         this.role = a_2161.e.GetCurrentRole() as a_4463;
         a_2161.e.RequestGetSmallRoomInfo(this.role.m_iRoleUin);
         this.initEvent();
      }
      
      public function initEvent() : void
      {
         this.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         a_1789.getInstance().addEventListener(EventType.GET_BACK_SMALLROOMINFO,this.onGetRoomInfoHandler);
         a_1789.getInstance().addEventListener(EventType.SAVE_BACK_SMALLROOMINFO,this.onSaveBackHandler);
         a_1789.getInstance().addEventListener(EventType.BUY_BACK_SMALLROOM,this.onBuyBackHandler);
         a_1789.getInstance().addEventListener("ActionPutDown",this.onPutDown);
         a_1789.getInstance().addEventListener("ActionBuy",this.onBuyrequest);
         a_1789.getInstance().addEventListener("ActionCanclePutDown",this.onCanclePutDown);
      }
      
      protected function onCanclePutDown(a_4730:a_1778) : void
      {
         var mc:MoveItem = null;
         var e:a_1778 = a_4730;
         var m_ID:int = int(e.dataObject.m_iID);
         if(e.dataObject.m_parentName == "m_containerWall")
         {
            mc = this.m_containerWall.getChildByName(m_ID.toString()) as MoveItem;
         }
         else if(e.dataObject.m_parentName == "m_containerFloor")
         {
            mc = this.m_containerFloor.getChildByName(m_ID.toString()) as MoveItem;
         }
         if(mc != null)
         {
            this.m_PackagePane.onPutDownBack(mc.m_data.m_iTypeID,mc.m_data.m_iID,false);
            this.deleteItemCache.push(mc);
            mc.parent.removeChild(mc);
         }
      }
      
      protected function onBuyBackHandler(a_4730:a_1778) : void
      {
         var e:a_1778 = a_4730;
         if(e.dataObject.m_nResultID == 0)
         {
            this.m_PackagePane.onBuyBack(e.dataObject.m_Item.m_iTypeID,e.dataObject.m_Item.m_iID);
            this.m_PackagePane.UpdateCharmValue();
         }
         else
         {
            UtilMoveManager.getinstance().showTextTip(UtilMoveManager.getinstance().getStringByResultID(e.dataObject.m_nResultID));
         }
      }
      
      protected function onSaveBackHandler(a_4730:a_1778) : void
      {
         var e:a_1778 = a_4730;
         if(e.dataObject.m_nResultID == 0)
         {
            trace("保存成功！");
         }
         else
         {
            UtilMoveManager.getinstance().showTextTip(UtilMoveManager.getinstance().getStringByResultID(e.dataObject.m_nResultID));
         }
      }
      
      protected function onGetRoomInfoHandler(a_4730:a_1778) : void
      {
         var e:a_1778 = a_4730;
         if(e.dataObject.m_nResultID == 0)
         {
            this.m_MoveVectory = UtilMoveManager.getinstance().TransformationData(e.dataObject.m_arrInfo);
            UtilMoveManager.getinstance().checkDate(this.m_MoveVectory);
            this.initView();
         }
         else
         {
            UtilMoveManager.getinstance().showTextTip(UtilMoveManager.getinstance().getStringByResultID(e.dataObject.m_nResultID));
         }
      }
      
      public function releaseEvent() : void
      {
         this.removeEventListener(MouseEvent.CLICK,this.onClickHandler);
         a_1789.getInstance().removeEventListener("ActionPutDown",this.onPutDown);
         a_1789.getInstance().removeEventListener("ActionBuy",this.onBuyrequest);
         a_1789.getInstance().removeEventListener("ActionCanclePutDown",this.onCanclePutDown);
         a_1789.getInstance().removeEventListener(EventType.GET_BACK_SMALLROOMINFO,this.onGetRoomInfoHandler);
         a_1789.getInstance().removeEventListener(EventType.SAVE_BACK_SMALLROOMINFO,this.onSaveBackHandler);
         a_1789.getInstance().removeEventListener(EventType.BUY_BACK_SMALLROOM,this.onBuyBackHandler);
      }
      
      private function initView() : void
      {
         var item:MoveItem = null;
         var avatar:MoveItemAvatar = null;
         this.m_PackagePane.UpdateCharmValue();
         var dictImage:Dictionary = LoadImageUtill.getinstance().dictSWF;
         for(var i:int = 0; i < this.m_MoveVectory.length; i++)
         {
            if(this.m_MoveVectory[i].m_iID == 15728641)
            {
               avatar = new MoveItemAvatar();
               avatar.m_data = this.m_MoveVectory[i];
               this.a_1660 = a_2161.e.GetCurrentRole() as a_4463;
               this.m_containerFloor.addChild(avatar);
               avatar.a_3898(this.a_1660.m_szRoleName,this.a_1660.m_arrHeroItemID,this.a_1660.m_iUserSex,this.a_1660.SuitShowType);
            }
            else if(this.m_MoveVectory[i].m_iDirection == 1)
            {
               this.addMoveItem(this.m_MoveVectory[i]);
            }
         }
      }
      
      private function addMoveItem(vo:CSmallRoomItemVO) : void
      {
         var item:MoveItem = null;
         var dictImage:Dictionary = null;
         dictImage = LoadImageUtill.getinstance().dictSWF;
         switch(vo.m_iTypeID)
         {
            case 1:
               item = new MoveItem();
               item.x = vo.m_iPositonX;
               item.y = vo.m_iPositonY;
               item.m_data = vo;
               item.m_Dragable = this.m_EidtBoolean;
               item.name = vo.m_iID.toString();
               this.m_containerFloor.addChild(item);
               item.alpha = 0;
               if(dictImage[vo.m_iID] != null)
               {
                  item.setImage((dictImage[vo.m_iID].data as Bitmap).bitmapData);
                  if(this.isPutting)
                  {
                     item.alpha = 0;
                     if(!this.checkPut(item,item.parent as MovieClip))
                     {
                        item.parent.removeChild(item);
                        UtilMoveManager.getinstance().showTextTip("格子已满,不能放入!");
                     }
                     else
                     {
                        item.m_Dragable = this.m_EidtBoolean;
                        this.m_PackagePane.onPutDownBack(item.m_data.m_iTypeID,item.m_data.m_iID);
                     }
                     this.isPutting = false;
                  }
                  else
                  {
                     item.alpha = 1;
                  }
               }
               else
               {
                  LoadImageUtill.getinstance().loadDisplayObject(vo.m_iID,this.onImageLoadComplete);
               }
               break;
            case 2:
               item = new MoveItem();
               item.x = vo.m_iPositonX;
               item.y = vo.m_iPositonY;
               item.m_data = vo;
               item.m_Dragable = this.m_EidtBoolean;
               item.name = vo.m_iID.toString();
               this.m_containerWall.addChild(item);
               item.alpha = 0;
               if(dictImage[vo.m_iID] != null)
               {
                  item.setImage((dictImage[vo.m_iID].data as Bitmap).bitmapData);
                  if(this.isPutting)
                  {
                     item.alpha = 0;
                     if(!this.checkPut(item,item.parent as MovieClip))
                     {
                        item.parent.removeChild(item);
                        UtilMoveManager.getinstance().showTextTip("格子已满,不能放入!");
                     }
                     else
                     {
                        item.m_Dragable = this.m_EidtBoolean;
                        this.m_PackagePane.onPutDownBack(item.m_data.m_iTypeID,item.m_data.m_iID);
                     }
                     this.isPutting = false;
                  }
                  else
                  {
                     item.alpha = 1;
                  }
               }
               else
               {
                  LoadImageUtill.getinstance().loadDisplayObject(vo.m_iID,this.onImageLoadComplete);
               }
               break;
            case 3:
               if(dictImage[vo.m_iID] != null)
               {
                  this.mc_backImage.bitmapData = (dictImage[vo.m_iID].data as Bitmap).bitmapData;
                  this.m_BackImageID = vo.m_iID;
               }
               else
               {
                  LoadImageUtill.getinstance().loadDisplayObject(vo.m_iID,this.onImageLoadComplete);
               }
               break;
            case 4:
               item = new MoveItem();
               item.x = vo.m_iPositonX;
               item.y = vo.m_iPositonY;
               item.m_data = vo;
               item.m_Dragable = this.m_EidtBoolean;
               item.name = vo.m_iID.toString();
               this.m_containerFloor.addChild(item);
               item.alpha = 0;
               if(dictImage[vo.m_iID] != null)
               {
                  item.setMovie(dictImage[vo.m_iID].data.m_Demo as MovieClip);
                  if(this.isPutting)
                  {
                     item.alpha = 0;
                     if(!this.checkPut(item,item.parent as MovieClip))
                     {
                        item.parent.removeChild(item);
                        UtilMoveManager.getinstance().showTextTip("格子已满,不能放入!");
                     }
                     else
                     {
                        item.m_Dragable = this.m_EidtBoolean;
                        this.m_PackagePane.onPutDownBack(item.m_data.m_iTypeID,item.m_data.m_iID);
                     }
                     this.isPutting = false;
                  }
                  else
                  {
                     item.alpha = 1;
                  }
               }
               else
               {
                  LoadImageUtill.getinstance().loadDisplayObject(vo.m_iID,this.onImageLoadComplete);
               }
         }
      }
      
      public function onImageLoadComplete(dict:Dictionary) : void
      {
         var item:MoveItem = null;
         var key:Object = null;
         var dictImage:Dictionary = LoadImageUtill.getinstance().dictSWF;
         for(key in dict)
         {
            dictImage[key] = dict[key];
            if((Number(key) & 0xFFF00000) == 362807296)
            {
               item = this.m_containerFloor.getChildByName(key.toString()) as MoveItem;
               if(item != null && dictImage[key] != null)
               {
                  item.setImage((dictImage[key].data as Bitmap).bitmapData);
               }
            }
            else if((Number(key) & 0xFFF00000) == 363855872)
            {
               item = this.m_containerWall.getChildByName(key.toString()) as MoveItem;
               if(item != null && dictImage[key] != null)
               {
                  item.setImage((dictImage[key].data as Bitmap).bitmapData);
               }
            }
            else if((Number(key) & 0xFFF00000) == 364904448)
            {
               this.mc_backImage.bitmapData = (dictImage[key].data as Bitmap).bitmapData;
               this.m_BackImageID = Number(key);
            }
            else if((Number(key) & 0xFFF00000) == 365953024)
            {
               item = this.m_containerFloor.getChildByName(key.toString()) as MoveItem;
               if(item != null && dictImage[key] != null && dictImage[key].data.m_Demo != null)
               {
                  item.setMovie(dictImage[key].data.m_Demo as MovieClip);
               }
            }
            if(this.isPutting)
            {
               if(item == null)
               {
                  this.m_PackagePane.onPutDownBack(3,int(key));
               }
               else if(!this.checkPut(item,item.parent as MovieClip))
               {
                  item.parent.removeChild(item);
                  UtilMoveManager.getinstance().showTextTip("格子已满,不能放入!");
               }
               else
               {
                  item.m_Dragable = this.m_EidtBoolean;
                  this.m_PackagePane.onPutDownBack(item.m_data.m_iTypeID,item.m_data.m_iID);
               }
               this.isPutting = false;
            }
            else if(item != null)
            {
               item.alpha = 1;
            }
         }
      }
      
      protected function onBuyrequest(a_4730:a_1778) : void
      {
         var data:ItemConfigVO = UtilMoveManager.getinstance().TransformationVO(a_4730.dataObject);
         a_2161.e.RequestBuySmallRoomGoods(this.role.m_iRoleUin,data.m_iItemID,data.m_ItemType);
      }
      
      protected function onPutDown(a_4730:a_1778) : void
      {
         var item:MoveItem = null;
         this.CancleMove();
         this.isPutting = true;
         var data:ItemConfigVO = UtilMoveManager.getinstance().TransformationVO(a_4730.dataObject);
         var dictImage:Dictionary = LoadImageUtill.getinstance().dictSWF;
         var m_data:CSmallRoomItemVO = new CSmallRoomItemVO();
         m_data.m_iID = data.m_iItemID;
         m_data.m_iDirection = 1;
         m_data.m_iTypeID = data.m_ItemType;
         if(m_data.m_iTypeID == 3)
         {
            if(dictImage[m_data.m_iID] != null)
            {
               this.mc_backImage.bitmapData = (dictImage[m_data.m_iID].data as Bitmap).bitmapData;
               this.m_PackagePane.onPutDownBack(data.m_ItemType,data.m_iItemID);
               this.isPutting = false;
            }
            else
            {
               LoadImageUtill.getinstance().loadDisplayObject(m_data.m_iID,this.onImageLoadComplete);
            }
         }
         else
         {
            this.addMoveItem(m_data);
         }
      }
      
      protected function onClickHandler(a_4730:MouseEvent) : void
      {
         switch(a_4730.target)
         {
            case this.smallHouseRenturBtn:
               this.SaveInfoHandler();
               while(this.m_containerFloor != null && this.m_containerFloor.numChildren > 0)
               {
                  this.m_containerFloor.removeChildAt(0);
               }
               while(this.m_containerWall != null && this.m_containerWall.numChildren > 0)
               {
                  this.m_containerWall.removeChildAt(0);
               }
               this.releaseEvent();
               this.m_PackagePane.visible = false;
               break;
            case this.m_PackagePane.closePackageBtn:
               this.m_PackagePane.visible = false;
               break;
            case this.m_PackageBtn:
               this.CancleMove();
               this.m_PackagePane.visible = true;
               break;
            case this.m_SureBtn:
               this.m_CancelBtn.visible = false;
               this.m_SureBtn.visible = false;
               this.m_EditBtn.visible = true;
               this.m_EidtBoolean = false;
               while(this.deleteItemCache.length > 0)
               {
                  this.deleteItemCache.pop();
               }
               this.CancleMove();
               this.SaveInfoHandler();
               break;
            case this.m_EditBtn:
               this.m_CancelBtn.visible = true;
               this.m_SureBtn.visible = true;
               this.m_EditBtn.visible = false;
               this.m_EidtBoolean = true;
               while(this.deleteItemCache.length > 0)
               {
                  this.deleteItemCache.pop();
               }
               break;
            case this.m_CancelBtn:
               this.m_CancelBtn.visible = false;
               this.m_SureBtn.visible = false;
               this.m_EditBtn.visible = true;
               this.m_EidtBoolean = false;
               this.CancleMove();
               this.CancleHandler();
         }
      }
      
      private function checkPut(mc:MoveItem, container:MovieClip) : Boolean
      {
         var j:int = 0;
         var temxX0:int = 0;
         var temxY0:int = 0;
         var temxX1:int = 952;
         var temxY1:int = 212;
         if(container.name == "m_containerWall")
         {
            temxX1 = 952;
            temxY1 = 342;
         }
         temxX0 -= mc.m_RectMask.x;
         temxY0 -= mc.m_RectMask.y;
         temxX1 -= mc.m_RectMask.width;
         temxY1 -= mc.m_RectMask.height;
         if(mc.m_data.m_iID == 364052481)
         {
            temxY1 += 30;
         }
         loop0:
         for(var i:int = temxX0; i < temxX1; )
         {
            j = temxY0;
            while(true)
            {
               if(j >= temxY1)
               {
                  i++;
                  continue loop0;
               }
               mc.x = i;
               mc.y = j;
               if(!this.hitTest(mc))
               {
                  break;
               }
               j++;
            }
            mc.alpha = 1;
            mc.m_data.m_iPositonX = mc.x;
            mc.tempX = mc.x;
            mc.m_data.m_iPositonY = mc.y;
            mc.tempY = mc.y;
            return true;
         }
         return false;
      }
      
      private function hitTest(defCard:*) : Boolean
      {
         var item:* = null;
         for(var i:int = 0; i < defCard.parent.numChildren; i++)
         {
            item = defCard.parent.getChildAt(i);
            if(defCard != null && defCard != item && Boolean(defCard.hitTestObject(item)))
            {
               return true;
            }
         }
         return false;
      }
      
      public function get m_EidtBoolean() : Boolean
      {
         return this.m_EidtBool;
      }
      
      public function set m_EidtBoolean(value:Boolean) : void
      {
         var item:MoveItem = null;
         this.m_EidtBool = value;
         for(var i:int = 0; i < this.m_containerFloor.numChildren; i++)
         {
            item = this.m_containerFloor.getChildAt(i) as MoveItem;
            if(item != null)
            {
               item.m_Dragable = this.m_EidtBool;
            }
         }
         for(var j:int = 0; j < this.m_containerWall.numChildren; j++)
         {
            item = this.m_containerWall.getChildAt(j) as MoveItem;
            if(item != null)
            {
               item.m_Dragable = this.m_EidtBool;
            }
         }
      }
      
      public function GetSmallRoomCardTip() : Sprite
      {
         return new SmallRoomCardTip();
      }
      
      private function SaveInfoHandler() : void
      {
         var item:MoveItem = null;
         var k:* = undefined;
         var saveArray:Array = new Array();
         for(var i:int = 0; i < this.m_containerFloor.numChildren; i++)
         {
            item = this.m_containerFloor.getChildAt(i) as MoveItem;
            if(item != null)
            {
               item.SurePositon();
               saveArray.push(item.m_data);
            }
         }
         for(var j:int = 0; j < this.m_containerWall.numChildren; j++)
         {
            item = this.m_containerWall.getChildAt(j) as MoveItem;
            if(item != null)
            {
               item.SurePositon();
               saveArray.push(item.m_data);
            }
         }
         var backVo:CSmallRoomItemVO = new CSmallRoomItemVO();
         backVo.m_iID = this.m_BackImageID;
         backVo.m_iTypeID = 3;
         backVo.m_iDirection = 1;
         saveArray.push(backVo);
         for each(k in this.m_PackagePane.deletedic)
         {
            saveArray.push(k);
         }
         a_2161.e.RequestSaveSmallRoomInfo(this.role.m_iRoleUin,saveArray);
      }
      
      private function CancleHandler() : void
      {
         var item:MoveItem = null;
         for(var k:int = 0; k < this.deleteItemCache.length; k++)
         {
            item = this.deleteItemCache[k] as MoveItem;
            if(item.m_data.m_iTypeID == 2)
            {
               this.m_containerWall.addChild(item);
            }
            else
            {
               this.m_containerFloor.addChild(item);
            }
            this.m_PackagePane.onPutDownBack(item.m_data.m_iTypeID,item.m_data.m_iID);
         }
         for(var i:int = 0; i < this.m_containerFloor.numChildren; i++)
         {
            item = this.m_containerFloor.getChildAt(i) as MoveItem;
            if(item != null)
            {
               item.CancelPositon();
            }
         }
         for(var j:int = 0; j < this.m_containerWall.numChildren; j++)
         {
            item = this.m_containerWall.getChildAt(j) as MoveItem;
            if(item != null)
            {
               item.CancelPositon();
            }
         }
      }
      
      private function CancleMove() : void
      {
         var item:MoveItem = null;
         for(var i:int = 0; i < this.m_containerFloor.numChildren; i++)
         {
            item = this.m_containerFloor.getChildAt(i) as MoveItem;
            if(item != null)
            {
               item.onMouseUp(null);
            }
         }
         for(var j:int = 0; j < this.m_containerWall.numChildren; j++)
         {
            item = this.m_containerWall.getChildAt(j) as MoveItem;
            if(item != null)
            {
               item.onMouseUp(null);
            }
         }
      }
   }
}

