package com.aurora.ui.maogoutd.resource.defender.RabbitYear.SugarPearBomb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4139;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class SugarPearBoomEffect
   {
      
      private var m_stTiemr:Timer;
      
      protected var m_vOilBottleBoomFlameVector:Vector.<a_4139>;
      
      protected var a_1423:int = 0;
      
      private var m_bIsHasColumn:Boolean;
      
      public function SugarPearBoomEffect()
      {
         super();
         this.m_stTiemr = new Timer(50);
         this.m_vOilBottleBoomFlameVector = new Vector.<a_4139>();
      }
      
      public static function a_3926() : SugarPearBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(SugarPearBoomEffect) as SugarPearBoomEffect;
      }
      
      public function get IsHasColumn() : Boolean
      {
         return this.m_bIsHasColumn;
      }
      
      public function set IsHasColumn(bIsHasColumn:Boolean) : void
      {
         this.m_bIsHasColumn = bIsHasColumn;
      }
      
      public function a_1797(iOilBattleXPosIndex:int, iOilBattleYPosIndex:int, stBattleFieldView:BattleFieldView) : Boolean
      {
         var iYGridNo:int = 0;
         if(iOilBattleXPosIndex < 0 || iOilBattleXPosIndex >= BattleFieldView.a_1011 || iOilBattleYPosIndex < 0 || iOilBattleYPosIndex >= BattleFieldView.a_1012)
         {
            return false;
         }
         this.m_vOilBottleBoomFlameVector.splice(0,this.m_vOilBottleBoomFlameVector.length);
         for(var iXGridNo:int = iOilBattleXPosIndex - 1; iXGridNo <= iOilBattleXPosIndex + 1; iXGridNo++)
         {
            if(!(iXGridNo < 0 || iXGridNo >= BattleFieldView.a_1011))
            {
               this.m_vOilBottleBoomFlameVector.push(this.CreateFlame(iXGridNo,iOilBattleYPosIndex,iOilBattleXPosIndex - iXGridNo,stBattleFieldView));
            }
         }
         if(this.IsHasColumn)
         {
            for(iYGridNo = iOilBattleYPosIndex - 1; iYGridNo <= iOilBattleYPosIndex + 1; iYGridNo++)
            {
               if(!(iYGridNo == iOilBattleYPosIndex || iYGridNo < 0 || iYGridNo >= BattleFieldView.a_1012))
               {
                  this.m_vOilBottleBoomFlameVector.push(this.CreateFlame(iOilBattleXPosIndex,iYGridNo,iOilBattleYPosIndex - iYGridNo,stBattleFieldView));
               }
            }
         }
         this.a_1423 = 0;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.start();
         return true;
      }
      
      private function CreateFlame(iXGridNo:int, iYGridNo:int, iStartPlayTimeNum:int, stBattleFieldView:BattleFieldView) : a_4139
      {
         var stOilBottleBoomFlame:a_4139 = null;
         stOilBottleBoomFlame = a_4139.a_3926();
         stOilBottleBoomFlame.a_1797(Math.abs(iStartPlayTimeNum));
         stOilBottleBoomFlame.x = a_3491.a_1080 * iXGridNo;
         stOilBottleBoomFlame.y = a_3491.a_1080 * iYGridNo;
         stOilBottleBoomFlame.visible = false;
         stBattleFieldView.AddToBattleView(stOilBottleBoomFlame,BattleLayerDefine.EFFECTS_TOP_TYPE);
         return stOilBottleBoomFlame;
      }
      
      protected function a_3940() : Boolean
      {
         var stOilBottleBoomFlame:a_4139 = null;
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         for each(stOilBottleBoomFlame in this.m_vOilBottleBoomFlameVector)
         {
            stOilBottleBoomFlame.a_3940();
         }
         this.m_vOilBottleBoomFlameVector.splice(0,this.m_vOilBottleBoomFlameVector.length);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      private function a_4003(a_4730:Event) : void
      {
         var stOilBottleBoomFlame:a_4139 = null;
         for each(stOilBottleBoomFlame in this.m_vOilBottleBoomFlameVector)
         {
            stOilBottleBoomFlame.a_4140(this.a_1423);
         }
         if(this.a_1423 > 20)
         {
            this.a_3940();
         }
         ++this.a_1423;
      }
   }
}

