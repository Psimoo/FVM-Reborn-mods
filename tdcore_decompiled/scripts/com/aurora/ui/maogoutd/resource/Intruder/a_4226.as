package com.aurora.ui.maogoutd.resource.Intruder
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   
   public class a_4226 extends a_4206
   {
      
      private static var a_1491:Vector.<a_4226> = new Vector.<a_4226>();
      
      public function a_4226()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(a_4226) as a_4226;
      }
      
      override protected function getBindMovie() : Class
      {
         return a_4227;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = 9;
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

