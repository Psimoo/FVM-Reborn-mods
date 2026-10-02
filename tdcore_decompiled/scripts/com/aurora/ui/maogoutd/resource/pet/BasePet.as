package com.aurora.ui.maogoutd.resource.pet
{
   import a_4715.EncrypIntEx;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BasePet extends a_3909
   {
      
      public var m_stBattleFieldView:BattleFieldView;
      
      public var m_stBaseAvatar:a_3924;
      
      public var a_1334:a_3491;
      
      public var m_iSkillDegree:int = 0;
      
      public var a_1094:int = 0;
      
      protected var a_1304:uint = 0;
      
      protected var a_1307:int = 0;
      
      protected var a_1308:int = 20;
      
      protected var a_1309:int = 26;
      
      protected var a_1310:int = 16;
      
      protected var a_1311:int = 40;
      
      protected var a_1312:int = 10;
      
      protected var a_1313:Boolean = false;
      
      protected var a_1314:Boolean = false;
      
      protected var a_1318:Boolean = false;
      
      protected var a_1315:Boolean = false;
      
      protected var a_1316:Boolean = false;
      
      protected var m_isFiveRowShot:Boolean = false;
      
      protected var a_1317:int = 2;
      
      protected var a_1321:int = 0;
      
      protected var a_1322:int = 0;
      
      protected var a_1323:int;
      
      protected var a_1324:Array = [];
      
      private var m_iLastShotTime:EncrypIntEx = new EncrypIntEx();
      
      public function BasePet()
      {
         super();
      }
      
      public function a_1797() : Boolean
      {
         if(this.a_1334 == null)
         {
            return false;
         }
         if(this.a_1334.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
         {
            a_1283 = true;
         }
         else
         {
            a_1283 = false;
         }
         gotoAndStop(1);
         a_1275 = 0;
         a_1282 = false;
         if(!a_1283)
         {
            x = this.a_1334.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) / 2 - 40;
         }
         else
         {
            x = BattleFieldView.a_1013 - (this.a_1334.m_iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - width) / 2 - 30);
         }
         y = this.a_1334.m_iYGridNo * a_3491.a_1081 + (a_3491.a_1081 - height) + 25 - 8;
         y -= stDisplayBitmap.y;
         var _loc_1:* = this.m_stBattleFieldView.a_3440(this.a_1334.m_iYGridNo);
         this.m_stBattleFieldView.AddToBattleView(this,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1334);
         this.a_1321 = 0;
         this.a_1311 = this.a_3965();
         this.a_1309 = 26 - this.a_3966();
         this.m_iLastShotTime.Value = 0;
         return true;
      }
      
      public function a_4330() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         gotoAndStop(1);
         return true;
      }
      
      public function OnTimeInterval(stFieldRowIntruderStatusArray:uint) : void
      {
         if(this.a_1313 || this.m_stBattleFieldView.stFieldRowIntruderStatusArray[this.a_1334.m_iYGridNo] > 0)
         {
            this.a_3954(stFieldRowIntruderStatusArray);
         }
         if(stFieldRowIntruderStatusArray % 2 == 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
            if(a_1273 == a_1274)
            {
               gotoAndStop(1);
            }
         }
      }
      
      public function a_3954(iCurrentTime:int) : Boolean
      {
         var stBasePet:BasePet = null;
         var _loc_7:int = 0;
         var stBaseShot:a_4348 = null;
         var _loc_3:Number = NaN;
         var _loc_4:int = 0;
         var _loc_5:a_3491 = null;
         if(iCurrentTime > this.a_1308 && iCurrentTime >= this.a_1321 + this.a_1309)
         {
            if(this.a_1316 && this.a_1334.m_stCurrentBattbleFieldView.a_3430(this.a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            if(this.m_isFiveRowShot && this.a_1334.m_stCurrentBattbleFieldView.GetFieldRowIntruderNumForFiveRow(this.a_1334.m_iYGridNo) <= 0)
            {
               return true;
            }
            this.a_1321 = iCurrentTime;
            stBaseShot = this.a_4389();
            if(stBaseShot == null)
            {
               return false;
            }
            this.a_1323 = 1;
            this.a_1324.push(stBaseShot);
            if(this.a_1314)
            {
               stBaseShot = this.a_4389();
               if(stBaseShot == null)
               {
                  return false;
               }
               this.a_1324.push(stBaseShot);
            }
            else if(this.a_1316)
            {
               if(this.a_1334.m_iYGridNo > 0)
               {
                  stBaseShot = this.a_4389();
                  if(stBaseShot == null)
                  {
                     return false;
                  }
                  this.a_1324.push(stBaseShot);
               }
               if(this.a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  stBaseShot = this.a_4389();
                  if(stBaseShot == null)
                  {
                     return false;
                  }
                  this.a_1324.push(stBaseShot);
               }
            }
            else if(this.m_isFiveRowShot)
            {
               if(this.a_1334.m_iYGridNo > 0)
               {
                  stBaseShot = this.a_4389();
                  if(stBaseShot == null)
                  {
                     return false;
                  }
                  this.a_1324.push(stBaseShot);
               }
               if(this.a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  stBaseShot = this.a_4389();
                  if(stBaseShot == null)
                  {
                     return false;
                  }
                  this.a_1324.push(stBaseShot);
               }
               if(this.a_1334.m_iYGridNo > 1)
               {
                  stBaseShot = this.a_4389();
                  if(stBaseShot == null)
                  {
                     return false;
                  }
                  this.a_1324.push(stBaseShot);
               }
               if(this.a_1334.m_iYGridNo < BattleFieldView.a_1012 - 2)
               {
                  stBaseShot = this.a_4389();
                  if(stBaseShot == null)
                  {
                     return false;
                  }
                  this.a_1324.push(stBaseShot);
               }
            }
            else if(this.a_1318)
            {
               _loc_4 = 0;
               while(_loc_4 < 2)
               {
                  stBaseShot = this.a_4389();
                  if(stBaseShot == null)
                  {
                     return false;
                  }
                  this.a_1324.push(stBaseShot);
                  _loc_4++;
               }
            }
            else if(this.a_1315)
            {
               _loc_4 = 0;
               while(true)
               {
                  if(_loc_4 < 3)
                  {
                     stBaseShot = this.a_4389();
                     if(stBaseShot == null)
                     {
                        break;
                     }
                     this.a_1324.push(stBaseShot);
                     _loc_4++;
                     continue;
                  }
               }
               return false;
            }
            if(stBaseShot)
            {
               if(this.m_iLastShotTime.Value > 0 && iCurrentTime < this.m_iLastShotTime.Value + this.a_1309)
               {
               }
               this.m_iLastShotTime.Value = iCurrentTime;
            }
            this.a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - this.a_1321 == this.a_1310 && this.a_1324.length > 0)
         {
            _loc_3 = this.a_3955();
            if(a_1283)
            {
               _loc_3 = -_loc_3;
            }
            stBaseShot = this.a_1324.pop();
            stBaseShot.iShotSequenceNum = this.a_1322;
            stBaseShot.a_1797(0,this.a_1312,this.a_1311,x + _loc_3,y + this.a_3956(),this.a_1334.m_stCurrentBattbleFieldView,this.a_1334);
            this.m_stBattleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1334);
         }
         if(this.a_1314 && iCurrentTime - this.a_1321 == this.a_1310 + this.a_1317 && this.a_1324.length > 0)
         {
            _loc_3 = this.a_3955();
            if(a_1283)
            {
               _loc_3 = -_loc_3;
            }
            stBaseShot = this.a_1324.pop();
            stBaseShot.iShotSequenceNum = 1;
            stBaseShot.a_1797(0,this.a_1312,this.a_1311,x + _loc_3,y + this.a_3956(),this.a_1334.m_stCurrentBattbleFieldView,this.a_1334);
            this.m_stBattleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1334);
         }
         if(this.a_1316 && iCurrentTime - this.a_1321 == this.a_1310 + this.a_1317 * this.a_1323 && this.a_1324.length > 0)
         {
            _loc_3 = this.a_3955();
            if(a_1283)
            {
               _loc_3 = -_loc_3;
            }
            if(this.a_1323 == 1 && this.a_1334.m_iYGridNo > 0)
            {
               stBaseShot = this.a_1324.pop();
               _loc_5 = this.a_1334.m_stCurrentBattbleFieldView.a_3438(this.a_1334.m_iXGridNo,this.a_1334.m_iYGridNo - 1);
               stBaseShot.iShotSequenceNum = this.a_1323;
               stBaseShot.a_1797(0,this.a_1312,this.a_1311,x + _loc_3,y + this.a_3956() - 5,this.a_1334.m_stCurrentBattbleFieldView,_loc_5,false,1,2);
               this.m_stBattleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1334);
            }
            else if(this.a_1323 == 2 && this.a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               stBaseShot = this.a_1324.pop();
               _loc_5 = this.a_1334.m_stCurrentBattbleFieldView.a_3438(this.a_1334.m_iXGridNo,this.a_1334.m_iYGridNo + 1);
               stBaseShot.iShotSequenceNum = this.a_1323;
               stBaseShot.a_1797(0,this.a_1312,this.a_1311,x + _loc_3,y + this.a_3956() + 5,this.a_1334.m_stCurrentBattbleFieldView,_loc_5,false,1,3);
               this.m_stBattleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1334);
            }
            if(this.a_1324.length > 0)
            {
               stBasePet = this;
               _loc_7 = this.a_1323 + 1;
               stBasePet.a_1323 = _loc_7;
            }
         }
         if(this.m_isFiveRowShot && iCurrentTime - this.a_1321 == this.a_1310 + this.a_1317 * this.a_1323 && this.a_1324.length > 0)
         {
            _loc_3 = this.a_3955();
            if(a_1283)
            {
               _loc_3 = -_loc_3;
            }
            if(this.a_1323 == 1 && this.a_1334.m_iYGridNo > 0)
            {
               stBaseShot = this.a_1324.pop();
               _loc_5 = this.a_1334.m_stCurrentBattbleFieldView.a_3438(this.a_1334.m_iXGridNo,this.a_1334.m_iYGridNo - 1);
               stBaseShot.iShotSequenceNum = this.a_1323;
               stBaseShot.a_1797(0,this.a_1312,this.a_1311,x + _loc_3,y + this.a_3956() - 5,this.a_1334.m_stCurrentBattbleFieldView,_loc_5,false,1,2);
               this.m_stBattleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1334);
            }
            else if(this.a_1323 == 2 && this.a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               stBaseShot = this.a_1324.pop();
               _loc_5 = this.a_1334.m_stCurrentBattbleFieldView.a_3438(this.a_1334.m_iXGridNo,this.a_1334.m_iYGridNo + 1);
               stBaseShot.iShotSequenceNum = this.a_1323;
               stBaseShot.a_1797(0,this.a_1312,this.a_1311,x + _loc_3,y + this.a_3956() + 5,this.a_1334.m_stCurrentBattbleFieldView,_loc_5,false,1,3);
               this.m_stBattleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1334);
            }
            if(this.a_1323 == 3 && this.a_1334.m_iYGridNo > 1)
            {
               stBaseShot = this.a_1324.pop();
               _loc_5 = this.a_1334.m_stCurrentBattbleFieldView.a_3438(this.a_1334.m_iXGridNo,this.a_1334.m_iYGridNo - 2);
               stBaseShot.iShotSequenceNum = this.a_1323;
               stBaseShot.a_1797(0,this.a_1312,this.a_1311,x + _loc_3,y + this.a_3956() - 5,this.a_1334.m_stCurrentBattbleFieldView,_loc_5,false,1,6);
               this.m_stBattleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1334);
            }
            else if(this.a_1323 == 4 && this.a_1334.m_iYGridNo < BattleFieldView.a_1012 - 2)
            {
               stBaseShot = this.a_1324.pop();
               _loc_5 = this.a_1334.m_stCurrentBattbleFieldView.a_3438(this.a_1334.m_iXGridNo,this.a_1334.m_iYGridNo + 2);
               stBaseShot.iShotSequenceNum = this.a_1323;
               stBaseShot.a_1797(0,this.a_1312,this.a_1311,x + _loc_3,y + this.a_3956() + 5,this.a_1334.m_stCurrentBattbleFieldView,_loc_5,false,1,7);
               this.m_stBattleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1334);
            }
            if(this.a_1324.length > 0)
            {
               _loc_7 = this.a_1323 + 1;
               stBasePet.a_1323 = _loc_7;
            }
         }
         if(this.a_1315 && iCurrentTime - this.a_1321 == this.a_1310 + this.a_1317 * this.a_1323 && this.a_1324.length > 0)
         {
            _loc_3 = this.a_3955();
            if(a_1283)
            {
               _loc_3 = -_loc_3;
            }
            stBaseShot = this.a_1324.pop();
            stBaseShot.iShotSequenceNum = this.a_1323;
            stBaseShot.a_1797(0,this.a_1312,this.a_1311,x + _loc_3,y + this.a_3956(),this.a_1334.m_stCurrentBattbleFieldView,this.a_1334);
            this.m_stBattleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1334);
            if(this.a_1324.length > 0)
            {
               _loc_7 = this.a_1323 + 1;
               stBasePet.a_1323 = _loc_7;
            }
         }
         if(this.a_1318 && iCurrentTime - this.a_1321 == this.a_1310 + this.a_1317 * this.a_1323 && this.a_1324.length > 0)
         {
            _loc_3 = this.a_3955();
            if(a_1283)
            {
               _loc_3 = -_loc_3;
            }
            _loc_3 = width - _loc_3;
            stBaseShot = this.a_1324.pop();
            stBaseShot.iShotSequenceNum = this.a_1323;
            stBaseShot.a_1797(0,this.a_1312,this.a_1311,x + _loc_3,y + this.a_3956() + 10,this.a_1334.m_stCurrentBattbleFieldView,this.a_1334,true);
            this.m_stBattleFieldView.AddToBattleView(stBaseShot,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,this.a_1334);
            if(this.a_1324.length > 0)
            {
               _loc_7 = this.a_1323 + 1;
               stBasePet.a_1323 = _loc_7;
            }
         }
         return true;
      }
      
      protected function a_4389() : a_4348
      {
         return null;
      }
      
      protected function a_3955() : Number
      {
         return width * 0.8;
      }
      
      protected function a_3956() : Number
      {
         return 0.25 * height;
      }
      
      protected function a_3965() : int
      {
         var _loc_1:int = 18;
         if(this.a_1094 == 1)
         {
            _loc_1 = 18;
         }
         else if(this.a_1094 == 2)
         {
            _loc_1 = 20;
         }
         else if(this.a_1094 == 3)
         {
            _loc_1 = 22;
         }
         else if(this.a_1094 == 4)
         {
            _loc_1 = 26;
         }
         else if(this.a_1094 == 5)
         {
            _loc_1 = 32;
         }
         else if(this.a_1094 == 6)
         {
            _loc_1 = 40;
         }
         else if(this.a_1094 == 7)
         {
            _loc_1 = 55;
         }
         else if(this.a_1094 == 8)
         {
            _loc_1 = 70;
         }
         else if(this.a_1094 == 9)
         {
            _loc_1 = 85;
         }
         else if(this.a_1094 >= 10)
         {
            _loc_1 = 100;
         }
         return _loc_1;
      }
      
      protected function a_3966() : int
      {
         return 1 * this.m_iSkillDegree;
      }
   }
}

