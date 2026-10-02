package com.aurora.ui.maogoutd.resource.defender.goldVirgo
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import flash.display.FrameLabel;
   
   public class GoldVirgoGuardThirdProtector extends a_3975
   {
      
      private var a_1398:GoldVirgoGuardThirdProtectorBackside;
      
      private var m_isPlaced:Boolean = false;
      
      public var m_isAddLife:Boolean = false;
      
      public function GoldVirgoGuardThirdProtector()
      {
         super();
         a_1095 = 125;
      }
      
      public static function a_3926() : a_3975
      {
         return PoolManager.getInstance().CheckOutOne(GoldVirgoGuardThirdProtector) as GoldVirgoGuardThirdProtector;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldVirgoGuardThirdProtectorMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_isPlaced = false;
         this.m_isAddLife = true;
         this.a_1398 = GoldVirgoGuardThirdProtectorBackside.a_3926();
         this.a_1398.a_1797(a_1283);
         this.a_1398.visible = true;
         super.a_1797(stFieldGrid);
         a_1339 = GoldVirgoGuardProtectorDefine.GetCardLifeValueStarDegreeEffect(a_1094) * (1 + GoldVirgoGuardProtectorDefine.LIFE_ADDITION);
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.a_1398,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         if(m_bServerIssued && Boolean(stFieldGrid))
         {
            stFieldGrid.m_isLockVersatileDefense = false;
         }
         return true;
      }
      
      override public function set m_isShowFrozen(value:Boolean) : void
      {
         if(this.a_1398 != null)
         {
            this.a_1398.visible = !value;
         }
         super.m_isShowFrozen = value;
      }
      
      override public function set m_isShihua(value:Boolean) : void
      {
         if(this.a_1398 != null)
         {
            this.a_1398.visible = !value;
         }
         super.m_isShihua = value;
      }
      
      override protected function a_3964() : int
      {
         return GoldVirgoGuardProtectorDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(iRduceLifeValue > 0 && Boolean(a_1334))
         {
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = a_1334.m_iYGridNo - 1 < 0 ? 0 : int(a_1334.m_iYGridNo - 1);
            xStart = a_1334.m_iXGridNo - 1 < 0 ? 0 : int(a_1334.m_iXGridNo - 1);
            yEnd = a_1334.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 1);
            xEnd = a_1334.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 1);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     stMoveIntruder.a_3969(iRduceLifeValue);
                  }
               }
            }
         }
         if(Boolean(this.m_isAddLife) && Boolean(stFieldGrid.m_stAttackFighter) && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.a_3969(-1000);
            this.m_isAddLife = false;
         }
         if(this.m_isAddLife && Boolean(stFieldGrid.m_stFlowerDefense))
         {
            stFieldGrid.m_stFlowerDefense.a_3969(-1000);
            this.m_isAddLife = false;
         }
         if(this.m_isAddLife && Boolean(stFieldGrid.m_stBaseAuxiliaryFighter))
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(-1000);
            this.m_isAddLife = false;
         }
         if(this.m_isAddLife && stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,-1000,-1);
            this.m_isAddLife = false;
         }
         super.a_3969(iRduceLifeValue);
         if(a_1339 > 320 && a_1275 != 0)
         {
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
            this.a_1398.gotoAndStop(1);
         }
         else if(a_1339 <= 320 && a_1339 > 180 && a_1275 != 1)
         {
            a_1275 = 1;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
            this.a_1398.gotoAndStop(2);
         }
         else if(a_1339 <= 180 && a_1339 > 0 && a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
            this.a_1398.gotoAndStop(3);
         }
         else if(a_1339 <= 0)
         {
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         var stBattbleFieldView:BattleFieldView = null;
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
         if(!this.m_isPlaced)
         {
            this.a_1398.a_1797(a_1283);
            this.a_1398.x = x + (!a_1283 ? 13 : -13);
            this.a_1398.y = y + 18;
            stBattbleFieldView = a_1334.m_stCurrentBattbleFieldView;
            stBattbleFieldView.AddToBattleView(this.a_1398,BattleLayerDefine.DEFENSE_PROTECTOR_BEFORE_TYPE,a_1334);
            this.m_isPlaced = true;
         }
      }
      
      override public function a_3940() : Boolean
      {
         var stAddBloodEffect:GoldVirgoGuardThirdBoomEffect = null;
         var stFieldGridVector:Array = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         if(this.m_isPlaced)
         {
            stAddBloodEffect = GoldVirgoGuardThirdBoomEffect.a_3926();
            stAddBloodEffect.a_1797(false);
            stAddBloodEffect.x = x - stAddBloodEffect.width / 2 + width / 2;
            stAddBloodEffect.y = y - stAddBloodEffect.height / 2 + height / 2;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stAddBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
            a_1334.m_stCurrentBattbleFieldView.a_3466();
            stFieldGridVector = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
            yStart = a_1334.m_iYGridNo - 2 < 0 ? 0 : int(a_1334.m_iYGridNo - 2);
            xStart = a_1334.m_iXGridNo - 2 < 0 ? 0 : int(a_1334.m_iXGridNo - 2);
            yEnd = a_1334.m_iYGridNo + 2 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(a_1334.m_iYGridNo + 2);
            xEnd = a_1334.m_iXGridNo + 2 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(a_1334.m_iXGridNo + 2);
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                  for each(stMoveIntruder in arrMoveIntruder)
                  {
                     if(!stMoveIntruder.IsElite)
                     {
                        stMoveIntruder.a_4210();
                     }
                     else
                     {
                        stMoveIntruder.PowerfulBombReduceLifeRate(3000 / 900,true);
                     }
                  }
               }
            }
         }
         this.m_isPlaced = false;
         super.a_3940();
         this.m_isAddLife = false;
         if(this.a_1398)
         {
            this.a_1398.a_3940();
         }
         return true;
      }
   }
}

