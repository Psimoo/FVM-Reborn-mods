package com.aurora.ui.maogoutd.resource.defender.SnakeYear.WuGuSnake
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WuGuSnakeFirstAttackFighter extends a_3953
   {
      
      public var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function WuGuSnakeFirstAttackFighter()
      {
         super();
         a_1095 = WuGuSnakeDefence.DEFENSE_PRICE;
         a_1337 = 0;
         a_1313 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(WuGuSnakeFirstAttackFighter) as WuGuSnakeFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return WuGuSnakeFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         var enterRoom:Object = null;
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            enterRoom = a_2161.e.getEnterRoom();
            this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000 + s_GlobalInitCount);
            a_1311 = WuGuSnakeDefence.a_3965(a_1094);
            a_1309 = WuGuSnakeDefence.a_3966(m_iSkillDegree);
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return WuGuSnakeDefence.a_3964(m_iSkillDegree);
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
         var isExistIntruder:Boolean = false;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            isExistIntruder = WuGuSnakeDefence.GetFieldIntruderNumForAheadDirection(a_1334,1);
            if(isExistIntruder)
            {
               BattleFieldView.a_1032.play();
               a_1321 = iCurrentTime;
               a_1307 = (a_1276[0] as FrameLabel).frame;
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         if(iCurrentTime % 2 == 0 && (17 == a_1273 || 20 == a_1273 || 21 == a_1273))
         {
            this.HurtMoveIntruder(1);
         }
         return true;
      }
      
      private function HurtMoveIntruder(range:int) : void
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var stFieldGridVector:Array = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var randomNum:int = 0;
         var orangeLife:int = 0;
         if(stFieldGrid)
         {
            xStart = Math.max(stFieldGrid.m_iXGridNo - range,0);
            xEnd = Math.min(stFieldGrid.m_iXGridNo + range,BattleFieldView.a_1011 - 1);
            yStart = Math.max(stFieldGrid.m_iYGridNo - range,0);
            yEnd = Math.min(stFieldGrid.m_iYGridNo + range,BattleFieldView.a_1012 - 1);
            stFieldGridVector = stFieldGrid.m_stCurrentBattbleFieldView.stFieldGridsVector;
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(stMoveIntruder.iSpaceState != 0 || !stMoveIntruder.isCannotSeeByFighter)
                     {
                        stMoveIntruder.a_4209(a_1311);
                        stMoveIntruder.a_4208(b_182.a_432,1);
                        if(stMoveIntruder.iLifeValue > 0)
                        {
                           randomNum = this.m_stRandomSeed.nextInt(100) + 1;
                           if(randomNum <= 5)
                           {
                              this.AddHurtEffect(stMoveIntruder);
                              if(!stMoveIntruder.IsElite)
                              {
                                 stMoveIntruder.a_4209(stMoveIntruder.iLifeValue);
                              }
                              else
                              {
                                 orangeLife = Math.min(1500,stMoveIntruder.iInitialLifeValue * 0.08);
                                 stMoveIntruder.a_4209(orangeLife);
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function AddHurtEffect(stMoveIntruder:a_4206) : void
      {
         var m_stWuGuSnakeHurtIntruderEffect:a_4108 = null;
         if(stMoveIntruder.m_stCurrentFieldGrid != null && stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.IsBossIntruder && stMoveIntruder.m_stWuGuSnakeHurtIntruderEffect == null)
         {
            m_stWuGuSnakeHurtIntruderEffect = WuGuSnakeHurtIntruderEffect.a_3926();
            WuGuSnakeHurtIntruderEffect(m_stWuGuSnakeHurtIntruderEffect).stTargetMouveIntruder = stMoveIntruder;
            m_stWuGuSnakeHurtIntruderEffect.a_1797(a_1283);
            m_stWuGuSnakeHurtIntruderEffect.x = stMoveIntruder.x + 0.5 * stMoveIntruder.width + stMoveIntruder.stDisplayBitmap.x;
            m_stWuGuSnakeHurtIntruderEffect.y = stMoveIntruder.y + 0.5 * stMoveIntruder.height + stMoveIntruder.stDisplayBitmap.y;
            stMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(m_stWuGuSnakeHurtIntruderEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stMoveIntruder.m_stCurrentFieldGrid);
         }
      }
      
      override protected function a_3955() : Number
      {
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
   }
}

