package com.aurora.ui.common.tips
{
   import a_4716.EnmWindowSize;
   import a_4752.GameStringManager;
   import com.greensock.TweenLite;
   import flash.display.DisplayObjectContainer;
   
   public class CommonTipsTextManager
   {
      
      private static var m_pInstance:CommonTipsTextManager;
      
      private var m_vCommonTipsText:Vector.<CommonTipsText>;
      
      private var m_stContainerSp:DisplayObjectContainer;
      
      public function CommonTipsTextManager()
      {
         super();
         this.m_vCommonTipsText = new Vector.<CommonTipsText>();
      }
      
      public static function get Instance() : CommonTipsTextManager
      {
         return m_pInstance || (m_pInstance = new CommonTipsTextManager());
      }
      
      public function SetContainerSp(stContainerSp:DisplayObjectContainer) : void
      {
         this.m_stContainerSp = stContainerSp;
      }
      
      public function ShowAwardTip(arrTip:Array, fRate:Number = 1, bIsAddPrefix:Boolean = true) : void
      {
         if(0 == arrTip.length)
         {
            return;
         }
         this.CheckText(arrTip.length);
         this.DoAnimating(arrTip,fRate,bIsAddPrefix);
      }
      
      private function CheckText(iTotalNum:int) : void
      {
         var iLen:int = int(this.m_vCommonTipsText.length);
         for(var i:int = iLen; i < iTotalNum; i++)
         {
            this.m_vCommonTipsText.push(new CommonTipsText());
         }
         for(var j:int = 0; j < iLen; j++)
         {
            this.RemoveByParent(this.m_vCommonTipsText[j]);
         }
      }
      
      private function DoAnimating(arrTip:Array, fRate:Number, bIsAddPrefix:Boolean) : void
      {
         var fDelay:Number = NaN;
         var fTotalTime:Number = NaN;
         var fStageH:Number = NaN;
         var i:int = 0;
         if(fRate <= 0)
         {
            throw new Error("DoAnimating::fRate = " + fRate);
         }
         var fStageW:Number = EnmWindowSize.STAGE_WIDTH;
         fStageH = EnmWindowSize.STAGE_HEIGHT;
         for(i = 0; i < arrTip.length; i++)
         {
            fDelay = i * 0.2;
            fTotalTime = arrTip.length * 0.25 + 0.8;
            fDelay /= fRate;
            fTotalTime /= fRate;
            if(bIsAddPrefix)
            {
               arrTip[i] = GameStringManager.getInstance().getString(139862,[arrTip[i]]);
            }
            this.m_vCommonTipsText[i].htmlText = arrTip[i];
            this.m_vCommonTipsText[i].x = (fStageW - this.m_vCommonTipsText[i].width) * 0.5;
            this.m_vCommonTipsText[i].y = (fStageH - this.m_vCommonTipsText[i].height) * 0.5 - 100;
            this.m_stContainerSp.addChild(this.m_vCommonTipsText[i]);
            this.m_vCommonTipsText[i].alpha = 0;
            TweenLite.to(this.m_vCommonTipsText[i],0,{
               "delay":fDelay,
               "alpha":1,
               "onComplete":this.OnMoveComplete1,
               "onCompleteParams":[this.m_vCommonTipsText[i],fDelay,fTotalTime,fRate]
            });
         }
      }
      
      private function OnMoveComplete1(stText:CommonTipsText, fDelay:Number, fTotalTime:Number, fRate:Number) : void
      {
         var fDstY:Number = stText.y - 48 * (fTotalTime - fDelay * 2);
         TweenLite.to(stText,1 / fRate,{
            "y":fDstY,
            "onComplete":this.OnMoveComplete2,
            "onCompleteParams":[stText,fRate]
         });
      }
      
      private function OnMoveComplete2(stText:CommonTipsText, fRate:Number) : void
      {
         TweenLite.to(stText,0.5 / fRate,{
            "delay":2 / fRate,
            "alpha":0,
            "y":"-30",
            "onComplete":this.OnMoveComplete3,
            "onCompleteParams":[stText]
         });
      }
      
      private function OnMoveComplete3(stText:CommonTipsText) : void
      {
         stText.alpha = 1;
         this.RemoveByParent(stText);
      }
      
      private function RemoveByParent(stText:CommonTipsText) : void
      {
         if(null != stText.parent)
         {
            stText.parent.removeChild(stText);
         }
      }
   }
}

