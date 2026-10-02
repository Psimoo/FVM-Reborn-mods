package com.aurora.ui.maogoutd.resource.defender.TigerYear.WhirlTiger
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.dogChief.DogChiePoisonGasShot;
   import com.aurora.ui.maogoutd.resource.defender.dogChief.DogChiefSecondShotMovie;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.tools.a_4425;
   import flash.display.FrameLabel;
   
   public class WhirlTigerSecondShot extends a_4348
   {
      
      protected var a_1351:Array;
      
      private var ReleaseGas:Boolean;
      
      public function WhirlTigerSecondShot()
      {
         super();
         this.a_1351 = [];
         a_1279 = 0;
         a_1573 = 1;
         a_1576 = true;
         a_1577 = false;
         a_1575 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
         this.ReleaseGas = false;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(WhirlTigerSecondShot) as WhirlTigerSecondShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return DogChiefSecondShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         this.a_1351 = [];
         super.a_3940();
         this.ReleaseGas = false;
         return true;
      }
      
      override public function a_4216(param1:int) : void
      {
         var _loc_2:a_4206 = null;
         var _loc_7:a_4425 = null;
         _loc_2 = null;
         var _loc_3:int = 0;
         var _loc_6:Array = null;
         _loc_7 = null;
         if(param1 % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         x += m_numXSpeed;
         if(!a_1283 && x > BattleFieldView.a_1013 || a_1283 && x < 0)
         {
            this.a_3940();
            return;
         }
         if(!a_1283)
         {
            _loc_3 = int((x + width) / a_3491.a_1080);
         }
         else
         {
            _loc_3 = BattleFieldView.a_1011 - 1 - int((x - width) / a_3491.a_1080);
         }
         var _loc_4:* = a_1583.a_3438(_loc_3,m_iYGridNo);
         var _loc_5:* = a_1583.a_3438(_loc_3 - 1,m_iYGridNo);
         if(_loc_3 == 6 && !this.ReleaseGas)
         {
            this.RealeasePoisonShot();
         }
         if(_loc_4)
         {
            _loc_6 = _loc_4.a_1511.slice();
            for each(_loc_2 in _loc_6)
            {
               if(_loc_2.visible && hitTestObject(_loc_2) && this.a_1351.indexOf(_loc_2) == -1)
               {
                  if(_loc_2.iSpaceState == 0)
                  {
                     _loc_7 = a_4425.a_3926();
                     _loc_7.a_1797(_loc_2.stDisplayBitmap.bitmapData.clone(),a_1283);
                     _loc_7.x = _loc_2.x;
                     _loc_7.y = _loc_2.y;
                     parent.addChild(_loc_7);
                  }
                  _loc_2.a_4212();
                  if(_loc_2.visible)
                  {
                     this.a_1351.push(_loc_2);
                  }
               }
            }
         }
         if(_loc_5)
         {
            _loc_6 = _loc_5.a_1511.slice();
            for each(_loc_2 in _loc_6)
            {
               if(_loc_2.visible && hitTestObject(_loc_2) && this.a_1351.indexOf(_loc_2) == -1)
               {
                  if(_loc_2.iSpaceState == 0)
                  {
                     _loc_7 = a_4425.a_3926();
                     _loc_7.a_1797(_loc_2.stDisplayBitmap.bitmapData.clone(),a_1283);
                     _loc_7.x = _loc_2.x;
                     _loc_7.y = _loc_2.y;
                     parent.addChild(_loc_7);
                  }
                  _loc_2.a_4212();
                  if(_loc_2.visible)
                  {
                     this.a_1351.push(_loc_2);
                  }
               }
            }
         }
      }
      
      private function RealeasePoisonShot() : void
      {
         var stFieldGrid:a_3491 = null;
         var stPoisonShot:DogChiePoisonGasShot = null;
         var iPosX:int = 0;
         var iPosY:int = 0;
         for(var i:int = 6; i < 9; i++)
         {
            stFieldGrid = a_1583.a_3438(i,m_iYGridNo);
            stPoisonShot = DogChiePoisonGasShot.a_4344() as DogChiePoisonGasShot;
            if(stPoisonShot)
            {
               stPoisonShot.iShotSequenceNum = 0;
               iPosX = (stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080;
               iPosY = stFieldGrid.m_iYGridNo * a_3491.a_1081 - 5;
               stPoisonShot.a_1797(0,0,150,iPosX,iPosY,stFieldGrid.m_stCurrentBattbleFieldView,stFieldGrid);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stPoisonShot,BattleLayerDefine.EFFECT_LAYER_TRAY_BOTTOM_TYPE,stFieldGrid);
            }
         }
      }
   }
}

