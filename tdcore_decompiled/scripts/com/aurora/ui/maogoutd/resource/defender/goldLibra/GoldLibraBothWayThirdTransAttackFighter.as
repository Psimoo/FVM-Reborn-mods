package com.aurora.ui.maogoutd.resource.defender.goldLibra
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.goldLibra.GoldLibraBothWayShotThird;
   import flash.display.FrameLabel;
   
   public class GoldLibraBothWayThirdTransAttackFighter extends a_3953
   {
      
      private var m_iShotPieceNum:int = 0;
      
      public function GoldLibraBothWayThirdTransAttackFighter()
      {
         super();
         a_1095 = GoldLibraBothWayDefine.DEFENSE_PRICE;
         a_1096 = false;
         a_1304 = GoldLibraBothWayDefine.GetShotTypeID();
         a_1338 = 8;
         a_1318 = true;
         a_1333 = false;
         a_1317 = 3;
         a_1309 = GoldLibraBothWayDefine.a_3966(m_iSkillDegree);
         a_1311 = GoldLibraBothWayDefine.GetCardStarDegreeFinalEffectValue(a_1094);
      }
      
      public static function a_3926() : GoldLibraBothWayThirdTransAttackFighter
      {
         return PoolManager.getInstance().CheckOutOne(GoldLibraBothWayThirdTransAttackFighter) as GoldLibraBothWayThirdTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldLibraBothWayThirdTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_iShotPieceNum = 0;
         a_1309 = GoldLibraBothWayDefine.a_3966(m_iSkillDegree);
         a_1311 = GoldLibraBothWayDefine.GetCardStarDegreeFinalEffectValue(a_1094);
         if(null != a_1336)
         {
            a_1336.y += 6;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 70;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var iFlag:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            stLastWaitShot = GoldLibraBothWayShotThird.a_4344();
            if(stLastWaitShot)
            {
               a_1321 = iCurrentTime;
               a_1323 = 0;
               a_1324.push(stLastWaitShot);
               for(i = 0; i < 9; i++)
               {
                  stLastWaitShot = GoldLibraBothWayShotThird.a_4344();
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               a_1307 = a_1273;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         if(a_1318 && iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            numShotXpos = this.a_3955() + 27;
            if(a_1283)
            {
               numShotXpos = -numShotXpos;
            }
            iFlag = 0;
            if(a_1323 == 0)
            {
               iFlag = this.m_iShotPieceNum % 4 == 0 ? 1 : 0;
               this.m_iShotPieceNum += 1;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.ms_iCritFrameLable = iFlag;
            stLastWaitShot.iShotSequenceNum = a_1323;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            numShotXpos = width - numShotXpos;
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.iShotSequenceNum = a_1323;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,a_1334,true);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.6;
      }
      
      override protected function a_3956() : Number
      {
         return 50;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.m_iShotPieceNum = 0;
         return true;
      }
   }
}

