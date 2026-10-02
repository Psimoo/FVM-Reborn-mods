package com.aurora.ui.maogoutd.resource.defender.PigYear.CureMeow
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class CureEffect extends a_4348
   {
      
      private static var ms_stCureEffectVector:Array = new Array();
      
      private var a_1596:int = -1;
      
      public var m_ishowType:int;
      
      public function CureEffect()
      {
         super();
         a_1279 = -width * 0;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stCureEffect:CureEffect = ms_stCureEffectVector.pop();
         if(null == stCureEffect)
         {
            stCureEffect = new CureEffect();
         }
         BattleFieldView.a_1017.play();
         return stCureEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return CureEffectMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.visible = false;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(this.a_1596 <= 0)
         {
            a_1275 = 0;
            gotoAndStop(1);
            this.a_1596 = setTimeout(this.a_3940,3000);
         }
         if(iCurrentTime % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop(1);
            }
         }
         var stCurrentFieldGrid:a_3491 = a_1584;
         if(Boolean(stCurrentFieldGrid) && iCurrentTime % 20 == 0)
         {
            trace("加血一次");
            this.CureSkill();
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stCureEffectVector.indexOf(this))
         {
            ms_stCureEffectVector.push(this);
         }
         this.a_1596 = -1;
         return true;
      }
      
      protected function CureSkill() : void
      {
         var xStart:int = 0;
         var xEnd:int = 0;
         var yStart:int = 0;
         var yEnd:int = 0;
         var xIndex:int = 0;
         if(this.m_ishowType == 3)
         {
            xStart = 0;
            xEnd = BattleFieldView.a_1011 - 1;
            yStart = 0;
            yEnd = BattleFieldView.a_1012 - 1;
         }
         else
         {
            if(this.m_ishowType != 2)
            {
               throw new Error("错误的参数！");
            }
            xStart = Math.max(a_1584.m_iXGridNo - 2,0);
            xEnd = Math.min(a_1584.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
            yStart = Math.max(a_1584.m_iYGridNo - 2,0);
            yEnd = Math.min(a_1584.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         }
         var stFieldGridVector:Array = a_1584.m_stCurrentBattbleFieldView.stFieldGridsVector;
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               this.CureFieldGridDefense(stFieldGridVector[yIndex][xIndex],-10);
            }
         }
      }
      
      protected function CureFieldGridDefense(stFieldGrid:a_3491, value:int = 10) : Boolean
      {
         var stAddDefBloodEffect:AddDefBloodEffect = null;
         if(stFieldGrid.a_3492() && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stAddDefBloodEffect = AddDefBloodEffect.a_3926();
            stAddDefBloodEffect.a_1797(false);
            stAddDefBloodEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stAddDefBloodEffect.width);
            stAddDefBloodEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stAddDefBloodEffect.height);
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddDefBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(value);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(value);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(value);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(value);
         }
         else if(stFieldGrid.HasNewSlot())
         {
            stFieldGrid.DamageNewSlot(false,0,false,value,1);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(value);
         }
         return true;
      }
   }
}

