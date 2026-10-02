package com.aurora.ui.maogoutd.resource.defender.dogBeam
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.dogBeam.DogBeamShot;
   import flash.display.FrameLabel;
   
   public class DogBeamFirstAttackFighter extends a_3953
   {
      
      public var m_iGrowTime:int = 1200;
      
      public var m_iUpgrade:int = 0;
      
      public function DogBeamFirstAttackFighter()
      {
         super();
         a_1095 = DogBeamDefine.DEFENSE_PRICE;
         a_1304 = DogBeamDefine.GetShotTypeID();
         a_1313 = true;
         a_1310 = 8;
         a_1316 = true;
         a_1317 = 1;
         a_1333 = true;
         a_1312 = 15;
         a_1338 = 5;
         a_1309 = DogBeamDefine.a_3966(m_iSkillDegree,this.m_iUpgrade);
         a_1311 = DogBeamDefine.a_3965(a_1094,this.m_iUpgrade);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DogBeamFirstAttackFighter) as DogBeamFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DogBeamFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_iUpgrade = 0;
         a_1309 = DogBeamDefine.a_3966(m_iSkillDegree,this.m_iUpgrade);
         a_1311 = DogBeamDefine.a_3965(a_1094,this.m_iUpgrade);
         this.m_iGrowTime = 1200;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return DogBeamDefine.a_3964();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      private function AddWaitShot() : Boolean
      {
         var stLastWaitShot:a_4348 = DogBeamShot.a_4344();
         if(null == stLastWaitShot)
         {
            return false;
         }
         a_1324.push(stLastWaitShot);
         return true;
      }
      
      private function LaunchShot(iXGridNo:int, iYGridNo:int, iShotSequenceNum:int, iType:int) : Boolean
      {
         var numShotXpos:Number = a_1283 ? -this.a_3955() : this.a_3955();
         var stLastWaitShot:a_4348 = a_1324.pop();
         var stStartField:a_3491 = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         if(stStartField == null)
         {
            return false;
         }
         stLastWaitShot.iShotSequenceNum = a_1322 + iShotSequenceNum;
         stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,iType);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(this.m_iGrowTime > 0)
         {
            --this.m_iGrowTime;
            if(this.m_iGrowTime == 0)
            {
               a_1275 = 5;
               this.m_iUpgrade = 2;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
               a_1309 = DogBeamDefine.a_3966(m_iSkillDegree,this.m_iUpgrade);
               a_1311 = DogBeamDefine.a_3965(a_1094,this.m_iUpgrade);
            }
            else if(this.m_iGrowTime == 600)
            {
               a_1275 = 2;
               this.m_iUpgrade = 1;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
               a_1309 = DogBeamDefine.a_3966(m_iSkillDegree,this.m_iUpgrade);
               a_1311 = DogBeamDefine.a_3965(a_1094,this.m_iUpgrade);
            }
         }
         if(a_1273 == 61)
         {
            a_1275 = 6;
         }
         if(a_1273 == 30)
         {
            a_1275 = 3;
         }
         super.a_3957(iCurrentTime);
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var i:int = 0;
         var stStartField:a_3491 = null;
         if(this.m_iUpgrade == 0)
         {
            if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
            {
               if(a_1316 && a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
               {
                  return false;
               }
               a_1321 = iCurrentTime;
               a_1323 = 0;
               if(!this.AddWaitShot())
               {
                  return false;
               }
               a_1307 = a_1273;
               if(this.m_iUpgrade == 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
               else if(this.m_iUpgrade == 1)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
               else if(this.m_iUpgrade == 2)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
            {
               if(0 == a_1323)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0);
               }
               if(a_1324.length > 0)
               {
                  ++a_1323;
               }
            }
         }
         else if(this.m_iUpgrade == 1)
         {
            if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
            {
               if(a_1316 && a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
               {
                  return false;
               }
               a_1321 = iCurrentTime;
               a_1323 = 0;
               if(!this.AddWaitShot())
               {
                  return false;
               }
               if(!this.AddWaitShot())
               {
                  return false;
               }
               a_1307 = a_1273;
               if(this.m_iUpgrade == 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
               else if(this.m_iUpgrade == 1)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
               else if(this.m_iUpgrade == 2)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
            {
               if(0 == a_1323)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0);
               }
               else if(1 == a_1323 && a_1334.m_iYGridNo > 0)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0);
               }
               if(a_1324.length > 0)
               {
                  ++a_1323;
               }
            }
         }
         else if(this.m_iUpgrade == 2)
         {
            if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
            {
               if(a_1316 && a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
               {
                  return false;
               }
               a_1321 = iCurrentTime;
               a_1323 = 0;
               if(!this.AddWaitShot())
               {
                  return false;
               }
               if(!this.AddWaitShot())
               {
                  return false;
               }
               if(a_1334.m_iYGridNo > 0)
               {
                  if(!this.AddWaitShot())
                  {
                     return false;
                  }
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  if(!this.AddWaitShot())
                  {
                     return false;
                  }
               }
               if(a_1334.m_iYGridNo > 0)
               {
                  if(!this.AddWaitShot())
                  {
                     return false;
                  }
               }
               if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  if(!this.AddWaitShot())
                  {
                     return false;
                  }
               }
               a_1307 = a_1273;
               if(this.m_iUpgrade == 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
               else if(this.m_iUpgrade == 1)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
               else if(this.m_iUpgrade == 2)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
            {
               if(0 == a_1323)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0);
               }
               else if(1 == a_1323 && a_1334.m_iYGridNo > 0)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0);
               }
               else if(2 == a_1323 && a_1334.m_iYGridNo > 0)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1,a_1323,2);
               }
               else if(3 == a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1,a_1323,3);
               }
               else if(4 == a_1323 && a_1334.m_iYGridNo > 0)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1,a_1323,2);
               }
               else if(5 == a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1,a_1323,3);
               }
               if(a_1324.length > 0)
               {
                  ++a_1323;
               }
            }
         }
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.8 * width - 36;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height;
      }
   }
}

