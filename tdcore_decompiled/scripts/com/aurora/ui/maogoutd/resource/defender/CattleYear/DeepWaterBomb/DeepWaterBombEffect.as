package com.aurora.ui.maogoutd.resource.defender.CattleYear.DeepWaterBomb
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class DeepWaterBombEffect
   {
      
      private var m_stTiemr:Timer;
      
      protected var m_vDeepWaterBombFlameVector:Vector.<DeepWaterBombFlame>;
      
      protected var a_1423:int = 0;
      
      private var m_bIsHasColumn:Boolean;
      
      public function DeepWaterBombEffect()
      {
         super();
         this.m_stTiemr = new Timer(50);
         this.m_vDeepWaterBombFlameVector = new Vector.<DeepWaterBombFlame>();
      }
      
      public static function a_3926() : DeepWaterBombEffect
      {
         return PoolManager.getInstance().CheckOutOne(DeepWaterBombEffect) as DeepWaterBombEffect;
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
         this.m_vDeepWaterBombFlameVector.splice(0,this.m_vDeepWaterBombFlameVector.length);
         for(var iXGridNo:int = 0; iXGridNo < BattleFieldView.a_1011; iXGridNo++)
         {
            this.m_vDeepWaterBombFlameVector.push(this.CreateFlame(iXGridNo,iOilBattleYPosIndex,iOilBattleXPosIndex - iXGridNo,stBattleFieldView));
         }
         if(this.IsHasColumn)
         {
            for(iYGridNo = 0; iYGridNo < BattleFieldView.a_1012; iYGridNo++)
            {
               if(iYGridNo != iOilBattleYPosIndex)
               {
                  this.m_vDeepWaterBombFlameVector.push(this.CreateFlame(iOilBattleXPosIndex,iYGridNo,iOilBattleYPosIndex - iYGridNo,stBattleFieldView));
               }
            }
         }
         this.a_1423 = 0;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.start();
         return true;
      }
      
      private function CreateFlame(iXGridNo:int, iYGridNo:int, iStartPlayTimeNum:int, stBattleFieldView:BattleFieldView) : DeepWaterBombFlame
      {
         var stDeepWaterBombFlame:DeepWaterBombFlame = null;
         stDeepWaterBombFlame = DeepWaterBombFlame.a_3926();
         stDeepWaterBombFlame.a_1797(Math.abs(iStartPlayTimeNum));
         stDeepWaterBombFlame.x = a_3491.a_1080 * iXGridNo;
         stDeepWaterBombFlame.y = a_3491.a_1080 * iYGridNo;
         stDeepWaterBombFlame.visible = false;
         stBattleFieldView.AddToBattleView(stDeepWaterBombFlame,BattleLayerDefine.EFFECTS_TOP_TYPE);
         return stDeepWaterBombFlame;
      }
      
      protected function a_3940() : Boolean
      {
         var stDeepWaterBombFlame:DeepWaterBombFlame = null;
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         for each(stDeepWaterBombFlame in this.m_vDeepWaterBombFlameVector)
         {
            stDeepWaterBombFlame.a_3940();
         }
         this.m_vDeepWaterBombFlameVector.splice(0,this.m_vDeepWaterBombFlameVector.length);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      private function a_4003(a_4730:Event) : void
      {
         var stDeepWaterBombFlame:DeepWaterBombFlame = null;
         for each(stDeepWaterBombFlame in this.m_vDeepWaterBombFlameVector)
         {
            stDeepWaterBombFlame.a_4140(this.a_1423);
         }
         if(this.a_1423 > 20)
         {
            this.a_3940();
         }
         ++this.a_1423;
      }
   }
}

