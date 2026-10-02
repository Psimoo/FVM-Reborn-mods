package com.aurora.ui.maogoutd.resource.props
{
   import a_4774.a_3004;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4115;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.clearInterval;
   import flash.utils.setTimeout;
   
   public class DropStuffDisplayEffect extends Sprite
   {
      
      private var m_stStuffLoader:Loader = new Loader();
      
      private var m_iDropStaffID:int;
      
      private var m_iDripStaffSequence:int;
      
      private var m_iHideTimeOutHnd:int;
      
      public function DropStuffDisplayEffect()
      {
         super();
      }
      
      public static function a_3926() : DropStuffDisplayEffect
      {
         return PoolManager.getInstance().CheckOutOne(DropStuffDisplayEffect) as DropStuffDisplayEffect;
      }
      
      public function get iDripStaffSequence() : int
      {
         return this.m_iDripStaffSequence;
      }
      
      public function get iDropStaffID() : int
      {
         return this.m_iDropStaffID;
      }
      
      public function SetStuffID(iStuffID:int, iDripStaffSequence:int) : Boolean
      {
         if(iStuffID <= 0)
         {
            return false;
         }
         width = 45;
         height = 45;
         this.m_iDropStaffID = iStuffID;
         this.m_iDripStaffSequence = iDripStaffSequence;
         var szStuffIDStr:String = iStuffID.toString(16);
         var szUrl:String = "images/" + szStuffIDStr.charAt(0) + "/" + szStuffIDStr.charAt(1) + "/0x" + szStuffIDStr + ".png";
         a_3004.getInstance().loadFileToLoader(this.m_stStuffLoader,szUrl);
         this.m_stStuffLoader.addEventListener(Event.COMPLETE,this.OnLoadStuffComplete);
         addChild(this.m_stStuffLoader);
         this.m_iHideTimeOutHnd = setTimeout(this.a_3940,10000);
         return true;
      }
      
      public function a_3940() : Boolean
      {
         var stPickUpEffect:a_4115 = null;
         stPickUpEffect = a_4115.a_3926();
         stPickUpEffect.a_1797(false);
         stPickUpEffect.x = x + 0.5 * (width - stPickUpEffect.width);
         stPickUpEffect.y = y + 0.5 * (height - stPickUpEffect.height);
         if(parent)
         {
            parent.addChild(stPickUpEffect);
         }
         PoolManager.getInstance().CheckInOne(this);
         if(this.m_iHideTimeOutHnd > 0)
         {
            clearInterval(this.m_iHideTimeOutHnd);
            this.m_iHideTimeOutHnd = -1;
         }
         return true;
      }
      
      private function OnLoadStuffComplete(a_4730:Event) : void
      {
         width = 45;
         height = 45;
         this.m_stStuffLoader.x = 0;
         this.m_stStuffLoader.y = 0;
         this.m_stStuffLoader.width = this.width;
         this.m_stStuffLoader.height = this.height;
         addChild(this.m_stStuffLoader);
         buttonMode = true;
      }
   }
}

