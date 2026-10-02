package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.FrostSnake.effect.FrostSnakeDeadEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4126;
   import flash.display.FrameLabel;
   
   public class IceAtomicBoomSecondAttackFighter extends a_3960
   {
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function IceAtomicBoomSecondAttackFighter()
      {
         super();
         a_1095 = 75;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(IceAtomicBoomSecondAttackFighter) as IceAtomicBoomSecondAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return IceAtomicBoomSecondAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         var enterRoom:Object = null;
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            enterRoom = a_2161.e.getEnterRoom();
            this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000 + s_GlobalInitCount);
            a_1339 = 250;
            if(stFieldGrid.m_stCurrentBattbleFieldView.iBattleFieldStageType == 1)
            {
               a_1340 = true;
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            else
            {
               a_1340 = false;
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 500 - this.a_3965();
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var y:int = 0;
         var x:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var hurtValue:int = 0;
         var randomNum:int = 0;
         var stIceFreezeUpEffect:a_4126 = null;
         var effect:FrostSnakeDeadEffect = null;
         super.a_3961(iCurrentTime);
         if(!a_1340 && a_1273 == (a_1276[3] as FrameLabel).frame - 1)
         {
            a_1275 = 3;
         }
         if(!a_1340 && a_1273 == (a_1276[4] as FrameLabel).frame - 1)
         {
            a_1275 = 4;
         }
         if(a_1273 == 27 && a_1329 == iCurrentTime)
         {
            BattleFieldView.a_1050.play();
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = 0;
            xStart = 0;
            yEnd = BattleFieldView.a_1012 - 1;
            xEnd = BattleFieldView.a_1011 - 1;
            for(y = yStart; y <= yEnd; y++)
            {
               for(x = xStart; x <= xEnd; x++)
               {
                  arrMoveIntruder = stFieldGridVector[y][x].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     hurtValue = 300;
                     if(!stMoveIntruder.IsElite)
                     {
                        randomNum = this.m_stRandomSeed.nextInt(100) + 1;
                        if(randomNum <= 5)
                        {
                           hurtValue = stMoveIntruder.iLifeValue;
                        }
                     }
                     stMoveIntruder.a_4209(hurtValue);
                     if(stMoveIntruder.visible && stMoveIntruder.iLifeValue > 0)
                     {
                        stIceFreezeUpEffect = a_4126.a_3926();
                        stMoveIntruder.a_4208(b_182.a_434,40,stIceFreezeUpEffect);
                        stMoveIntruder.a_4208(b_182.a_433,200);
                     }
                     if(a_1334 != null && stMoveIntruder.iLifeValue <= 0 && !stMoveIntruder.IsBossIntruder)
                     {
                        stMoveIntruder.a_3432();
                        effect = FrostSnakeDeadEffect.a_3926();
                        effect.a_1797(false);
                        a_1334.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
                        effect.x = stMoveIntruder.x;
                        effect.y = stMoveIntruder.y;
                     }
                  }
               }
            }
         }
         else if(a_1273 == a_1274 && a_1329 == iCurrentTime)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      override public function a_3970() : Boolean
      {
         if(a_1340)
         {
            a_1340 = false;
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 6)
         {
            iStarDegreeEffect = 2 * a_1094;
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 2 * 6 + 3 * (a_1094 - 6);
         }
         else if(a_1094 > 9 && a_1094 <= 15)
         {
            iStarDegreeEffect = 2 * 6 + 3 * 3 + 3 * (a_1094 - 9);
         }
         else if(a_1094 > 15)
         {
            iStarDegreeEffect = 43;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

