package com.aurora.ui.maogoutd.game
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.ClientLog.CDebugPane;
   import com.aurora.ui.maogoutd.b_147;
   import com.aurora.ui.maogoutd.resource.wave.a_4450;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class BattleFieldFor4View extends Sprite
   {
      
      public var m_stBackgroudBitmap:Bitmap;
      
      public var m_stBackgroudBitmapData:BitmapData;
      
      public var m_stMyBattleFieldView:BattleFieldView;
      
      public var m_stOpponentBattleFieldView:BattleFieldView;
      
      public var m_isForbidMove:Boolean = false;
      
      private var m_isDraging:Boolean = false;
      
      private var a_1009:Array = [];
      
      private var a_1010:int;
      
      public function BattleFieldFor4View()
      {
         super();
         this.m_stBackgroudBitmap = new Bitmap();
         addChildAt(this.m_stBackgroudBitmap,0);
         this.m_stMyBattleFieldView = new BattleFieldView();
         this.m_stOpponentBattleFieldView = new BattleFieldView();
         addChild(this.m_stMyBattleFieldView);
         addChild(this.m_stOpponentBattleFieldView);
         this.m_stMyBattleFieldView.m_isOwnBattleField = true;
         this.m_stMyBattleFieldView.m_stOpponentBattleFieldInstance = this.m_stOpponentBattleFieldView;
         this.m_stOpponentBattleFieldView.m_stOpponentBattleFieldInstance = this.m_stMyBattleFieldView;
         x = -85;
         addChild(CDebugPane.Get());
         CDebugPane.Get().x = 209;
         CDebugPane.Get().y = 110;
      }
      
      public function a_1797(stTDGameBattleUI:b_147) : Boolean
      {
         if(this.m_stBackgroudBitmapData)
         {
            this.m_stBackgroudBitmap.bitmapData = null;
            this.m_stBackgroudBitmapData = null;
         }
         this.m_stMyBattleFieldView.a_3432();
         this.m_stMyBattleFieldView.a_1797(-1,stTDGameBattleUI);
         this.m_stOpponentBattleFieldView.a_3432();
         this.m_stOpponentBattleFieldView.a_1797(1,stTDGameBattleUI);
         this.ResetMoveListen();
         this.a_3417(0);
         this.a_1010 = 0;
         if(null != root)
         {
            root.addEventListener("SmallMapGridClick",this.a_3420);
         }
         CDebugPane.Get().OnLog("");
         return true;
      }
      
      public function a_3415(iGameMode:int, stMapWaterWave:a_4450 = null) : Boolean
      {
         var stTempMapWaterWave:a_4450 = null;
         for each(stTempMapWaterWave in this.a_1009)
         {
            if(contains(stTempMapWaterWave))
            {
               removeChild(stTempMapWaterWave);
            }
            stTempMapWaterWave.a_3940();
         }
         this.a_1009 = [];
         this.m_stMyBattleFieldView.a_3415(iGameMode);
         this.m_stOpponentBattleFieldView.a_3415(iGameMode);
         if(1 == iGameMode)
         {
            if(null != stMapWaterWave)
            {
               stMapWaterWave.a_1797();
               stMapWaterWave.a_4332();
               stMapWaterWave.x += 355;
               stMapWaterWave.y += 252;
               addChildAt(stMapWaterWave,1);
               this.a_1009.push(stMapWaterWave);
            }
         }
         else if(2 == iGameMode)
         {
            if(null != stMapWaterWave)
            {
               stMapWaterWave.a_1797();
               stMapWaterWave.a_4332();
               stMapWaterWave.x += 358;
               stMapWaterWave.y += 225 + 0.5 * (177 - stMapWaterWave.height);
               addChildAt(stMapWaterWave,1);
               this.a_1009.push(stMapWaterWave);
            }
         }
         else if(3 == iGameMode)
         {
         }
         this.a_3419();
         return true;
      }
      
      public function a_3416(a_4730:Event) : void
      {
         ++this.a_1010;
         if(this.a_1010 % 2 == 0)
         {
         }
      }
      
      public function a_3417(iBattleFieldIndex:int) : Boolean
      {
         var iXIndex:int = int(iBattleFieldIndex % 2);
         x = -(iXIndex * 813);
         this.a_3419();
         return true;
      }
      
      public function ResetMoveListen() : void
      {
         if(!this.m_isForbidMove)
         {
            addEventListener(MouseEvent.MOUSE_DOWN,this.a_3058);
            addEventListener(MouseEvent.MOUSE_UP,this.a_3059);
         }
         else
         {
            removeEventListener(MouseEvent.MOUSE_DOWN,this.a_3058);
            removeEventListener(MouseEvent.MOUSE_UP,this.a_3059);
         }
      }
      
      override public function startDrag(lockCenter:Boolean = false, bounds:Rectangle = null) : void
      {
         super.startDrag(lockCenter,bounds);
         this.m_isDraging = true;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.a_3418);
      }
      
      override public function stopDrag() : void
      {
         super.stopDrag();
         this.a_3419();
         this.m_isDraging = false;
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.a_3418);
      }
      
      private function a_3058(a_4730:Event) : void
      {
         this.startDrag();
      }
      
      private function a_3059(a_4730:Event) : void
      {
         this.a_3419();
         this.stopDrag();
      }
      
      private function a_3418(a_4730:Event) : void
      {
         if(!this.m_isDraging)
         {
            return;
         }
         if(x > 25)
         {
            x = 25;
         }
         if(y != 0)
         {
            y = 0;
         }
         if(Boolean(stage) && x < stage.stageWidth - width - 25)
         {
            x = stage.stageWidth - width - 25;
         }
      }
      
      private function a_3419() : void
      {
         if(this.m_isForbidMove)
         {
            x = -85;
            y = 0;
            return;
         }
         if(x > -85)
         {
            x = -85;
         }
         if(y != 0)
         {
            y = 0;
         }
         if(Boolean(stage) && x < stage.stageWidth - width + 80)
         {
            x = stage.stageWidth - width + 80;
         }
      }
      
      private function a_3420(stDataEvent:a_1778) : void
      {
         var iXGridNo:int = int(stDataEvent.dataObject[0]);
         var iYGridNo:int = int(stDataEvent.dataObject[1]);
         this.a_3417(1);
      }
   }
}

