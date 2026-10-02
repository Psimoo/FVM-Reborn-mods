package com.aurora.ui.maogoutd.resource.tools
{
   import a_4728.a_1778;
   import a_4774.a_3004;
   import com.aurora.ui.maogoutd.game.GameGuideCardIntruducePanel;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class a_4415 extends Sprite
   {
      
      private var a_1098:int;
      
      private var a_1617:Loader = new Loader();
      
      private var a_1078:Timer;
      
      private var a_1618:int;
      
      private var m_numXSpeed:Number;
      
      private var m_numYSpeed:Number;
      
      private var a_1619:int;
      
      private var a_1620:int;
      
      private var a_1621:GameGuideCardIntruducePanel;
      
      public function a_4415(iCardInfoIndex:int)
      {
         super();
         this.a_1078 = new Timer(50);
         this.a_1620 = iCardInfoIndex;
      }
      
      public function a_4416(iDefenseTypeID:uint) : Boolean
      {
         this.a_1098 = iDefenseTypeID;
         var szDefenseTypeIDStr:String = iDefenseTypeID.toString(16).toLowerCase();
         var szCardPicUrl:String = "resource/pic/0x" + "000000".substr(szDefenseTypeIDStr.length) + szDefenseTypeIDStr + ".png";
         new a_3004().loadFileToLoader(this.a_1617,szCardPicUrl);
         this.a_1617.y = 0;
         addChildAt(this.a_1617,0);
         this.a_1618 = 0;
         this.a_1078.addEventListener(TimerEvent.TIMER,this.a_4417);
         this.a_1078.start();
         return true;
      }
      
      private function a_4417(a_4730:Event) : void
      {
         var iVy:int = 0;
         ++this.a_1618;
         var iVx:int = 2;
         iVy = -10 + this.a_1618;
         x += iVx;
         y += iVy;
         if(this.a_1618 == 20)
         {
            this.a_1078.stop();
            this.a_1078.removeEventListener(TimerEvent.TIMER,this.a_4417);
            addEventListener(MouseEvent.CLICK,this.a_3076);
         }
      }
      
      private function a_3076(a_4730:Event) : void
      {
         removeEventListener(MouseEvent.CLICK,this.a_3076);
         if(null == this.a_1621)
         {
            this.a_1621 = new GameGuideCardIntruducePanel();
         }
         this.a_1621.m_stCardInfoMovie.gotoAndStop(this.a_1620);
         this.a_1621.x = x - 270;
         this.a_1621.y = y - 40;
         parent.addChildAt(this.a_1621,parent.getChildIndex(this));
         this.a_1621.visible = true;
         this.a_1621.m_stConfirmButton.addEventListener(MouseEvent.CLICK,this.a_4419);
      }
      
      private function a_4419(a_4730:Event) : void
      {
         var stRootLocalPoint:Point = null;
         this.a_1621.visible = false;
         this.a_1621.m_stConfirmButton.removeEventListener(MouseEvent.CLICK,this.a_4419);
         this.a_1618 = 0;
         this.a_1078.addEventListener(TimerEvent.TIMER,this.a_4420);
         this.a_1078.start();
         var stGlobalPoint:Point = parent.localToGlobal(new Point(x,y));
         stRootLocalPoint = root.globalToLocal(stGlobalPoint);
         x = stRootLocalPoint.x;
         y = stRootLocalPoint.y;
         (root as Sprite).addChild(this);
         var iXDistance:int = 230 - stRootLocalPoint.x;
         var iYDistance:int = 25 - stRootLocalPoint.y;
         this.a_1619 = Math.abs(iXDistance) > Math.abs(iYDistance) ? int(Math.abs(int(iXDistance / 40))) : int(Math.abs(int(iYDistance / 40)));
         this.m_numXSpeed = iXDistance / this.a_1619;
         this.m_numYSpeed = iYDistance / this.a_1619;
      }
      
      private function a_4420(a_4730:Event) : void
      {
         var stTempAurDataEvent:a_1778 = null;
         ++this.a_1618;
         x += this.m_numXSpeed;
         y += this.m_numYSpeed;
         --this.a_1619;
         if(0 >= this.a_1619)
         {
            visible = false;
            this.a_1078.removeEventListener(TimerEvent.TIMER,this.a_4420);
            this.a_1078.stop();
            if(root)
            {
               stTempAurDataEvent = new a_1778("AddGameCard");
               stTempAurDataEvent.dataObject = this.a_1098;
               root.dispatchEvent(stTempAurDataEvent);
            }
         }
      }
   }
}

