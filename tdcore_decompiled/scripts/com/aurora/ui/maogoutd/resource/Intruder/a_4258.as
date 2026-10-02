package com.aurora.ui.maogoutd.resource.Intruder
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class a_4258
   {
      
      private var a_1511:Array;
      
      private var a_1512:int;
      
      private var a_1513:Object;
      
      public function a_4258()
      {
         super();
         this.a_1797();
      }
      
      public function get iNextTimeNum() : int
      {
         return this.a_1512;
      }
      
      public function a_1797() : Boolean
      {
         this.a_1511 = [];
         this.a_1512 = 0;
         this.a_1513 = null;
         return true;
      }
      
      public function a_3608(pendingAddMoveIntruderVector:Vector.<a_4269>) : Boolean
      {
         var pendingIntruder:a_4269 = null;
         var iTempNextTimeNum:int = 0;
         ++BattleFieldView.ms_iServerLockStep;
         if(null == pendingAddMoveIntruderVector || pendingAddMoveIntruderVector.length <= 0)
         {
            return false;
         }
         var arrMoveIntruder:Array = [];
         for each(pendingIntruder in pendingAddMoveIntruderVector)
         {
            this.a_1511.push(pendingIntruder);
         }
         this.a_1511.sortOn("m_iAppearTime",Array.NUMERIC);
         iTempNextTimeNum = this.a_1511[0] is Array ? int((this.a_1511[0][0] as a_4269).m_iAppearTime) : int((this.a_1511[0] as a_4269).m_iAppearTime);
         if(this.a_1512 > iTempNextTimeNum)
         {
            this.a_1512 = iTempNextTimeNum;
         }
         arrMoveIntruder = null;
         return true;
      }
      
      public function a_4259(currentTimeNum:int) : Object
      {
         var m_stReturnIntruder:Object = null;
         if(this.a_1512 <= currentTimeNum && this.a_1513 != null)
         {
            m_stReturnIntruder = this.a_1513;
            this.a_1513 = null;
         }
         else if(this.a_1512 > currentTimeNum)
         {
            return null;
         }
         if(this.a_1511.length > 0)
         {
            this.a_1513 = this.a_1511.shift();
            this.a_1512 = this.a_1513 is Array ? int((this.a_1513[0] as a_4269).m_iAppearTime) : int((this.a_1513 as a_4269).m_iAppearTime);
         }
         return m_stReturnIntruder;
      }
   }
}

