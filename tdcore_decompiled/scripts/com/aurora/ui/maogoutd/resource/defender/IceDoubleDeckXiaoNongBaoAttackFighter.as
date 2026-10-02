package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class IceDoubleDeckXiaoNongBaoAttackFighter extends a_3953
   {
      
      public function IceDoubleDeckXiaoNongBaoAttackFighter()
      {
         super();
         a_1335 = 8;
         a_1095 = 225;
         a_1304 = b_183.b_185;
         a_1310 = 8;
         a_1314 = true;
         a_1317 = 6;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(IceDoubleDeckXiaoNongBaoAttackFighter) as IceDoubleDeckXiaoNongBaoAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return IceDoubleDeckXiaoNongBaoAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return 70;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
      }
   }
}

