package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand
{
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand.Movie.DragonSuppressingCircleEffectMovie;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand.Movie.IsLandLineEffectMovie;
   import flash.events.Event;
   
   public class DragonSuppressingPillarEffect extends BaseGameEffect
   {
      
      protected var _tick:int = 0;
      
      private var _useCount:int = 0;
      
      public var state:int = 0;
      
      public var stFieldGrid:a_3491;
      
      private var nowCircle:BaseGameEffect = null;
      
      private var preCircle:BaseGameEffect = null;
      
      private var preLine:IsLandLineEffect = null;
      
      public var nextCircle:BaseGameEffect = null;
      
      public var nextLine:IsLandLineEffect = null;
      
      public var preCard:a_3953;
      
      public var nextCard:a_3953;
      
      public function DragonSuppressingPillarEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491) : void
      {
         this.stFieldGrid = grid;
         grid.m_iFieldGridType = 8;
         grid.tagCom.AddTag(20048);
         this._tick = -10;
         SetAnimationOnce2Loop(0,1);
         this.state = 0;
         this._useCount = 0;
         IsLandLineManager.getInstance().AddZhu(this);
      }
      
      public function AllHasCard() : Boolean
      {
         return this.preCard != null && this.nextCard != null;
      }
      
      public function CheckALive(card:a_3953) : Boolean
      {
         if(card == this.preCard && this.preLine == null)
         {
            return false;
         }
         if(card == this.nextCard && this.nextLine == null)
         {
            return false;
         }
         return true;
      }
      
      public function AddCard(card:a_3953) : void
      {
         var hasAdd:Boolean = false;
         if(this.preCard == null)
         {
            this.preCard = card;
            hasAdd = true;
         }
         if(this.nextCard == null && !hasAdd)
         {
            this.nextCard = card;
         }
         IsLandLineManager.getInstance().CheckInterestLine(this,card);
         if(this.AllHasCard() && this.state == 0)
         {
            SetAnimationOnce2Loop(4,5);
            this._tick = -9;
            this.state = 1;
            this._useCount = 0;
         }
         this.UpdateCircleAndLine();
      }
      
      public function UpdateCircleAndLine() : void
      {
         if(this.preCard == null && this.preCircle != null)
         {
            this.preCircle.SetAnimation(2,true);
            this.preCircle = null;
         }
         if(this.nextCard == null && this.nextCircle != null)
         {
            this.nextCircle.SetAnimation(2,true);
            this.nextCircle = null;
         }
         if(this.preCard == null && this.nextCard == null && this.nowCircle != null)
         {
            this.nowCircle.SetAnimation(2,true);
            this.nowCircle = null;
         }
         if(this.preCard != null && this.preCircle == null)
         {
            this.preCircle = BattleEffectUtil.CreateGameEffect2(DragonSuppressingCircleEffectMovie,this.preCard.stFieldGrid);
            this.preCircle.SetAnimationOnce2Loop(0,1);
            this.preCircle.alpha = 1;
         }
         if(this.nextCard != null && this.nextCircle == null)
         {
            this.nextCircle = BattleEffectUtil.CreateGameEffect2(DragonSuppressingCircleEffectMovie,this.nextCard.stFieldGrid);
            this.nextCircle.SetAnimationOnce2Loop(0,1);
            this.nextCircle.alpha = 1;
         }
         if((this.preCard != null || this.nextCard != null) && this.nowCircle == null)
         {
            this.nowCircle = BattleEffectUtil.CreateGameEffect2(DragonSuppressingCircleEffectMovie,this.stFieldGrid);
            this.nowCircle.SetAnimationOnce2Loop(0,1);
            this.nowCircle.alpha = 1;
         }
         if(this.preCard == null && this.preLine != null)
         {
            this.preLine.SetAnimation(5,true);
            this.preLine = null;
         }
         if(this.nextCard == null && this.nextLine != null)
         {
            this.nextLine.SetAnimation(5,true);
            this.nextLine = null;
         }
         if(this.preCard != null && this.preLine == null)
         {
            this.preLine = BattleEffectUtil.CreateOriginEffect(IsLandLineEffect,IsLandLineEffectMovie,this.stFieldGrid) as IsLandLineEffect;
            this.preLine.UpdateLine(this.stFieldGrid.m_iXGridNo,this.stFieldGrid.m_iYGridNo,this.preCard.stFieldGrid.m_iXGridNo,this.preCard.stFieldGrid.m_iYGridNo);
            this.preLine.SetAnimationOnce2Loop(3,4);
            this.preLine.alpha = 1;
         }
         if(this.nextCard != null && this.nextLine == null)
         {
            this.nextLine = BattleEffectUtil.CreateOriginEffect(IsLandLineEffect,IsLandLineEffectMovie,this.stFieldGrid) as IsLandLineEffect;
            this.nextLine.UpdateLine(this.stFieldGrid.m_iXGridNo,this.stFieldGrid.m_iYGridNo,this.nextCard.stFieldGrid.m_iXGridNo,this.nextCard.stFieldGrid.m_iYGridNo);
            this.nextLine.SetAnimationOnce2Loop(3,4);
            this.nextLine.alpha = 1;
         }
      }
      
      public function Line2RemoveCard(card:a_3953) : void
      {
         if(this.preCard == card)
         {
            this.preLine.RemoveLine(this,card);
         }
         if(this.nextCard == card)
         {
            this.nextLine.RemoveLine(this,card);
         }
      }
      
      public function RemoveCard(card:a_3953) : void
      {
         if(this.preCard == card)
         {
            this.preCard = null;
         }
         if(this.nextCard == card)
         {
            this.nextCard = null;
         }
         if(!this.AllHasCard() && this.state == 1)
         {
            SetAnimationOnce2Loop(7,1);
            this._tick = -13;
            this.state = 0;
            this._useCount = 0;
         }
         this.UpdateCircleAndLine();
      }
      
      protected function DoUpSkill() : void
      {
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         ++this._tick;
         if(this.state == 1)
         {
            if(this._useCount == 0)
            {
               if(this._tick == 30)
               {
                  SetAnimationOnce2Loop(6,5);
                  this._tick = -11;
                  ++this._useCount;
               }
            }
            else if(this._tick == 150)
            {
               SetAnimationOnce2Loop(6,5);
               this._tick = -11;
               ++this._useCount;
            }
         }
         else if(this._useCount == 0)
         {
            if(this._tick == 50)
            {
               SetAnimation(2);
            }
            else if(this._tick == 80)
            {
               SetAnimationOnce2Loop(3,1);
               this._tick = -13;
               ++this._useCount;
            }
         }
         else if(this._tick == 120)
         {
            SetAnimation(2);
         }
         else if(this._tick == 150)
         {
            SetAnimationOnce2Loop(3,1);
            this._tick = -13;
            ++this._useCount;
         }
         if(a_1273 == 33)
         {
            this.DoRealUpSkill();
         }
         else if(a_1273 == 62)
         {
            this.DoRealDownSkill();
         }
      }
      
      protected function DoRealUpSkill() : void
      {
      }
      
      protected function DoRealDownSkill() : void
      {
      }
   }
}

