package com.aurora.protocol.game
{
   import a_4717.EnmPlayerIdentBits;
   
   public class a_2729
   {
      
      public var uin:int;
      
      public var szUID:String;
      
      public var szNick:String;
      
      public var unIdentity:uint;
      
      public var nFlag:int;
      
      public var age:int;
      
      public var stFace:FaceInfo;
      
      public var iCharm:int;
      
      public var iAchievement:int;
      
      public var iBirthday:int;
      
      public var iHappyBean:int;
      
      public var szZoneInfo:String;
      
      public var iUser51Score:int;
      
      public var iUser51Level:int;
      
      public var iUser51VipScore:int;
      
      public var iUser51VIPLevel:int;
      
      public function a_2729()
      {
         super();
         this.stFace = new FaceInfo();
      }
      
      public function a_2730() : Boolean
      {
         return (this.unIdentity & EnmPlayerIdentBits.player_ident_bit_admin) != 0;
      }
      
      public function a_2731() : Boolean
      {
         return (this.unIdentity & EnmPlayerIdentBits.player_ident_bit_camera) != 0;
      }
      
      public function a_2732() : Boolean
      {
         return (this.unIdentity & EnmPlayerIdentBits.player_ident_bit_gamevip) != 0;
      }
      
      public function a_2733() : int
      {
         return this.iBirthday / 1000;
      }
      
      public function a_2734() : int
      {
         return this.iBirthday / 100 % 100;
      }
      
      public function a_2735() : int
      {
         return this.iBirthday % 100;
      }
      
      public function get eGender() : int
      {
         return this.nFlag & 3;
      }
      
      public function get bIncog() : int
      {
         return this.nFlag & 4;
      }
   }
}

