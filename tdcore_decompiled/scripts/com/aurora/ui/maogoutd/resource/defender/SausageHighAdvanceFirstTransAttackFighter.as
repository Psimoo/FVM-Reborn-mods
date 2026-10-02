package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.SausageHighAdvanceShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class SausageHighAdvanceFirstTransAttackFighter extends a_3953
   {
      
      private var m_isHighShot:Boolean;
      
      public function SausageHighAdvanceFirstTransAttackFighter()
      {
         super();
         a_1095 = 225;
         a_1310 = 6;
         a_1337 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(SausageHighAdvanceFirstTransAttackFighter) as SausageHighAdvanceFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return SausageHighAdvanceFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isHighShot = false;
         super.a_1797(stFieldGrid);
         a_1309 = 70 - this.a_3966();
         a_1311 = 50 + this.a_3965();
         a_1317 = 10;
         a_1315 = true;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var xIndex:int = 0;
         var stLastWaitShot:SausageHighAdvanceShot = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var stBaseShot:a_4348 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            a_1321 = iCurrentTime;
            this.m_isHighShot = false;
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(xIndex = 0; xIndex < BattleFieldView.a_1011; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[a_1334.m_iYGridNo][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  if(3 == stMoveIntruder.iSpaceState)
                  {
                     this.m_isHighShot = true;
                     break;
                  }
               }
            }
            stLastWaitShot = SausageHighAdvanceShot.a_4344() as SausageHighAdvanceShot;
            if(null == stLastWaitShot)
            {
               return false;
            }
            a_1324.push(stLastWaitShot);
            if(this.m_isHighShot)
            {
               a_1307 = a_1273;
               a_1275 = 0;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
               a_1310 = 16;
               a_1323 = 1;
               a_1317 = 8;
               a_1315 = true;
               a_1309 = 70 - this.a_3966();
               for each(stBaseShot in a_1324)
               {
                  stBaseShot.m_isShotHighSkySpace = true;
               }
               stLastWaitShot = SausageHighAdvanceShot.a_4344() as SausageHighAdvanceShot;
               if(null == stLastWaitShot)
               {
                  return false;
               }
               stLastWaitShot.m_isShotHighSkySpace = true;
               a_1324.push(stLastWaitShot);
               stLastWaitShot = SausageHighAdvanceShot.a_4344() as SausageHighAdvanceShot;
               if(null == stLastWaitShot)
               {
                  return false;
               }
               stLastWaitShot.m_isShotHighSkySpace = true;
               a_1324.push(stLastWaitShot);
            }
            else
            {
               a_1307 = a_1273;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         super.a_3954(iCurrentTime);
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
            if(a_1273 == 1)
            {
               a_1310 = 6;
               this.m_isHighShot = false;
               a_1309 = 70 - this.a_3966();
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
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 5 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 5 * 3 + 10 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 5 * 3 + 10 * 3 + 20 * (a_1094 - 6);
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 5 * 4 + 10 * 3 + 20 * 3 + 25 * (a_1094 - 8);
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 4)
         {
            iSkillDegreeEffect = 1 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 4)
         {
            iSkillDegreeEffect = 1 * 4 + 2 * (m_iSkillDegree - 4);
         }
         return 2 * iSkillDegreeEffect;
      }
   }
}

