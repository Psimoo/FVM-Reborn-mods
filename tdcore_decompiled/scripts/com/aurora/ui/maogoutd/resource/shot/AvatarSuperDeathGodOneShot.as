package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.FrameLabel;
   
   public class AvatarSuperDeathGodOneShot extends a_4348
   {
      
      private static var ms_stAvatarSuperDeathGodOneShotVector:Array = new Array();
      
      public function AvatarSuperDeathGodOneShot()
      {
         super();
         a_1279 = -width * 0;
         a_1576 = true;
         a_1281 = false;
         a_1588 = true;
         a_1275 = 1;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var _loc_1:* = ms_stAvatarSuperDeathGodOneShotVector.pop();
         if(_loc_1 == null)
         {
            _loc_1 = new AvatarSuperDeathGodOneShot();
         }
         BattleFieldView.a_1017.play();
         return _loc_1;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSuperDeathGodOneShotMovie;
      }
      
      override public function a_1797(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:BattleFieldView, param7:a_3491, param8:Boolean = false, param9:Number = 1, param10:int = 0) : Boolean
      {
         super.a_1797(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         return true;
      }
      
      override protected function a_4349() : Boolean
      {
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(ms_stAvatarSuperDeathGodOneShotVector.indexOf(this) == -1)
         {
            ms_stAvatarSuperDeathGodOneShotVector.push(this);
         }
         return true;
      }
      
      public function ForceRelease() : Boolean
      {
         return this.a_3940();
      }
      
      public function a_3973() : void
      {
         a_1275 = 1;
         gotoAndStop((a_1276[2] as FrameLabel).frame);
      }
      
      override public function a_4216(param1:int) : void
      {
         if(a_1588 && param1 % 2 == 0)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(a_1447 == 0)
         {
            a_1447 = param1;
         }
      }
   }
}

