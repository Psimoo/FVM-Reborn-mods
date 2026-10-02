package com.aurora.ui.maogoutd.resource.defender.PigYear.TecgyMeow
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TecgyMeowBaseAttackFighter extends a_3953
   {
      
      private var m_isHighShot:Boolean;
      
      public function TecgyMeowBaseAttackFighter()
      {
         super();
         a_1310 = 15;
         a_1337 = 0;
         a_1095 = TecgyMeowDefine.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(TecgyMeowBaseAttackFighter) as TecgyMeowBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return TecgyMeowBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isHighShot = false;
         super.a_1797(stFieldGrid);
         a_1309 = TecgyMeowDefine.a_3966(m_iSkillDegree);
         a_1317 = 4;
         a_1339 = TecgyMeowDefine.MAX_LIFE_VALUE;
         a_1313 = true;
         m_LowHurtPower = TecgyMeowDefine.GetLowShotHurtValue(a_1094);
         m_hightHurtPower = TecgyMeowDefine.GetHighShotHurtValue(a_1094);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var stFieldGridVector:Array = null;
         var xIndex:int = 0;
         var num:int = 0;
         var yIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         var j:int = 0;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            this.m_isHighShot = false;
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
            }
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(xIndex = 0; xIndex < BattleFieldView.a_1011; xIndex++)
            {
               for(yIndex = 0; yIndex < BattleFieldView.a_1012; yIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(3 == stMoveIntruder.iSpaceState)
                     {
                        this.m_isHighShot = true;
                        break;
                     }
                  }
               }
            }
            num = a_1334.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[a_1334.m_iYGridNo];
            if(num <= 0 && !this.m_isHighShot)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
               }
               return true;
            }
            if(this.m_isHighShot)
            {
               for(i = 0; i < 2; i++)
               {
                  stLastWaitShot = TecgyMeowHighShot.a_4344() as TecgyMeowHighShot;
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  stLastWaitShot.m_isShotHighSkySpace = true;
                  a_1324.push(stLastWaitShot);
               }
               a_1311 = m_hightHurtPower;
               a_1321 = iCurrentTime;
               a_1307 = 10;
               a_1310 = 10;
               a_1275 = 0;
               a_1323 = 1;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            else
            {
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               for(j = 0; j < 2; j++)
               {
                  stLastWaitShot = TecgyMeowLowShot.a_4344() as TecgyMeowLowShot;
                  if(null == stLastWaitShot)
                  {
                     return false;
                  }
                  a_1324.push(stLastWaitShot);
               }
               a_1311 = m_LowHurtPower;
               a_1321 = iCurrentTime;
               a_1307 = 10;
               a_1310 = 6;
               a_1275 = 0;
               a_1323 = 1;
            }
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            if(this.m_isHighShot)
            {
               numShotXpos = 80;
            }
            else
            {
               numShotXpos = 70;
            }
            stLastWaitShot = a_1324.pop();
            stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956() + 10,a_1334.m_stCurrentBattbleFieldView,a_1334);
            parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
            if(a_1324.length > 0)
            {
               ++a_1323;
            }
         }
         return true;
      }
      
      override public function AddShotHurtForEach(value:int) : void
      {
         m_LowHurtPower += value;
         m_hightHurtPower += value;
      }
      
      override public function AddShotHurtRate(iAddRate:Number) : void
      {
         m_LowHurtPower *= 1 + iAddRate;
         m_hightHurtPower *= 1 + iAddRate;
      }
      
      override protected function a_3964() : int
      {
         return TecgyMeowDefine.a_3964(a_1094);
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
            if(a_1273 == 1)
            {
               this.m_isHighShot = false;
            }
         }
      }
      
      override protected function a_3955() : Number
      {
         return 0.7 * width;
      }
      
      override protected function a_3956() : Number
      {
         if(this.m_isHighShot)
         {
            return -20;
         }
         return 0.45 * height;
      }
   }
}

