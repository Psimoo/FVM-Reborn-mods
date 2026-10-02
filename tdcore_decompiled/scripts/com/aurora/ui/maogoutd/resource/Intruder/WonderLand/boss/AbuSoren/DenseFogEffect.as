package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.boss.AbuSoren
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class DenseFogEffect extends a_4108
   {
      
      public var m_TargetFieldGrid:a_3491;
      
      public function DenseFogEffect()
      {
         super();
         a_1279 = -48;
         m_iYDisplayCenterPos = -51;
      }
      
      public static function a_3926() : DenseFogEffect
      {
         return PoolManager.getInstance().CheckOutOne(DenseFogEffect) as DenseFogEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return DenseFogEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         a_1275 = 0;
         this.SleepCard(this.m_TargetFieldGrid);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         this.isExistFlower();
      }
      
      public function isExistFlower() : void
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var indexY:int = 0;
         var indexX:int = 0;
         if(this.m_TargetFieldGrid)
         {
            stFieldGridVector = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = this.m_TargetFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(this.m_TargetFieldGrid.m_iYGridNo - 1);
            xStart = this.m_TargetFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(this.m_TargetFieldGrid.m_iXGridNo - 1);
            yEnd = this.m_TargetFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(this.m_TargetFieldGrid.m_iYGridNo + 1);
            xEnd = this.m_TargetFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(this.m_TargetFieldGrid.m_iXGridNo + 1);
            for(indexY = yStart; indexY <= yEnd; indexY++)
            {
               for(indexX = xStart; indexX <= xEnd; indexX++)
               {
                  if(Boolean(stFieldGridVector[indexY][indexX].m_stFlowerDefense) && stFieldGridVector[indexY][indexX].m_stFlowerDefense.iEnergyTypeID == 1)
                  {
                     this.a_3940();
                     break;
                  }
               }
            }
            for(indexY = 0; indexY < BattleFieldView.a_1012; indexY++)
            {
               for(indexX = 0; indexX < BattleFieldView.a_1011; indexX++)
               {
                  if(Boolean(stFieldGridVector[indexY][indexX].m_stFlowerDefense) && stFieldGridVector[indexY][indexX].m_stFlowerDefense.iEnergyTypeID == 3)
                  {
                     this.a_3940();
                     break;
                  }
                  if(stFieldGridVector[indexY][indexX].m_stAttackFighter != null && (stFieldGridVector[indexY][indexX].m_stAttackFighter.a_3512() == 286851424 || stFieldGridVector[indexY][indexX].m_stAttackFighter.a_3512() == 286851408))
                  {
                     this.a_3940();
                  }
               }
            }
         }
      }
      
      private function SleepCard(stTempFieldGrid:a_3491) : void
      {
         if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
         {
            stTempFieldGrid.m_stAttackFighter.SleepTime2(10 * 20);
         }
      }
      
      override public function a_3940() : Boolean
      {
         var stVector:Array = null;
         super.a_3940();
         if(this.m_TargetFieldGrid)
         {
            stVector = this.m_TargetFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
            if(-1 != stVector.indexOf(this))
            {
               stVector.splice(stVector.indexOf(this),1);
            }
         }
         return true;
      }
   }
}

