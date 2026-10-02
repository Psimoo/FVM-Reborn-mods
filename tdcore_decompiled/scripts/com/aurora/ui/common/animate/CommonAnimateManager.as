package com.aurora.ui.common.animate
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   
   public class CommonAnimateManager
   {
      
      private static var m_pInstance:CommonAnimateManager;
      
      public function CommonAnimateManager()
      {
         super();
      }
      
      public static function get Instance() : CommonAnimateManager
      {
         return m_pInstance || (m_pInstance = new CommonAnimateManager());
      }
      
      public function MoveTo(arrObjs:Array, pTargetPos:Point, stContainer:DisplayObjectContainer, fMoveTime:Number = 2, fDisappearTime:Number = 0.5) : void
      {
         var iLen:int = int(arrObjs.length);
         for(var i:int = 0; i < iLen; i++)
         {
            stContainer.addChild(arrObjs[i]);
            TweenLite.to(arrObjs[i],fMoveTime,{
               "x":pTargetPos.x,
               "y":pTargetPos.y,
               "onComplete":this.MoveToTargetCompelete,
               "onCompleteParams":[arrObjs[i],fDisappearTime]
            });
         }
      }
      
      private function MoveToTargetCompelete(stObj:DisplayObject, fDisappearTime:Number) : void
      {
         TweenLite.to(stObj,fDisappearTime,{
            "alpha":0,
            "onComplete":this.HideCompelete,
            "onCompleteParams":[stObj]
         });
      }
      
      private function HideCompelete(stObj:DisplayObject) : void
      {
         if(null != stObj.parent)
         {
            stObj.parent.removeChild(stObj);
         }
      }
   }
}

