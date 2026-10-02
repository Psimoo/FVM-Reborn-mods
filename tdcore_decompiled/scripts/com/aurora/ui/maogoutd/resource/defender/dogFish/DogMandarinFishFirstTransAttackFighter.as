package com.aurora.ui.maogoutd.resource.defender.dogFish
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DogMandarinFishFirstTransAttackFighter extends a_3953
   {
      
      private var a_1392:int;
      
      private var a_1383:int;
      
      private var a_1598:a_3491;
      
      public function DogMandarinFishFirstTransAttackFighter()
      {
         super();
         a_1095 = 45;
         a_1304 = b_183.enm_MandarinFishDogShot;
         a_1313 = true;
         a_1312 = 15;
         a_1309 = 40;
         a_1310 = 8;
         a_1333 = true;
         a_1320 = 2;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DogMandarinFishFirstTransAttackFighter) as DogMandarinFishFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DogMandarinFishFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.a_1392 = 0;
         this.a_1383 = 5;
         this.a_1598 = null;
         super.a_1797(stFieldGrid);
         a_1309 = 40;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 60;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var iTotalGridNumExistDefense:int = 0;
         var stBaseShot:a_4348 = null;
         if(null == this.a_1598)
         {
            iTotalGridNumExistDefense = a_1334.m_stCurrentBattbleFieldView.m_stOpponentBattleFieldInstance.a_3423();
            this.a_1598 = a_1334.m_stCurrentBattbleFieldView.m_stOpponentBattleFieldInstance.a_3427((m_iDefenseGlobalID + m_iPlaceTimeIntervals + a_1334.m_iXGridNo + a_1334.m_iYGridNo) % iTotalGridNumExistDefense);
            if(null == this.a_1598)
            {
               this.a_1598 = a_1334.m_stCurrentBattbleFieldView.m_stOpponentBattleFieldInstance.stFieldGridsVector[(m_iDefenseGlobalID + m_iPlaceTimeIntervals + a_1334.m_iXGridNo + a_1334.m_iYGridNo) % BattleFieldView.a_1012][(m_iDefenseGlobalID + m_iPlaceTimeIntervals + a_1334.m_iXGridNo - a_1334.m_iYGridNo) % BattleFieldView.a_1011];
            }
            this.a_1598.m_stCurrentBattbleFieldView.a_3460(this.a_1598.m_iXGridNo,this.a_1598.m_iYGridNo);
         }
         if(this.a_1383 <= 0 && iCurrentTime >= a_1321 + a_1309)
         {
            if(0 == this.a_1383 && iCurrentTime >= a_1321 + 40)
            {
               this.a_3969(a_1339);
            }
            return false;
         }
         super.a_3954(iCurrentTime);
         if(a_1321 == iCurrentTime)
         {
            if(0 == this.a_1392)
            {
               this.a_1392 = 1;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            else if(1 == this.a_1392)
            {
               this.a_1392 = 0;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            --this.a_1383;
            for each(stBaseShot in a_1324)
            {
               if((stBaseShot as Object).hasOwnProperty("a_1598"))
               {
                  (stBaseShot as Object).a_1598 = this.a_1598;
               }
            }
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3940() : Boolean
      {
         if(this.a_1598)
         {
            this.a_1598.m_stCurrentBattbleFieldView.a_3461(this.a_1598.m_iXGridNo,this.a_1598.m_iYGridNo);
         }
         super.a_3940();
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.8;
      }
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 == 0)
         {
            iStarDegreeEffect = 2;
         }
         else if(a_1094 == 1)
         {
            iStarDegreeEffect = 3;
         }
         else if(a_1094 == 2)
         {
            iStarDegreeEffect = 4;
         }
         else if(a_1094 == 3)
         {
            iStarDegreeEffect = 5;
         }
         else if(a_1094 == 4)
         {
            iStarDegreeEffect = 6;
         }
         else if(5 == a_1094)
         {
            iStarDegreeEffect = 8;
         }
         else if(6 == a_1094)
         {
            iStarDegreeEffect = 9;
         }
         else if(7 == a_1094)
         {
            iStarDegreeEffect = 11;
         }
         else if(8 == a_1094)
         {
            iStarDegreeEffect = 13;
         }
         else if(9 == a_1094)
         {
            iStarDegreeEffect = 18;
         }
         else if(10 == a_1094)
         {
            iStarDegreeEffect = 25;
         }
         else if(11 == a_1094)
         {
            iStarDegreeEffect = 34;
         }
         else if(12 == a_1094)
         {
            iStarDegreeEffect = 43;
         }
         else if(13 == a_1094)
         {
            iStarDegreeEffect = 55;
         }
         else if(14 == a_1094)
         {
            iStarDegreeEffect = 70;
         }
         else if(15 == a_1094)
         {
            iStarDegreeEffect = 85;
         }
         return iStarDegreeEffect;
      }
   }
}

