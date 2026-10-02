package com.aurora.ui.maogoutd.resource.defender.RabbitYear.EggRabbit
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public dynamic class EggRabbitSecondDefence extends a_3960
   {
      
      private static var FULL_HV:int = 6000;
      
      private var m_iStoreHurtValue:int;
      
      private var m_shotArray:Array;
      
      private var m_bIsStartBoom:Boolean;
      
      public function EggRabbitSecondDefence()
      {
         super();
         a_1330 = 2;
         a_1333 = true;
         m_iBoomType = 1;
         this.m_bIsStartBoom = false;
         a_1095 = EggRabbitDefence.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(EggRabbitSecondDefence) as EggRabbitSecondDefence;
      }
      
      override protected function a_3964() : int
      {
         return EggRabbitDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.m_iStoreHurtValue = 0;
         this.m_shotArray = [];
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return EggRabbitSecondDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_bIsStartBoom = false;
         a_1275 = 0;
         this.m_iStoreHurtValue = 0;
         this.m_shotArray = [];
         a_1339 = 350;
         a_1340 = true;
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(a_1339 - iRduceLifeValue <= 0)
         {
            if(m_iDieType == 1)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
                  this.m_bIsStartBoom = true;
               }
            }
            else if(m_iDieType == 2)
            {
               this.AddShot();
               super.a_3969(iRduceLifeValue);
            }
            else
            {
               super.a_3969(iRduceLifeValue);
            }
         }
         else
         {
            super.a_3969(iRduceLifeValue);
         }
         return true;
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         if(0 == (iCurrentTime & 1))
         {
            return false;
         }
         super.a_3961(iCurrentTime);
         if(!this.m_bIsStartBoom && this.m_iStoreHurtValue < FULL_HV)
         {
            this.CollectHurt();
         }
         if(this.m_bIsStartBoom && a_1273 == a_1274 - 1)
         {
            this.AddShot();
         }
         else if(this.m_bIsStartBoom && a_1273 == a_1274)
         {
            super.a_3969(iLifeValue);
         }
         return true;
      }
      
      private function AddShot() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stStartField:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var stBaseShot:a_4348 = null;
         var iPosX:int = 0;
         var iPosY:int = 0;
         if(this.m_iStoreHurtValue <= 0)
         {
            return;
         }
         if(stFieldGrid == null)
         {
            return;
         }
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            iXGridNo = 0;
            iYGridNo = yIndex;
            stStartField = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            if(stStartField)
            {
               stLastWaitShot = EggRabbitShot.a_4344();
               iPosX = stStartField.m_iXGridNo * a_3491.a_1080;
               iPosY = stStartField.m_iYGridNo * a_3491.a_1081;
               stLastWaitShot.a_1797(0,15,this.m_iStoreHurtValue,iPosX,iPosY,stFieldGrid.m_stCurrentBattbleFieldView,stStartField,false,1,0);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,stStartField);
            }
         }
      }
      
      private function CollectHurt() : void
      {
         var stBaseShot:a_4348 = null;
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for each(stBaseShot in stFieldGrid.m_stCurrentBattbleFieldView.m_stBaseShotVector[yIndex].slice())
            {
               if(this.m_shotArray.indexOf(stBaseShot.m_iInitTime) == -1 && stBaseShot.iStartField() != null && stFieldGrid.m_iXGridNo - 1 <= stBaseShot.iStartField().m_iXGridNo && stBaseShot.iStartField().m_iXGridNo <= stFieldGrid.m_iXGridNo + 1)
               {
                  if(stBaseShot.iNumYSpeed == 0 && !stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && !stBaseShot.m_FollowingShot() && !stBaseShot.m_isPenetrate && stBaseShot.getCanAddAuxiliary())
                  {
                     this.m_iStoreHurtValue += stBaseShot.iHurtPower() * EggRabbitDefence.a_3965(a_1094);
                     this.m_iStoreHurtValue = this.m_iStoreHurtValue >= FULL_HV ? FULL_HV : this.m_iStoreHurtValue;
                     this.m_shotArray.push(stBaseShot.m_iInitTime);
                  }
               }
            }
         }
         this.ResetMovieStatus();
      }
      
      protected function ResetMovieStatus() : Boolean
      {
         if(this.m_iStoreHurtValue < FULL_HV * 0.2)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         else if(this.m_iStoreHurtValue < FULL_HV * 0.7)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1275 != 4)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
         }
         return true;
      }
      
      protected function a_3955() : Number
      {
         return width * 0.1;
      }
      
      protected function a_3956() : Number
      {
         return 0.25 * height;
      }
   }
}

