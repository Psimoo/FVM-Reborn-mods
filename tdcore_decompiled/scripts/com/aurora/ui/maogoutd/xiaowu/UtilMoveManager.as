package com.aurora.ui.maogoutd.xiaowu
{
   import a_4754.a_2155;
   import com.aurora.protocol.hallserver.CSmallRoomItemVO;
   import com.aurora.ui.maogoutd.iface.ITDMessageTip;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class UtilMoveManager extends Sprite
   {
      
      private static var instance:UtilMoveManager;
      
      public var m_stage:*;
      
      public function UtilMoveManager()
      {
         super();
      }
      
      public static function getinstance() : UtilMoveManager
      {
         if(!instance)
         {
            instance = new UtilMoveManager();
         }
         return instance;
      }
      
      public function showTextTip(msg:String) : void
      {
         var tempMsg:String = null;
         if(!msg)
         {
            return;
         }
         var textTip:ITDMessageTip = a_2155.e.GetMessageTip() as ITDMessageTip;
         if(msg.length > 12)
         {
            tempMsg = msg;
            msg = tempMsg.substr(0,12) + "<br>" + tempMsg.substr(12);
         }
         textTip.showTextTip(this.m_stage,msg,new Rectangle(90,180,0,0));
      }
      
      public function getStringByResultID(ResultID:int) : String
      {
         var returnString:String = "没有找到对应的错误枚举!";
         switch(ResultID)
         {
            case 2098:
               returnString = "信息没拉到!";
               break;
            case 2099:
               returnString = "物品配置信息未找到!";
               break;
            case 2100:
               returnString = "消耗道具不足!";
               break;
            case 2101:
               returnString = "物品未购买!";
               break;
            case 2102:
               returnString = "物品已经购买!";
               break;
            case 2103:
               returnString = "物品过期!";
               break;
            case 2104:
               returnString = "物品重叠!";
         }
         return returnString;
      }
      
      public function TransformationData(arr:Array) : Array
      {
         var obj:CSmallRoomItemVO = null;
         var returnArr:Array = new Array();
         for(var i:int = 0; i < arr.length; i++)
         {
            obj = new CSmallRoomItemVO();
            obj.m_iBuyTime = arr[i].m_iBuyTime;
            obj.m_iDirection = arr[i].m_iDirection;
            obj.m_iID = arr[i].m_iID;
            obj.m_iPositonX = arr[i].m_iPositonX;
            obj.m_iPositonY = arr[i].m_iPositonY;
            obj.m_iTypeID = arr[i].m_iTypeID;
            returnArr.push(obj);
         }
         return returnArr;
      }
      
      public function checkDate(m_MoveVectory:Array) : void
      {
         for(var i:int = 0; i < m_MoveVectory.length; i++)
         {
            if(m_MoveVectory[i].m_iTypeID == 1)
            {
               this.updataVectory(m_MoveVectory[i],SmallRoomConfig.Get().m_roomVec);
            }
            else if(m_MoveVectory[i].m_iTypeID == 2)
            {
               this.updataVectory(m_MoveVectory[i],SmallRoomConfig.Get().m_wallVec);
            }
            else if(m_MoveVectory[i].m_iTypeID == 3)
            {
               this.updataVectory(m_MoveVectory[i],SmallRoomConfig.Get().m_themeVec);
            }
            else if(m_MoveVectory[i].m_iTypeID == 4)
            {
               this.updataVectory(m_MoveVectory[i],SmallRoomConfig.Get().m_FoodVec);
            }
         }
      }
      
      private function updataVectory(obj:Object, data:Vector.<ItemConfigVO>) : void
      {
         var vo:ItemConfigVO = null;
         for(var j:int = 0; j < data.length; j++)
         {
            vo = data[j];
            if(obj.m_iID == vo.m_iItemID)
            {
               vo.m_buyState = false;
               if(obj.m_iDirection == 1)
               {
                  vo.m_putState = true;
               }
               else
               {
                  vo.m_putState = false;
               }
               break;
            }
         }
      }
      
      public function TransformationVO(data:Object) : ItemConfigVO
      {
         var vo:ItemConfigVO = new ItemConfigVO();
         vo.m_iItemID = data.m_iItemID;
         vo.m_iItemName = data.m_iItemName;
         vo.m_iItemCost = data.m_iItemCost;
         vo.m_iItemWidth = data.m_iItemWidth;
         vo.m_iItemHeight = data.m_iItemHeight;
         vo.m_ItemType = data.m_ItemType;
         vo.m_ItemX = data.m_ItemX;
         vo.m_ItemY = data.m_ItemY;
         vo.m_buyState = data.m_buyState;
         vo.m_putState = data.m_putState;
         return vo;
      }
   }
}

