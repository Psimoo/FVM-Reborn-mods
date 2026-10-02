package com.aurora.ui.maogoutd.resource.defender.RabbitYear.CandyPot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CandyPotBoomEffect
   {
      
      private var m_stTiemr:Timer;
      
      protected var m_vCandyPotBoomFlameVector:Vector.<CandyPotBoomFlame>;
      
      private var m_arrFlameGridVector:Array;
      
      private var m_funOnFlameLight:Function;
      
      protected var a_1423:int = 0;
      
      private var m_bIsHasColumn:Boolean;
      
      public function CandyPotBoomEffect()
      {
         super();
         this.m_stTiemr = new Timer(50);
         this.m_vCandyPotBoomFlameVector = new Vector.<CandyPotBoomFlame>();
         this.m_arrFlameGridVector = [];
      }
      
      public static function a_3926() : CandyPotBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(CandyPotBoomEffect) as CandyPotBoomEffect;
      }
      
      public function get IsHasColumn() : Boolean
      {
         return this.m_bIsHasColumn;
      }
      
      public function set IsHasColumn(bIsHasColumn:Boolean) : void
      {
         this.m_bIsHasColumn = bIsHasColumn;
      }
      
      public function a_1797(iOilBattleXPosIndex:int, iOilBattleYPosIndex:int, stBattleFieldView:BattleFieldView, funOnFlameLight:Function = null) : Boolean
      {
         var iYGridNo:int = 0;
         if(iOilBattleXPosIndex < 0 || iOilBattleXPosIndex >= BattleFieldView.a_1011 || iOilBattleYPosIndex < 0 || iOilBattleYPosIndex >= BattleFieldView.a_1012)
         {
            return false;
         }
         this.m_vCandyPotBoomFlameVector.splice(0,this.m_vCandyPotBoomFlameVector.length);
         this.m_arrFlameGridVector.splice(0,this.m_arrFlameGridVector.length);
         this.m_funOnFlameLight = funOnFlameLight;
         for(var iXGridNo:int = 0; iXGridNo < BattleFieldView.a_1011; iXGridNo++)
         {
            if(iXGridNo != iOilBattleXPosIndex)
            {
               this.m_vCandyPotBoomFlameVector.push(this.CreateFlame(iXGridNo,iOilBattleYPosIndex,iOilBattleXPosIndex - iXGridNo,stBattleFieldView));
               this.m_arrFlameGridVector.push(stBattleFieldView.a_3438(iXGridNo,iOilBattleYPosIndex));
            }
         }
         if(this.IsHasColumn)
         {
            for(iYGridNo = 0; iYGridNo < BattleFieldView.a_1012; iYGridNo++)
            {
               if(iYGridNo != iOilBattleYPosIndex)
               {
                  this.m_vCandyPotBoomFlameVector.push(this.CreateFlame(iOilBattleXPosIndex,iYGridNo,iOilBattleYPosIndex - iYGridNo,stBattleFieldView));
                  this.m_arrFlameGridVector.push(stBattleFieldView.a_3438(iOilBattleXPosIndex,iYGridNo));
               }
            }
         }
         this.a_1423 = 0;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.start();
         return true;
      }
      
      private function CreateFlame(iXGridNo:int, iYGridNo:int, iStartPlayTimeNum:int, stBattleFieldView:BattleFieldView) : CandyPotBoomFlame
      {
         var stCandyPotBoomFlame:CandyPotBoomFlame = null;
         stCandyPotBoomFlame = CandyPotBoomFlame.a_3926();
         stCandyPotBoomFlame.a_1797(Math.abs(iStartPlayTimeNum));
         stCandyPotBoomFlame.x = a_3491.a_1080 * iXGridNo - 25;
         stCandyPotBoomFlame.y = a_3491.a_1080 * iYGridNo - 8;
         stCandyPotBoomFlame.visible = false;
         stBattleFieldView.AddToBattleView(stCandyPotBoomFlame,BattleLayerDefine.EFFECTS_TOP_TYPE);
         return stCandyPotBoomFlame;
      }
      
      protected function a_3940() : Boolean
      {
         var stCandyPotBoomFlame:CandyPotBoomFlame = null;
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         for each(stCandyPotBoomFlame in this.m_vCandyPotBoomFlameVector)
         {
            stCandyPotBoomFlame.a_3940();
         }
         this.m_vCandyPotBoomFlameVector.splice(0,this.m_vCandyPotBoomFlameVector.length);
         this.m_arrFlameGridVector.splice(0,this.m_arrFlameGridVector.length);
         this.m_funOnFlameLight = null;
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      private function a_4003(a_4730:Event) : void
      {
         var stCandyPotBoomFlame:CandyPotBoomFlame = null;
         for(var iIndex:int = 0; iIndex < this.m_vCandyPotBoomFlameVector.length; iIndex++)
         {
            stCandyPotBoomFlame = this.m_vCandyPotBoomFlameVector[iIndex];
            if(this.m_funOnFlameLight != null && stCandyPotBoomFlame.a_4140(this.a_1423))
            {
               this.m_funOnFlameLight(this.m_arrFlameGridVector[iIndex]);
            }
         }
         if(this.a_1423 > 20)
         {
            this.a_3940();
         }
         ++this.a_1423;
      }
   }
}

