package com.aurora.ui.maogoutd.resource.shot.goldLibra
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4139;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GoldLibraBothBoomEffect
   {
      
      private var m_stTiemr:Timer;
      
      protected var m_vOilBottleBoomFlameVector:Vector.<a_4139>;
      
      protected var a_1423:int = 0;
      
      private var m_bIsHasColumn:Boolean;
      
      public function GoldLibraBothBoomEffect()
      {
         super();
         this.m_stTiemr = new Timer(50);
         this.m_vOilBottleBoomFlameVector = new Vector.<a_4139>();
      }
      
      public static function a_3926() : GoldLibraBothBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(GoldLibraBothBoomEffect) as GoldLibraBothBoomEffect;
      }
      
      public function get IsHasColumn() : Boolean
      {
         return this.m_bIsHasColumn;
      }
      
      public function set IsHasColumn(bIsHasColumn:Boolean) : void
      {
         this.m_bIsHasColumn = bIsHasColumn;
      }
      
      public function a_1797(stFieldGrid:a_3491, stBattleFieldView:BattleFieldView) : Boolean
      {
         if(stFieldGrid.m_iXGridNo < 0 || stFieldGrid.m_iXGridNo >= BattleFieldView.a_1011 || stFieldGrid.m_iYGridNo < 0 || stFieldGrid.m_iYGridNo >= BattleFieldView.a_1012)
         {
            return false;
         }
         this.m_vOilBottleBoomFlameVector.splice(0,this.m_vOilBottleBoomFlameVector.length);
         var yStart:int = stFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(stFieldGrid.m_iYGridNo - 1);
         var xStart:int = stFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(stFieldGrid.m_iXGridNo - 1);
         var yEnd:int = stFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(stFieldGrid.m_iYGridNo + 1);
         var xEnd:int = stFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(stFieldGrid.m_iXGridNo + 1);
         for(var xIndex:int = xStart; xIndex <= xEnd; xIndex++)
         {
            this.m_vOilBottleBoomFlameVector.push(this.CreateFlame(xIndex,stFieldGrid.m_iYGridNo,xIndex - stFieldGrid.m_iXGridNo,stBattleFieldView));
         }
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            this.m_vOilBottleBoomFlameVector.push(this.CreateFlame(stFieldGrid.m_iXGridNo,yIndex,yIndex - stFieldGrid.m_iYGridNo,stBattleFieldView));
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

