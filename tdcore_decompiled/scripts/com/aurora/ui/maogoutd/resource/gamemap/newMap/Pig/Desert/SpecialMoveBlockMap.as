package com.aurora.ui.maogoutd.resource.gamemap.newMap.Pig.Desert
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.iface.IGameMoveMapBlock;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockData;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class SpecialMoveBlockMap extends Sprite implements IGameMoveMapBlock
   {
      
      private var m_stCurrentBattleFieldView:BattleFieldView;
      
      private var m_stMoveBlockFieldGrid:MoveBlockFieldGrid;
      
      private var m_bIsRun:Boolean = false;
      
      private var m_iCurrentTimeNum:int;
      
      private var m_iSleepTime:int;
      
      private var m_stMapBitmap:Bitmap;
      
      public var m_vDisplayObject:Vector.<DisplayObject>;
      
      public var m_vTmpDisplayObject:Vector.<DisplayObject>;
      
      private var m_stGetBitmapData:Function;
      
      private var m_stMoveBlockData:MoveBlockData;
      
      public function SpecialMoveBlockMap(iOffsetX:int = 0, iOffsetY:int = 0)
      {
         super();
         this.m_stMapBitmap = new Bitmap();
         this.m_stMapBitmap.x = iOffsetX;
         this.m_stMapBitmap.y = iOffsetY;
         addChild(this.m_stMapBitmap);
         this.m_vDisplayObject = new Vector.<DisplayObject>();
      }
      
      public function SetBattleFieldView(stBattleFieldView:BattleFieldView) : void
      {
         this.m_stCurrentBattleFieldView = stBattleFieldView;
         if(!this.m_stMoveBlockFieldGrid)
         {
            this.m_stMoveBlockFieldGrid = new MoveBlockFieldGrid();
         }
         if(!this.m_stMoveBlockData)
         {
            throw new Error("地图数据出错！！！  m_stMoveBlockData is Null");
         }
         this.m_stMoveBlockFieldGrid.m_iWidth = this.m_stMoveBlockData.m_iWidth;
         this.m_stMoveBlockFieldGrid.m_iHeight = this.m_stMoveBlockData.m_iHeight;
         this.m_stMapBitmap.bitmapData = this.m_stGetBitmapData(this.m_stMoveBlockData);
         if(this.parent != this.m_stCurrentBattleFieldView)
         {
            this.m_stCurrentBattleFieldView.stMoveSprite.addChildAt(this,0);
         }
      }
      
      public function InitBlockMap(stMoveBlockData:MoveBlockData, stGetBitmapData:Function) : void
      {
         if(this.m_stMoveBlockData)
         {
            throw new Error("写错了，这地方初始化一次就够了");
         }
         this.m_stGetBitmapData = stGetBitmapData;
         this.m_stMoveBlockData = stMoveBlockData;
         this.m_stMapBitmap.bitmapData = this.m_stGetBitmapData(this.m_stMoveBlockData);
         addChildAt(this.m_stMapBitmap,0);
      }
      
      private function Reset() : void
      {
         this.m_iCurrentTimeNum = 0;
         this.m_iSleepTime = 0;
         x = this.m_stMoveBlockData.m_iDefultXGridNo * a_3491.a_1080;
         y = this.m_stMoveBlockData.m_iDefultYGridNo * a_3491.a_1081;
         this.m_stMoveBlockFieldGrid.m_iDirection = this.m_stMoveBlockData.m_iDefultDirection;
         this.m_stMoveBlockFieldGrid.m_iXGridNo = this.m_stMoveBlockData.m_iDefultXGridNo;
         this.m_stMoveBlockFieldGrid.m_iYGridNo = this.m_stMoveBlockData.m_iDefultYGridNo;
         this.m_stMoveBlockFieldGrid.m_iLastXGridNo = this.m_stMoveBlockFieldGrid.m_iXGridNo;
         this.m_stMoveBlockFieldGrid.m_iLastYGridNo = this.m_stMoveBlockFieldGrid.m_iYGridNo;
         this.m_vDisplayObject.length = 0;
      }
      
      public function MoveStart() : void
      {
         this.m_bIsRun = true;
         this.Reset();
      }
      
      public function ReleaseMoveMap() : void
      {
         this.m_bIsRun = false;
         this.Reset();
         if(this.m_stMapBitmap.bitmapData)
         {
            this.m_stMapBitmap.bitmapData = null;
         }
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         if(this.m_bIsRun)
         {
            this.m_iCurrentTimeNum = iTimeNum;
            if(this.m_iSleepTime > 0)
            {
               --this.m_iSleepTime;
               return;
            }
            this.Move();
         }
      }
      
      private function Move() : void
      {
         switch(this.m_stMoveBlockFieldGrid.m_iDirection)
         {
            case MoveBlockFieldGrid.MOVE_UP:
               this.MoveUp();
               break;
            case MoveBlockFieldGrid.MOVE_DOWN:
               this.MoveDown();
               break;
            case MoveBlockFieldGrid.MOVE_LEFT:
               this.MoveLeft();
               break;
            case MoveBlockFieldGrid.MOVE_RIGHT:
               this.MoveRight();
         }
         this.m_stCurrentBattleFieldView.SortDisplayObject();
      }
      
      private function MoveUp() : void
      {
         var iAddY:Number = 0;
         if(y > this.m_stMoveBlockData.m_iStartYGridNo * a_3491.a_1081)
         {
            if(y - this.m_stMoveBlockData.m_iSpeed > this.m_stMoveBlockData.m_iStartYGridNo * a_3491.a_1081)
            {
               iAddY = -this.m_stMoveBlockData.m_iSpeed;
               y -= this.m_stMoveBlockData.m_iSpeed;
               this.m_stMoveBlockFieldGrid.m_iYGridNo = Math.floor((y + a_3491.a_1081 / 2) / a_3491.a_1081);
            }
            else
            {
               iAddY = -(y - this.m_stMoveBlockData.m_iStartYGridNo * a_3491.a_1081);
               y = this.m_stMoveBlockData.m_iStartYGridNo * a_3491.a_1081;
            }
            if(this.m_stMoveBlockFieldGrid.m_iLastYGridNo != this.m_stMoveBlockFieldGrid.m_iYGridNo)
            {
               this.m_stMoveBlockFieldGrid.m_iYGridNo = this.m_stMoveBlockFieldGrid.m_iLastYGridNo;
               this.m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_UP;
               if(this.m_stCurrentBattleFieldView.MoveHandler(this.m_stMoveBlockFieldGrid))
               {
                  --this.m_stMoveBlockFieldGrid.m_iLastYGridNo;
                  --this.m_stMoveBlockFieldGrid.m_iYGridNo;
               }
               if(this.m_stMoveBlockFieldGrid.m_iLastYGridNo != this.m_stMoveBlockFieldGrid.m_iYGridNo)
               {
                  throw new Error("相差不是一点点");
               }
            }
            this.MoveDisplayObject(0,iAddY);
         }
         else
         {
            if(this.m_stMoveBlockFieldGrid.m_iDirection == this.m_stMoveBlockData.m_iDefultDirection)
            {
               this.m_iSleepTime = this.m_stMoveBlockData.m_iStartResidenceTime;
            }
            else
            {
               this.m_iSleepTime = this.m_stMoveBlockData.m_iEndResideceTime;
            }
            this.m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_LEFT;
         }
      }
      
      private function MoveDown() : void
      {
         var iAddY:Number = 0;
         if(y < this.m_stMoveBlockData.m_iEndYGridNo * a_3491.a_1081)
         {
            if(y + this.m_stMoveBlockData.m_iSpeed < this.m_stMoveBlockData.m_iEndYGridNo * a_3491.a_1081)
            {
               iAddY = this.m_stMoveBlockData.m_iSpeed;
               y += iAddY;
               this.m_stMoveBlockFieldGrid.m_iYGridNo = Math.floor((y + a_3491.a_1081 / 2) / a_3491.a_1081);
            }
            else
            {
               iAddY = this.m_stMoveBlockData.m_iEndYGridNo * a_3491.a_1081 - y;
               y = this.m_stMoveBlockData.m_iEndYGridNo * a_3491.a_1081;
            }
            if(this.m_stMoveBlockFieldGrid.m_iLastYGridNo != this.m_stMoveBlockFieldGrid.m_iYGridNo)
            {
               this.m_stMoveBlockFieldGrid.m_iYGridNo = this.m_stMoveBlockFieldGrid.m_iLastYGridNo;
               this.m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_DOWN;
               if(this.m_stCurrentBattleFieldView.MoveHandler(this.m_stMoveBlockFieldGrid))
               {
                  ++this.m_stMoveBlockFieldGrid.m_iLastYGridNo;
                  ++this.m_stMoveBlockFieldGrid.m_iYGridNo;
               }
               else
               {
                  trace("MoveHandler 失败了");
               }
               if(this.m_stMoveBlockFieldGrid.m_iLastYGridNo != this.m_stMoveBlockFieldGrid.m_iYGridNo)
               {
                  throw new Error("相差不是一点点");
               }
            }
            this.MoveDisplayObject(0,iAddY);
         }
         else
         {
            if(this.m_stMoveBlockFieldGrid.m_iDirection == this.m_stMoveBlockData.m_iDefultDirection)
            {
               this.m_iSleepTime = this.m_stMoveBlockData.m_iEndResideceTime;
            }
            else
            {
               this.m_iSleepTime = this.m_stMoveBlockData.m_iStartResidenceTime;
            }
            this.m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_RIGHT;
         }
      }
      
      private function MoveLeft() : void
      {
         var iAddX:Number = 0;
         if(x > this.m_stMoveBlockData.m_iStartXGridNo * a_3491.a_1080)
         {
            if(x - this.m_stMoveBlockData.m_iSpeed > this.m_stMoveBlockData.m_iStartXGridNo * a_3491.a_1080)
            {
               iAddX = -this.m_stMoveBlockData.m_iSpeed;
               x -= this.m_stMoveBlockData.m_iSpeed;
               this.m_stMoveBlockFieldGrid.m_iXGridNo = Math.floor((x + a_3491.a_1080 / 2) / a_3491.a_1080);
            }
            else
            {
               iAddX = -(x - this.m_stMoveBlockData.m_iStartXGridNo * a_3491.a_1080);
               x = this.m_stMoveBlockData.m_iStartXGridNo * a_3491.a_1080;
            }
            if(this.m_stMoveBlockFieldGrid.m_iLastXGridNo != this.m_stMoveBlockFieldGrid.m_iXGridNo)
            {
               this.m_stMoveBlockFieldGrid.m_iXGridNo = this.m_stMoveBlockFieldGrid.m_iLastXGridNo;
               this.m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_LEFT;
               if(this.m_stCurrentBattleFieldView.MoveHandler(this.m_stMoveBlockFieldGrid))
               {
                  --this.m_stMoveBlockFieldGrid.m_iLastXGridNo;
                  --this.m_stMoveBlockFieldGrid.m_iXGridNo;
               }
               if(this.m_stMoveBlockFieldGrid.m_iLastXGridNo != this.m_stMoveBlockFieldGrid.m_iXGridNo)
               {
                  throw new Error("相差不是一点点");
               }
            }
            this.MoveDisplayObject(iAddX,0);
         }
         else
         {
            if(this.m_stMoveBlockFieldGrid.m_iDirection == this.m_stMoveBlockData.m_iDefultDirection)
            {
               this.m_iSleepTime = this.m_stMoveBlockData.m_iStartResidenceTime;
            }
            else
            {
               this.m_iSleepTime = this.m_stMoveBlockData.m_iEndResideceTime;
            }
            this.m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_DOWN;
         }
      }
      
      private function MoveRight() : void
      {
         var iAddX:Number = 0;
         if(x < this.m_stMoveBlockData.m_iEndXGridNo * a_3491.a_1080)
         {
            if(x + this.m_stMoveBlockData.m_iSpeed < this.m_stMoveBlockData.m_iEndXGridNo * a_3491.a_1080)
            {
               iAddX = this.m_stMoveBlockData.m_iSpeed;
               x += iAddX;
               this.m_stMoveBlockFieldGrid.m_iXGridNo = Math.floor((x + a_3491.a_1080 / 2) / a_3491.a_1080);
            }
            else
            {
               iAddX = this.m_stMoveBlockData.m_iEndXGridNo * a_3491.a_1080 - x;
               x = this.m_stMoveBlockData.m_iEndXGridNo * a_3491.a_1080;
            }
            if(this.m_stMoveBlockFieldGrid.m_iLastXGridNo != this.m_stMoveBlockFieldGrid.m_iXGridNo)
            {
               this.m_stMoveBlockFieldGrid.m_iXGridNo = this.m_stMoveBlockFieldGrid.m_iLastXGridNo;
               this.m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_RIGHT;
               if(this.m_stCurrentBattleFieldView.MoveHandler(this.m_stMoveBlockFieldGrid))
               {
                  ++this.m_stMoveBlockFieldGrid.m_iLastXGridNo;
                  ++this.m_stMoveBlockFieldGrid.m_iXGridNo;
               }
               else
               {
                  trace("MoveHandler 失败了");
               }
               trace("m_stMoveBlockFieldGrid.m_iLastXGridNo:" + this.m_stMoveBlockFieldGrid.m_iLastXGridNo);
               if(this.m_stMoveBlockFieldGrid.m_iLastXGridNo != this.m_stMoveBlockFieldGrid.m_iXGridNo)
               {
                  throw new Error("相差不是一点点");
               }
            }
            this.MoveDisplayObject(iAddX,0);
         }
         else
         {
            if(this.m_stMoveBlockFieldGrid.m_iDirection == this.m_stMoveBlockData.m_iDefultDirection)
            {
               this.m_iSleepTime = this.m_stMoveBlockData.m_iEndResideceTime;
            }
            else
            {
               this.m_iSleepTime = this.m_stMoveBlockData.m_iStartResidenceTime;
            }
            this.m_stMoveBlockFieldGrid.m_iDirection = MoveBlockFieldGrid.MOVE_UP;
         }
      }
      
      private function MoveDisplayObject(iX:Number, iY:Number) : void
      {
         var stDis:DisplayObject = null;
         if(!this.m_vTmpDisplayObject)
         {
            this.m_vTmpDisplayObject = new Vector.<DisplayObject>();
         }
         this.m_vTmpDisplayObject.length = 0;
         for each(stDis in this.m_vDisplayObject)
         {
            stDis.x += iX;
            stDis.y += iY;
            if(!stDis.parent)
            {
               if(!this.m_vTmpDisplayObject)
               {
                  this.m_vTmpDisplayObject = new Vector.<DisplayObject>();
               }
               this.m_vTmpDisplayObject.push(stDis);
            }
         }
         while(this.m_vTmpDisplayObject.length)
         {
            this.a_3455(this.m_vTmpDisplayObject.pop());
         }
      }
      
      public function a_3441(stDisplayObject:DisplayObject, iXGridNo:int, iYGridNo:int) : Boolean
      {
         if(iYGridNo >= this.m_stMoveBlockFieldGrid.m_iYGridNo && iYGridNo < this.m_stMoveBlockFieldGrid.m_iYGridNo + this.m_stMoveBlockFieldGrid.m_iHeight && iXGridNo >= this.m_stMoveBlockFieldGrid.m_iXGridNo && iXGridNo < this.m_stMoveBlockFieldGrid.m_iXGridNo + this.m_stMoveBlockFieldGrid.m_iWidth)
         {
            if(-1 == this.m_vDisplayObject.indexOf(stDisplayObject))
            {
               if(this.m_bIsRun)
               {
                  stDisplayObject.x += x - (this.m_stMoveBlockFieldGrid.m_iXGridNo - this.m_stMoveBlockData.m_iDefultXGridNo) * a_3491.a_1080 - this.m_stMoveBlockData.m_iDefultXGridNo * a_3491.a_1080;
                  stDisplayObject.y += y - (this.m_stMoveBlockFieldGrid.m_iYGridNo - this.m_stMoveBlockData.m_iDefultYGridNo) * a_3491.a_1081 - this.m_stMoveBlockData.m_iDefultYGridNo * a_3491.a_1081;
               }
               this.m_vDisplayObject.push(stDisplayObject);
               return true;
            }
         }
         return false;
      }
      
      public function a_3455(stDisplayObject:DisplayObject) : void
      {
         if(-1 != this.m_vDisplayObject.indexOf(stDisplayObject))
         {
            this.m_vDisplayObject.splice(this.m_vDisplayObject.indexOf(stDisplayObject),1);
         }
      }
   }
}

