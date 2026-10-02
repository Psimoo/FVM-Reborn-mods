package com.aurora.ui.maogoutd.resource.defender.TigerYear.PufferFish
{
   import a_4718.b_183;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import flash.display.FrameLabel;
   
   public class PufferFishBombSecondTransAttackFighter extends a_3960
   {
      
      private var iDefenseCount:int = 0;
      
      private var randomField:Array = new Array();
      
      private var ExistDefenseArray:Array = new Array();
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function PufferFishBombSecondTransAttackFighter()
      {
         super();
         a_1095 = PufferFishBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(PufferFishBombSecondTransAttackFighter) as PufferFishBombSecondTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return PufferFishBombSecondTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = PufferFishBombDefine.MAX_LIFE_VALUE;
         ++stFieldGrid.m_stCurrentBattbleFieldView.m_CardCount;
         this.iDefenseCount = Math.ceil(stFieldGrid.m_stCurrentBattbleFieldView.m_CardCount / 2);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return PufferFishBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         super.a_3961(iCurrentTime);
         if(iCurrentTime % 2 == 0)
         {
            return true;
         }
         trace("m_iCurrentFrame::" + a_1273);
         if(a_1273 == 22)
         {
            BattleFieldView.a_1048.play();
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            if(this.iDefenseCount % 2 == 0)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         else if(a_1273 == 24 || a_1273 == 39)
         {
            if(this.iDefenseCount % 2 == 0)
            {
               this.ClearMouse();
            }
            else
            {
               this.ClearCard();
            }
         }
         else if(a_1273 == 37 || a_1273 == 48)
         {
            super.a_3969(a_1339);
            a_3940();
         }
         return true;
      }
      
      private function ClearMouse() : void
      {
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(a_1334 == null)
         {
            return;
         }
         var xStart:int = 0;
         var xEnd:int = BattleFieldView.a_1011 - 1;
         var yStart:int = 0;
         var yEnd:int = BattleFieldView.a_1012 - 1;
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
               for each(stMoveIntruder in arrMoveIntruder)
               {
                  stMoveIntruder.a_4210();
               }
            }
         }
      }
      
      private function ClearCard() : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var xIndex:int = 0;
         var index:int = 0;
         if(a_1334 == null)
         {
            return;
         }
         while(this.ExistDefenseArray.length > 0)
         {
            this.ExistDefenseArray.pop();
         }
         while(this.randomField.length > 0)
         {
            this.randomField.pop();
         }
         this.SetRandomSeed();
         var xStart:int = 0;
         var xEnd:int = BattleFieldView.a_1011 - 1;
         var yStart:int = 0;
         var yEnd:int = BattleFieldView.a_1012 - 1;
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stTargetFieldGrid = stFieldGrid.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(stTargetFieldGrid.a_3492())
               {
                  if(!stTargetFieldGrid.m_stBoomDefense && !(stTargetFieldGrid.m_stAttackFighter is a_3924))
                  {
                     this.ExistDefenseArray.push(stTargetFieldGrid);
                  }
               }
            }
         }
         var len:int = this.ExistDefenseArray.length >= 5 ? 5 : int(this.ExistDefenseArray.length);
         for(var i:int = 0; i < len; i++)
         {
            do
            {
               index = int(this.m_stRandomSeed.nextInt(this.ExistDefenseArray.length));
               stTargetFieldGrid = this.ExistDefenseArray[index];
            }
            while(this.randomField.indexOf(stTargetFieldGrid) != -1);
            this.randomField.push(stTargetFieldGrid);
            this.a_3502(stTargetFieldGrid);
            this.RealeasePoisonShot(stTargetFieldGrid);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      private function RealeasePoisonShot(stFieldGrid:a_3491) : void
      {
         var stPoisonShot:a_4348 = a_4388.getInstance().a_4389(b_183.enm_Poison);
         stPoisonShot.iShotSequenceNum = 0;
         var iPosX:int = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
         var iPosY:int = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 5;
         stPoisonShot.a_1797(0,0,0,iPosX,iPosY,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
         stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPoisonShot,BattleLayerDefine.EFFECTS_BASE_TYPE,stFieldGrid);
      }
      
      protected function SetRandomSeed() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.m_stRandomSeed.setSeed(enterRoom.m_iTableID * 100,1000);
      }
   }
}

