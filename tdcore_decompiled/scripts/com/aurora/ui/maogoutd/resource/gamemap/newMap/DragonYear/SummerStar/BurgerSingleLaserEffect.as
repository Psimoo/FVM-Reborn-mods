package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.SummerStar
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class BurgerSingleLaserEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      private var m_arrEffect:Array = new Array();
      
      public var stOriginalFieldGrid:a_3491;
      
      public var stTargetFieldGrid:a_3491;
      
      private var a_1579:int = 2;
      
      private var m_BackSideBom:a_4108;
      
      private var m_hasCard:Boolean = false;
      
      private var m_BurgerBaseLaserEffect:BurgerBaseLaserEffect;
      
      public function BurgerSingleLaserEffect()
      {
         super();
         a_1279 = -10;
         m_iYDisplayCenterPos = 4;
      }
      
      public static function a_3926() : BurgerSingleLaserEffect
      {
         return PoolManager.getInstance().CheckOutOne(BurgerSingleLaserEffect) as BurgerSingleLaserEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BurgerSingleLaserEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         play();
         this.visible = false;
         this.addShield(this.stOriginalFieldGrid);
         return true;
      }
      
      public function InitBaseLaser(burgerBaseLaserEffect:BurgerBaseLaserEffect) : void
      {
         this.m_BurgerBaseLaserEffect = burgerBaseLaserEffect;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         ++this.m_iStartTime;
         x = this.m_BurgerBaseLaserEffect.x;
         this.m_BackSideBom.x = this.m_BurgerBaseLaserEffect.x;
         var iXGridNo:int = int(x / a_3491.a_1080);
         var iYGridNo:int = int(y / a_3491.a_1081);
         this.stTargetFieldGrid = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         nextFrame();
         this.checkState();
         if(this.m_hasCard && this.m_iStartTime % 10 == 0 && this.m_iStartTime != 0 && this.visible)
         {
            this.BurnFieldGridDefense(this.stTargetFieldGrid);
         }
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      private function checkState() : void
      {
         var stTargetFieldGrid1:a_3491 = null;
         var i:int = 0;
         var iTopCnt:int = 0;
         var iBottomCnt:int = 0;
         for(i = 1; i < this.stTargetFieldGrid.m_iYGridNo; i++)
         {
            stTargetFieldGrid1 = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.stTargetFieldGrid.m_iXGridNo,i);
            if(Boolean(stTargetFieldGrid1) && stTargetFieldGrid1.a_3492())
            {
               iTopCnt++;
               break;
            }
         }
         for(i = this.stTargetFieldGrid.m_iYGridNo + 1; i < BattleFieldView.a_1012 - 1; i++)
         {
            stTargetFieldGrid1 = this.stTargetFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.stTargetFieldGrid.m_iXGridNo,i);
            if(Boolean(stTargetFieldGrid1) && stTargetFieldGrid1.a_3492())
            {
               iBottomCnt++;
               break;
            }
         }
         this.visible = !Boolean(iTopCnt && iBottomCnt);
         if(this.stTargetFieldGrid.a_3492())
         {
            this.m_BackSideBom.visible = !Boolean(iTopCnt);
            if(!this.m_hasCard)
            {
               this.m_iStartTime = 0;
            }
            this.m_hasCard = true;
            if(!iBottomCnt)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         else
         {
            this.m_BackSideBom.visible = false;
            this.m_hasCard = false;
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         this.m_iStartTime = 0;
         a_1275 = 0;
         this.m_hasCard = false;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         this.addBackSideBomEffect();
         return true;
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(this.m_BackSideBom)
         {
            this.m_BackSideBom.a_3940();
         }
         this.m_BackSideBom = null;
         return true;
      }
      
      private function addBackSideBomEffect() : void
      {
         var m_iXGridNo:int = 0;
         var m_iYGridNo:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         stTargetFieldGrid = this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.stOriginalFieldGrid.m_iXGridNo,this.stOriginalFieldGrid.m_iYGridNo);
         if(stTargetFieldGrid != null && this.m_BackSideBom == null)
         {
            this.m_BackSideBom = SingleBomEffect.a_3926();
            this.m_BackSideBom.a_1797(false);
            this.m_BackSideBom.visible = false;
            this.m_BackSideBom.x = (stTargetFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_BackSideBom.y = (stTargetFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081;
            this.stOriginalFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this.m_BackSideBom,BattleLayerDefine.DEFENSE_PROTECTOR_BEFORE_TYPE,stTargetFieldGrid);
         }
      }
      
      protected function BurnFieldGridDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(!stFieldGrid.m_isCanBrokeByLight)
         {
            return false;
         }
         return stFieldGrid.BurnFieldGridDefenseNormal(this.a_1579 * 10);
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.ClearShield(this.stOriginalFieldGrid);
         return true;
      }
   }
}

