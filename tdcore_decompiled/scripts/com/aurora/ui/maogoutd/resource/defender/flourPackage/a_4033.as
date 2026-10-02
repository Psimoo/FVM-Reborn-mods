package com.aurora.ui.maogoutd.resource.defender.flourPackage
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   
   public class a_4033 extends a_3953
   {
      
      private var m_isUsed:Boolean = false;
      
      private var m_isAttacked:Boolean = false;
      
      private var a_1350:int;
      
      public function a_4033()
      {
         super();
         a_1095 = 50;
         a_1304 = 0;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_4033) as a_4033;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlourPackageAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isUsed = false;
         this.m_isAttacked = false;
         this.a_1350 = 0;
         super.a_1797(stFieldGrid);
         a_1339 = 500;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 300 - this.a_3965();
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
            if(a_1273 >= (a_1276[a_1275] as FrameLabel).frame + 15)
            {
               a_1275 = 0;
               this.a_3969(a_1339);
            }
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stBackFieldGrid:a_3491 = null;
         var stFrontFieldGrid:a_3491 = null;
         var arrMoveIntruders:Array = null;
         var stBaseMoveIntruder:a_4206 = null;
         if(!this.m_isUsed)
         {
            stBackFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo - 1,a_1334.m_iYGridNo);
            stFrontFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
            if(Boolean(stBackFieldGrid) && (stBackFieldGrid.a_1511.length > 1 || 1 == stBackFieldGrid.a_1511.length && 0 == stBackFieldGrid.a_1511[0].iSpaceState))
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
               this.m_isUsed = true;
               this.a_1350 = a_1283 ? 10 : -10;
            }
            else if(a_1334.a_1511.length > 1 || 1 == a_1334.a_1511.length && 0 == a_1334.a_1511[0].iSpaceState)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               this.m_isUsed = true;
            }
            else if(Boolean(stFrontFieldGrid) && (stFrontFieldGrid.a_1511.length > 1 || 1 == stFrontFieldGrid.a_1511.length && 0 == stFrontFieldGrid.a_1511[0].iSpaceState))
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               this.m_isUsed = true;
               this.a_1350 = a_1283 ? -10 : 10;
            }
            if(this.m_isUsed)
            {
               BattleFieldView.a_1036.play();
               if(parent)
               {
                  parent.addChild(this);
               }
            }
         }
         if(this.m_isUsed)
         {
            if(a_1273 > (a_1276[a_1275] as FrameLabel).frame + 3 && a_1273 < (a_1276[a_1275] as FrameLabel).frame + 7)
            {
               x += this.a_1350;
            }
            else if(a_1273 == (a_1276[a_1275] as FrameLabel).frame + 8)
            {
               BattleFieldView.a_1037.play();
            }
            else if(!this.m_isAttacked && a_1273 == (a_1276[a_1275] as FrameLabel).frame + 10)
            {
               this.m_isAttacked = true;
               stBackFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo - 1,a_1334.m_iYGridNo);
               stFrontFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo + 1,a_1334.m_iYGridNo);
               if(Boolean(stBackFieldGrid) && stBackFieldGrid.a_1511.length > 0)
               {
                  arrMoveIntruders = stBackFieldGrid.a_1511.slice();
               }
               else if(a_1334.a_1511.length > 0)
               {
                  arrMoveIntruders = a_1334.a_1511.slice();
               }
               else if(Boolean(stFrontFieldGrid) && stFrontFieldGrid.a_1511.length > 0)
               {
                  arrMoveIntruders = stFrontFieldGrid.a_1511.slice();
               }
               for each(stBaseMoveIntruder in arrMoveIntruders)
               {
                  if(0 == stBaseMoveIntruder.iSpaceState)
                  {
                     stBaseMoveIntruder.BruisAttackID = this.a_3512();
                     stBaseMoveIntruder.a_4213();
                  }
               }
            }
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 3)
         {
            iStarDegreeEffect = 1 * a_1094;
         }
         else if(a_1094 > 3 && a_1094 <= 6)
         {
            iStarDegreeEffect = 1 * 3 + 1 * (a_1094 - 3);
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 1 * 3 + 1 * 3 + 2 * (a_1094 - 6);
         }
         else if(a_1094 > 9 && a_1094 <= 13)
         {
            iStarDegreeEffect = 1 * 3 + 1 * 3 + 2 * 3 + 2 * (a_1094 - 9);
         }
         else if(a_1094 > 13)
         {
            iStarDegreeEffect = 20 + (a_1094 - 13);
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

