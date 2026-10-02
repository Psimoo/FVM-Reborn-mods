package com.aurora.ui.maogoutd.resource.defender.SnakeYear.HolyFireGoddess
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class HolyFireGoddessFinalShot extends a_4348
   {
      
      private static var ms_stHolyFireGoddessShotVector:Array = new Array();
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function HolyFireGoddessFinalShot()
      {
         super();
         a_1279 = -50;
         m_iYDisplayCenterPos = -87;
         a_1588 = true;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stHolyFireGoddessShot:HolyFireGoddessFinalShot = ms_stHolyFireGoddessShotVector.pop();
         if(null == stHolyFireGoddessShot)
         {
            stHolyFireGoddessShot = new HolyFireGoddessFinalShot();
         }
         BattleFieldView.a_1017.play();
         return stHolyFireGoddessShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return HolyFireGoddessFinalShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_isShotHighSkySpace = true;
         a_1577 = false;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,m_iGlobalID);
         if(a_1584 != null && Boolean(a_1584.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            a_1584.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,a_1584.m_iXGridNo,a_1584.m_iYGridNo);
         }
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(a_1584 != null && Boolean(a_1584.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            a_1584.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
            a_1584 = null;
         }
         if(-1 == ms_stHolyFireGoddessShotVector.indexOf(this))
         {
            ms_stHolyFireGoddessShotVector.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stTargetFieldGrid:a_3491 = null;
         var i:int = 0;
         var j:int = 0;
         var step:int = 0;
         var iStart:int = 0;
         var iEnd:int = 0;
         ++a_1447;
         if(a_1447 % 2 == 1)
         {
            return;
         }
         var hit:Boolean = false;
         switch(a_1273)
         {
            case 2:
               iStart = 0;
               iEnd = 3;
               hit = true;
               break;
            case 3:
               iStart = 0;
               iEnd = 5;
               hit = true;
               break;
            case 4:
            case 5:
            case 6:
               iStart = 0;
               iEnd = BattleFieldView.a_1011;
               hit = true;
         }
         if(hit)
         {
            for(i = iStart; i < iEnd; i++)
            {
               for(j = -1; j <= 1; j++)
               {
                  step = a_1283 ? int(-i) : i;
                  stTargetFieldGrid = a_1584.m_stCurrentBattbleFieldView.a_3438(a_1584.m_iXGridNo + step,a_1584.m_iYGridNo + j);
                  if(stTargetFieldGrid != null)
                  {
                     this.KillFieldGrid(stTargetFieldGrid);
                  }
               }
            }
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274)
            {
               this.a_3940();
               return;
            }
         }
      }
      
      private function KillFieldGrid(stFieldGrid:a_3491) : void
      {
         var addCenter:Number = NaN;
         var sameMultiplier:Number = NaN;
         var stMoveIntruder:a_4206 = null;
         var canKill:Boolean = false;
         var totalPower:Number = NaN;
         var random:int = 0;
         if(stFieldGrid != null)
         {
            addCenter = stFieldGrid.getStraightShotMultiplier();
            sameMultiplier = this.GetSameDefenseAttackMultiplier(stFieldGrid);
            a_1325 = addCenter;
            for each(stMoveIntruder in stFieldGrid.a_1511)
            {
               if(m_HitMouseArray.indexOf(stMoveIntruder) == -1)
               {
                  canKill = true;
                  if(canKill)
                  {
                     totalPower = GetFinalDamage() * sameMultiplier;
                     if(a_1573 > 0)
                     {
                        stMoveIntruder.a_4208(b_182.a_432,a_1573);
                     }
                     stMoveIntruder.PowerfulBombReduceLifeRate(totalPower / 900);
                     m_HitMouseArray.push(stMoveIntruder);
                     if(stMoveIntruder.iLifeValue > 0)
                     {
                        random = int(this.m_stRandomSeed.nextInt(101));
                        if(random <= 20)
                        {
                           this.addDoubleHitEffect(stMoveIntruder);
                           stMoveIntruder.PowerfulBombReduceLifeRate(totalPower / 900);
                        }
                        if(stMoveIntruder.iLifeValue > 0)
                        {
                           random = int(this.m_stRandomSeed.nextInt(101));
                           if(random <= 20)
                           {
                              stMoveIntruder.a_4208(b_182.enm_shotEffectXuanYun,20);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      private function GetSameDefenseAttackMultiplier(gride:a_3491) : Number
      {
         var typeID:uint = 0;
         var bonus:Number = NaN;
         if(!gride)
         {
            return 1;
         }
         var sameTypeIDs:Array = [286401674,286401675,286401676,286401677];
         var totalCount:int = 0;
         for each(typeID in sameTypeIDs)
         {
            totalCount += gride.m_stCurrentBattbleFieldView.a_3422(typeID);
         }
         bonus = (totalCount - 1) * 0.08;
         if(bonus > 0.5)
         {
            bonus = 0.5;
         }
         return 1 + bonus;
      }
      
      private function addDoubleHitEffect(baseMoveIntruder:a_4206) : void
      {
         var buff:HolyFireGoddessDoubleHitEffect = null;
         buff = HolyFireGoddessDoubleHitEffect.a_3926();
         buff.x = baseMoveIntruder.x + 0.5 * baseMoveIntruder.width + baseMoveIntruder.stDisplayBitmap.x;
         buff.y = baseMoveIntruder.y + 0.5 * baseMoveIntruder.height + baseMoveIntruder.stDisplayBitmap.y;
         buff.a_1797(a_1283);
         baseMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buff,BattleLayerDefine.EFFECTS_TOP_TYPE,baseMoveIntruder.m_stCurrentFieldGrid);
      }
   }
}

