package com.aurora.ui.maogoutd.resource.defender.HorseYear.GoldRebirthOsiris.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.GameMovieClip;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class GoldOsirisGridRebirthEffect extends a_4108
   {
      
      private static const PLACE_DEFENDER_FRAME:int = 12;
      
      private var a_1334:a_3491;
      
      private var m_iDefenseGlobalID:int;
      
      private var a_1098:int;
      
      private var m_iPlaceInitialX:int;
      
      private var m_iPlaceInitialY:int;
      
      private var m_iOrigSeatID:int;
      
      private var m_iProtectBuffTime:int;
      
      private var m_bNeedPost:Boolean;
      
      public function GoldOsirisGridRebirthEffect()
      {
         super();
      }
      
      public static function a_3926(transType:int = 0) : GoldOsirisGridRebirthEffect
      {
         var bindMovie:Class = bindMovieForTrans(transType);
         return PoolManager.getInstance().CheckOutOne(GoldOsirisGridRebirthEffect,bindMovie) as GoldOsirisGridRebirthEffect;
      }
      
      private static function bindMovieForTrans(transType:int) : Class
      {
         switch(transType)
         {
            case 2:
               return GoldOsirisFourthRebirthEffectMovie;
            case 3:
               return GoldOsirisFinalRebirthEffectMovie;
            case 0:
            case 1:
         }
         return GoldOsirisBaseRebirthEffectMovie;
      }
      
      public function initData(stFieldGrid:a_3491, iDefenseGlobalID:int, iDefenseTypeID:int, iOrigSeatID:int, iProtectBuffTime:int, needPost:Boolean) : void
      {
         this.a_1334 = stFieldGrid;
         this.m_iDefenseGlobalID = iDefenseGlobalID;
         this.a_1098 = iDefenseTypeID;
         this.m_iPlaceInitialX = stFieldGrid.m_iInitialXGridNo;
         this.m_iPlaceInitialY = stFieldGrid.m_iInitialYGridNo;
         this.m_iOrigSeatID = iOrigSeatID;
         this.m_iProtectBuffTime = iProtectBuffTime;
         this.m_bNeedPost = needPost;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         var m_stMoveClip:GameMovieClip = null;
         m_stMoveClip = a_3913() as GameMovieClip;
         a_1279 = m_stMoveClip.a_1279;
         m_iYDisplayCenterPos = m_stMoveClip.m_iYDisplayCenterPos;
         super.a_1797(isReversed);
         this.addToFieldGrid(this.a_1334);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == PLACE_DEFENDER_FRAME)
         {
            this.tryPostPlaceDefender();
         }
         else if(a_1273 == a_1274 || a_1278 != null)
         {
            this.tryPostPlaceDefender();
            this.a_3940();
         }
      }
      
      private function tryPostPlaceDefender() : void
      {
         if(!this.m_bNeedPost || this.a_1098 == 0)
         {
            return;
         }
         this.m_bNeedPost = false;
         a_3962.a_1088.a_2059(this.m_iDefenseGlobalID,this.a_1098,this.m_iPlaceInitialX,this.m_iPlaceInitialY,0,2,20,0,0,this.m_iOrigSeatID,this.m_iProtectBuffTime);
      }
      
      protected function addToFieldGrid(stFieldGrid:a_3491) : Boolean
      {
         if(!stFieldGrid || !stFieldGrid.m_stCurrentBattbleFieldView)
         {
            return false;
         }
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(this);
         return true;
      }
      
      protected function removeFromFieldGrid(stFieldGrid:a_3491) : Boolean
      {
         if(!stFieldGrid || !stFieldGrid.m_stCurrentBattbleFieldView)
         {
            return false;
         }
         var stVector:Array = stFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray;
         var idx:int = stVector.indexOf(this);
         if(idx != -1)
         {
            stVector.splice(idx,1);
         }
         if(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         this.removeFromFieldGrid(this.a_1334);
         this.a_1334 = null;
         this.a_1098 = 0;
         this.m_bNeedPost = false;
         super.a_3940();
         return true;
      }
   }
}

