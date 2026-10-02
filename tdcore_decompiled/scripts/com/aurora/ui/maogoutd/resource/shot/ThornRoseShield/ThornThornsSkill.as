package com.aurora.ui.maogoutd.resource.shot.ThornRoseShield
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.ThornRoseShield.shot.ThornThornsFourthShot;
   import com.aurora.ui.maogoutd.resource.shot.ThornRoseShield.shot.ThornThornsOneShot;
   import com.aurora.ui.maogoutd.resource.shot.ThornRoseShield.shot.ThornThornsThreeShot;
   import com.aurora.ui.maogoutd.resource.shot.ThornRoseShield.shot.ThornThornsTwoShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   
   public class ThornThornsSkill extends BaseSkill
   {
      
      private static var ms_stThornThornsSkillVector:Array = [];
      
      private static const TIME_CONVERSION_FACTOR:int = 20;
      
      private static const POSITION_ARRAYS:Array = [[[14,-12.5],[26.35,38.05],[-38.85,23.5]],[[12.55,-18.3],[30.5,11.3],[19.9,44.8],[-34,36.6],[-37.6,-3.95]],[[14.1,-19.9],[28.8,0.2],[35.6,23.65],[15.4,46.25],[-30.85,36],[-31.5,-0.25]],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]];
      
      private var m_isSkillUsed:Boolean = false;
      
      private var a_1309:int;
      
      private var a_1311:int;
      
      private var m_iShotGroupNum:int;
      
      private var m_iShotTaltolNum:int;
      
      private var m_ShotNumPerGroup:int;
      
      private var a_1321:int;
      
      private var a_1323:int;
      
      private var a_1317:int = 4;
      
      protected var a_1324:Array = [];
      
      private var m_PositonDevIndex:int;
      
      public function ThornThornsSkill()
      {
         super();
      }
      
      public static function a_3926() : ThornThornsSkill
      {
         return PoolManager.getInstance().CheckOutOne(ThornThornsSkill) as ThornThornsSkill;
      }
      
      override public function a_1797() : void
      {
         super.a_1797();
         this.m_isSkillUsed = false;
      }
      
      override public function OnTimeInterval(iTimeNum:uint) : void
      {
         super.OnTimeInterval(iTimeNum);
         if(!this.m_isSkillUsed && iTimeNum % 16 == 0)
         {
            if(Boolean(m_stBaseAvatar) && Boolean(m_stBaseAvatar.stFieldGrid))
            {
               this.SetSkillAttributes();
               this.a_1321 = -this.a_1309;
               this.m_isSkillUsed = true;
            }
         }
         if(this.m_isSkillUsed)
         {
            this.a_3954(iTimeNum);
         }
      }
      
      public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var j:int = 0;
         var i2:int = 0;
         var k:int = 0;
         if(iCurrentTime >= this.a_1321 + this.a_1309)
         {
            if(this.GetFieldIntruderNumForFulScreen(m_stBaseAvatar.stFieldGrid) <= 0)
            {
               return true;
            }
            this.clearLastWaitShots();
            for(j = 0; j < this.m_iShotGroupNum; j++)
            {
               for(i2 = 0; i2 < this.m_ShotNumPerGroup; i2++)
               {
                  stLastWaitShot = this.getShotBySkillDegree();
                  if(stLastWaitShot != null)
                  {
                     this.a_1324.push(this.getShotBySkillDegree());
                  }
               }
            }
            this.a_1321 = iCurrentTime;
            this.a_1323 = 0;
         }
         if(iCurrentTime - this.a_1321 == this.a_1317 * this.a_1323 && this.a_1324.length > 0)
         {
            for(k = 0; k < this.m_ShotNumPerGroup; k++)
            {
               this.initializeShot(this.a_1324.pop(),k);
            }
            if(this.a_1324.length > 0)
            {
               ++this.a_1323;
            }
         }
         return true;
      }
      
      override public function GetSkillCostCoolingTime() : uint
      {
         return 1;
      }
      
      override public function UseSkill(iRandomNum:int) : void
      {
         super.UseSkill(iRandomNum);
      }
      
      override public function a_4330() : void
      {
         super.a_4330();
         this.m_isSkillUsed = false;
      }
      
      private function SetSkillAttributes() : void
      {
         var attributes:Array = [[8,20,3,1],[9,19.5,3,1],[10,19,3,1],[11,18.5,3,1],[12,18,3,1],[13,17.5,3,1],[15,17,3,1],[17,16.5,3,2],[19,16,3,2],[21,15.5,5,2],[23,15,5,2],[26,14,5,2],[29,13,5,3],[32,12,6,3],[35,11,6,3],[38.5,9,8,3]];
         if(m_iSkillDegree < attributes.length)
         {
            this.setAttributes.apply(null,attributes[m_iSkillDegree]);
         }
         else
         {
            this.setAttributes(0,0,0,0);
         }
      }
      
      private function setAttributes(shotHurt:int, intervalTime:Number, shotPerGroup:int, groupNum:int) : void
      {
         this.a_1311 = shotHurt * 10;
         this.a_1309 = intervalTime * TIME_CONVERSION_FACTOR;
         this.m_ShotNumPerGroup = shotPerGroup;
         this.m_iShotGroupNum = groupNum;
         switch(this.m_ShotNumPerGroup)
         {
            case 3:
               this.m_PositonDevIndex = 0;
               break;
            case 5:
               this.m_PositonDevIndex = 1;
               break;
            case 6:
               this.m_PositonDevIndex = 2;
               break;
            case 8:
               this.m_PositonDevIndex = 3;
         }
      }
      
      private function clearLastWaitShots() : void
      {
         while(this.a_1324.length > 0)
         {
            this.a_1324.pop().a_4350();
         }
      }
      
      private function getShotBySkillDegree() : a_4348
      {
         if(m_iSkillDegree <= 8)
         {
            return ThornThornsOneShot.a_4344();
         }
         if(m_iSkillDegree <= 12)
         {
            return ThornThornsTwoShot.a_4344();
         }
         if(m_iSkillDegree <= 14)
         {
            return ThornThornsThreeShot.a_4344();
         }
         if(m_iSkillDegree <= 15)
         {
            return ThornThornsFourthShot.a_4344();
         }
         return null;
      }
      
      private function initializeShot(stLastWaitShot:a_4348, groupIndex:int) : void
      {
         if(m_stBaseAvatar.stFieldGrid == null)
         {
            return;
         }
         var m_tempPositona:Array = POSITION_ARRAYS[this.m_PositonDevIndex];
         var pox:int = (m_stBaseAvatar.stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080 + m_tempPositona[groupIndex][0] + 11;
         var poy:int = (m_stBaseAvatar.stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 + m_tempPositona[groupIndex][1] - 8;
         if(!m_stBattleFieldView.isOwnBattleField)
         {
            pox = BattleFieldView.a_1013 - pox;
         }
         stLastWaitShot.m_iSuperShotType = groupIndex;
         stLastWaitShot.iShotGroupIndex = this.a_1323;
         stLastWaitShot.a_1797(0,10,this.a_1311,pox,poy,m_stBaseAvatar.stFieldGrid.m_stCurrentBattbleFieldView,m_stBaseAvatar.stFieldGrid);
         m_stBaseAvatar.stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE,m_stBaseAvatar.stFieldGrid);
      }
      
      public function GetFieldIntruderNumForFulScreen(stFieldGrid:a_3491) : int
      {
         var iTotalIntruderNum:int = 0;
         var i:int = 0;
         if(stFieldGrid)
         {
            for(i = 0; i < BattleFieldView.a_1012; i++)
            {
               iTotalIntruderNum += stFieldGrid.m_stCurrentBattbleFieldView.stFieldRowIntruderStatusArray[i];
            }
         }
         return iTotalIntruderNum;
      }
   }
}

