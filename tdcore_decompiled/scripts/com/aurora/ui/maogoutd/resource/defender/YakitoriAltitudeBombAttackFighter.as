package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class YakitoriAltitudeBombAttackFighter extends a_3960
   {
      
      protected var a_1386:int;
      
      private var m_isPlaced:Boolean = false;
      
      public function YakitoriAltitudeBombAttackFighter()
      {
         super();
         a_1095 = 25;
         a_1332 = true;
         m_iBoomType = 1;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(YakitoriAltitudeBombAttackFighter) as YakitoriAltitudeBombAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return YakitoriAltitudeBombAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.a_1386 = 300 - this.a_3965();
         super.a_1797(stFieldGrid);
         a_1340 = true;
         this.m_isPlaced = false;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 300;
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         if(!this.m_isPlaced)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            this.m_isPlaced = true;
         }
         super.a_3961(iCurrentTime);
         --this.a_1386;
         if(this.a_1386 == 0)
         {
            BattleFieldView.a_1033.play();
            a_1275 = 3;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         if(a_1275 == 3 && a_1334.a_1511.length > 0)
         {
            for each(stMoveIntruder in a_1334.a_1511)
            {
               if(3 == stMoveIntruder.iSpaceState)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
                  break;
               }
            }
         }
         if(a_1273 == a_1274 - 7 && a_1329 == iCurrentTime)
         {
            BattleFieldView.a_1049.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            for each(stMoveIntruder in a_1334.a_1511.concat())
            {
               if(3 == stMoveIntruder.iSpaceState)
               {
                  stMoveIntruder.a_4210();
               }
            }
         }
         if(a_1273 == a_1274)
         {
            super.a_3969(a_1339);
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 20 * a_1094;
         if(10 < a_1094 && a_1094 <= 12)
         {
            iStarDegreeEffect = 20 * 10;
         }
         else if(12 < a_1094 && a_1094 <= 15)
         {
            iStarDegreeEffect = 220;
         }
         else if(15 < a_1094)
         {
            iStarDegreeEffect = 240;
         }
         return iStarDegreeEffect;
      }
   }
}

