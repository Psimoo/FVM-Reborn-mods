package com.aurora.ui.maogoutd.resource.defender.HorseYear.windrider
{
   import a_4781.TimeoutManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.Bitmap;
   
   public class MouseScareHandler
   {
      
      private static var _instance:MouseScareHandler;
      
      private var _scareBitmapPool:Vector.<Bitmap> = new Vector.<Bitmap>();
      
      private var _usingBitmaps:Vector.<Bitmap> = new Vector.<Bitmap>();
      
      private var _scaredOutMice:Vector.<a_4206> = new Vector.<a_4206>();
      
      public function MouseScareHandler()
      {
         super();
         if(_instance)
         {
            throw new Error("MouseScareHandler 已经是单例，禁止直接 new！");
         }
      }
      
      public static function getInstance() : MouseScareHandler
      {
         if(!_instance)
         {
            _instance = new MouseScareHandler();
         }
         return _instance;
      }
      
      private static function GetiNoX(newX:int, a_1283:Boolean) : int
      {
         var iXGridNo:int = int(newX / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         return iXGridNo;
      }
      
      public function scareMouse(intruder:a_4206, deltaX:Number, targetGrid:a_3491, callBack:Function = null, isShowScareBitMap:Boolean = true, isShowSound:Boolean = true) : Boolean
      {
         if(!this.validateIntruder(intruder))
         {
            return false;
         }
         if(!targetGrid)
         {
            return false;
         }
         var targetX:Number = intruder.x + (intruder.IsReversed() ? -deltaX : deltaX);
         var battleField:BattleFieldView = intruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
         targetX = this.clamp(targetX,0,BattleFieldView.a_1013 - 1);
         if(intruder.m_stCurrentFieldGrid.m_isNeedTray != targetGrid.m_isNeedTray)
         {
            return false;
         }
         var gobackX:Number = targetX - intruder.x;
         this.removeIntruder(intruder,battleField);
         if(isShowSound)
         {
            BattleFieldView.a_1021.play();
         }
         var bmp:Bitmap = isShowScareBitMap ? this.acquireScareBitmap() : null;
         if(bmp)
         {
            this.placeScareBitmap(intruder,bmp);
         }
         var data:MouseScareData = new MouseScareData(intruder,targetGrid,bmp,gobackX,battleField.a_3459,battleField,callBack);
         TimeoutManager.getInstance().AddDelay(100,this.onMouseScareTimeout,data);
         return true;
      }
      
      private function acquireScareBitmap() : Bitmap
      {
         var bmp:Bitmap = null;
         bmp = this._scareBitmapPool.pop();
         if(!bmp)
         {
            bmp = new Bitmap(BitMapManager.getInstance().GetMouseScareBitmapData().clone());
         }
         bmp.visible = true;
         bmp.alpha = 1;
         bmp.scaleX = bmp.scaleY = 1;
         this._usingBitmaps.push(bmp);
         return bmp;
      }
      
      private function recycleBitmap(bmp:Bitmap) : void
      {
         if(!bmp)
         {
            return;
         }
         if(bmp.parent)
         {
            bmp.parent.removeChild(bmp);
         }
         bmp.visible = false;
         var idx:int = this._usingBitmaps.indexOf(bmp);
         if(idx != -1)
         {
            this._usingBitmaps.splice(idx,1);
         }
         this._scareBitmapPool.push(bmp);
      }
      
      private function placeScareBitmap(intruder:a_4206, bmp:Bitmap) : void
      {
         if(!bmp)
         {
            return;
         }
         bmp.x = intruder.x + intruder.stDisplayBitmap.x;
         bmp.y = intruder.y + intruder.stDisplayBitmap.y;
         intruder.parent.addChildAt(bmp,intruder.parent.getChildIndex(intruder) + 1);
      }
      
      private function onMouseScareTimeout(data:MouseScareData) : void
      {
         var intruder:a_4206 = null;
         var targetGrid:a_3491 = null;
         intruder = data.intruder;
         targetGrid = data.targetGrid;
         var bmp:Bitmap = data.bmp;
         var goback:Number = data.goback;
         var addFunc:Function = data.addFunc;
         var battleField:BattleFieldView = data.battleField;
         var callBack:Function = data.callBack;
         if(!intruder || !targetGrid)
         {
            return;
         }
         intruder.x += goback;
         if(intruder.m_stWaterEffect)
         {
            intruder.m_stWaterEffect.x += goback;
            intruder.m_stWaterEffect.y += (targetGrid.m_iYGridNo - intruder.m_stCurrentFieldGrid.m_iYGridNo) * a_3491.a_1081;
         }
         this.removeFromScaredOut(intruder);
         addFunc(intruder,targetGrid,false);
         this.recycleBitmap(bmp);
         TimeoutManager.getInstance().removeTimeout(intruder.globalMoveFighterID.toString());
         if(callBack != null)
         {
            callBack(intruder);
         }
      }
      
      private function removeIntruder(intruder:a_4206, battleField:BattleFieldView) : void
      {
         var vec:Array = battleField.m_arrBaseMoveIntruderVector;
         var idx:int = vec.indexOf(intruder);
         if(idx != -1)
         {
            vec.splice(idx,1);
         }
         intruder.m_stCurrentFieldGrid.a_3457(intruder);
         battleField.a_3457(intruder);
         if(this._scaredOutMice.indexOf(intruder) == -1)
         {
            this._scaredOutMice.push(intruder);
         }
      }
      
      private function removeFromScaredOut(intruder:a_4206) : void
      {
         var idx:int = this._scaredOutMice.indexOf(intruder);
         if(idx != -1)
         {
            this._scaredOutMice.splice(idx,1);
         }
      }
      
      public function validateIntruder(intruder:a_4206) : Boolean
      {
         if(!intruder || intruder.iLifeValue <= 0 || intruder.IsBossIntruder || intruder.HasTag(40003))
         {
            return false;
         }
         if(!intruder.isFearCatHead || !intruder.m_stCurrentFieldGrid)
         {
            return false;
         }
         return intruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector.indexOf(intruder) != -1;
      }
      
      private function clamp(value:Number, min:Number, max:Number) : Number
      {
         return Math.max(min,Math.min(max,value));
      }
      
      public function getTargetGrid(stMoveIntruder:a_4206, offsetX:Number, iYGridNo:int) : a_3491
      {
         if(!stMoveIntruder || !stMoveIntruder.m_stCurrentFieldGrid)
         {
            return null;
         }
         var targetX:Number = stMoveIntruder.x + (stMoveIntruder.IsReversed() ? -offsetX : offsetX);
         targetX = Math.max(0,Math.min(targetX,BattleFieldView.a_1013 - 1));
         var targetGridX:int = GetiNoX(targetX,stMoveIntruder.IsReversed());
         return stMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(targetGridX,iYGridNo);
      }
      
      public function clearAll() : void
      {
         var intruder:a_4206 = null;
         for(var i:* = int(this._usingBitmaps.length - 1); i >= 0; i--)
         {
            this.recycleBitmap(this._usingBitmaps[i]);
         }
         this._usingBitmaps.length = 0;
         for each(intruder in this._scaredOutMice)
         {
            intruder.visible = false;
            intruder.a_3432();
         }
         this._scaredOutMice.length = 0;
      }
   }
}

