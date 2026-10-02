package com.aurora.ui.maogoutd.resource.defender.fusionCard.MagicFudge.effect
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class MagicFudgeBoomEffect extends a_4108
   {
      
      private static var ms_stMagicFudgeBoomEffectVector:Array = new Array();
      
      private static var a_1300:Vector.<BitmapData> = new Vector.<BitmapData>(50);
      
      private static var a_1301:Vector.<Point> = new Vector.<Point>(50);
      
      private static var a_1302:MovieClip = new MagicFudgeBoomEffectMovie();
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      private var m_arrPos:Array = [[-1,0],[1,0],[0,0],[0,-1],[0,1]];
      
      public function MagicFudgeBoomEffect()
      {
         super();
         a_1279 = -21;
         m_iYDisplayCenterPos = -21;
      }
      
      public static function a_3926() : MagicFudgeBoomEffect
      {
         var stMagicFudgeBoomEffect:MagicFudgeBoomEffect = ms_stMagicFudgeBoomEffectVector.pop();
         if(null == stMagicFudgeBoomEffect)
         {
            stMagicFudgeBoomEffect = new MagicFudgeBoomEffect();
         }
         return stMagicFudgeBoomEffect;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         if(this.stOriginalFieldGrid)
         {
            this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
         }
         this.m_iStartTime = 0;
         play();
         return true;
      }
      
      override protected function a_3911() : Vector.<BitmapData>
      {
         return a_1300;
      }
      
      override protected function a_3912() : Vector.<Point>
      {
         return a_1301;
      }
      
      override protected function a_3913() : MovieClip
      {
         return a_1302;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 3)
         {
            this.a_4360(this.stOriginalFieldGrid);
         }
         else if(a_1273 == a_1274 || a_1278 != null)
         {
            this.a_3940();
         }
      }
      
      private function a_4360(stFieldGrid:a_3491) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stCurFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(stFieldGrid == null)
         {
            return;
         }
         BattleFieldView.a_1048.play();
         stFieldGrid.m_stCurrentBattbleFieldView.a_3466();
         var iLen:int = int(this.m_arrPos.length);
         for(var i:int = 0; i < iLen; i++)
         {
            iXGridNo = stFieldGrid.m_iXGridNo + this.m_arrPos[i][0];
            iYGridNo = stFieldGrid.m_iYGridNo + this.m_arrPos[i][1];
            stCurFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(null != stCurFieldGrid)
            {
               arrMoveIntruder = stCurFieldGrid.a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(stMoveIntruder.iLifeValue > 0)
                  {
                     stMoveIntruder.a_4210();
                  }
               }
            }
         }
      }
      
      override public function a_3940() : Boolean
      {
         var stVector:Array = null;
         super.a_3940();
         if(this.stOriginalFieldGrid)
         {
            stVector = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         this.stOriginalFieldGrid = null;
         if(-1 == ms_stMagicFudgeBoomEffectVector.indexOf(this))
         {
            ms_stMagicFudgeBoomEffectVector.push(this);
         }
         if(Boolean(parent) && parent.contains(this))
         {
            parent.removeChild(this);
         }
         return true;
      }
   }
}

