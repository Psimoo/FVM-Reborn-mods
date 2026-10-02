package com.aurora.ui.maogoutd.resource.defender.goldSagittarius
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.goldSagittarius.GoldSagittariusFinalShot;
   import flash.display.FrameLabel;
   
   public class GoldSagittariusThirdAttackFighter extends a_3953
   {
      
      private var m_iShotPieceNum:int = 0;
      
      private var iFlag:int = 0;
      
      public function GoldSagittariusThirdAttackFighter()
      {
         super();
         a_1095 = GoldSagittariusDefine.DEFENSE_PRICE;
         a_1304 = GoldSagittariusDefine.GetShotTypeID();
         a_1313 = true;
         a_1316 = true;
         a_1333 = true;
         a_1096 = false;
         a_1310 = 0;
         a_1317 = 1;
         a_1312 = 15;
         a_1338 = 5;
         a_1309 = GoldSagittariusDefine.a_3966(m_iSkillDegree);
         a_1311 = GoldSagittariusDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(GoldSagittariusThirdAttackFighter) as GoldSagittariusThirdAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldSagittariusThirdAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_iShotPieceNum = 0;
         this.iFlag = 0;
         a_1309 = GoldSagittariusDefine.a_3966(m_iSkillDegree);
         a_1311 = GoldSagittariusDefine.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return GoldSagittariusDefine.a_3964();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      private function AddWaitShot(type:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         if(type % 2 != 0)
         {
            stLastWaitShot = GoldSagittariusFinalShot.a_4344();
            GoldSagittariusFinalShot(stLastWaitShot).stPenetrate = true;
         }
         else
         {
            stLastWaitShot = GoldSagittariusFinalShot.a_4344();
            GoldSagittariusFinalShot(stLastWaitShot).stPenetrate = false;
         }
         if(null == stLastWaitShot)
         {
            return false;
         }
         a_1324.push(stLastWaitShot);
         return true;
      }
      
      private function LaunchShot(iXGridNo:int, iYGridNo:int, iShotSequenceNum:int, iType:int, iSeq:int, iCurrentTime:int) : Boolean
      {
         var stStartField:a_3491 = null;
         var numShotXpos:Number = a_1283 ? -this.a_3955() : this.a_3955();
         var stLastWaitShot:a_4348 = a_1324.pop();
         stStartField = a_1334.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         var index:int = 0;
         if(iShotSequenceNum == 0)
         {
            index = 1;
         }
         stLastWaitShot.iShotSequenceNum = a_1322 + iShotSequenceNum;
         stLastWaitShot.ms_iCritFrameLable = index;
         stLastWaitShot.a_1797(0,a_1312,a_1311,x + numShotXpos,y + this.a_3956(),a_1334.m_stCurrentBattbleFieldView,stStartField,false,1,iType);
         parent.addChildAt(stLastWaitShot,a_1334.m_stCurrentBattbleFieldView.a_3433());
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var i:int = 0;
         var stStartField:a_3491 = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            if(a_1316 && a_1334.m_stCurrentBattbleFieldView.a_3430(a_1334.m_iYGridNo) <= 0)
            {
               return false;
            }
            while(a_1324.length > 0)
            {
               stLastWaitShot = a_1324.pop();
               stLastWaitShot.a_4350();
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            this.iFlag = this.m_iShotPieceNum % 4 == 0 ? 1 : 0;
            if(this.iFlag == 1)
            {
               if(!this.AddWaitShot(1))
               {
                  return false;
               }
               if(!this.AddWaitShot(1))
               {
                  return false;
               }
            }
            if(!this.AddWaitShot(2))
            {
               return false;
            }
            if(!this.AddWaitShot(2))
            {
               return false;
            }
            if(!this.AddWaitShot(2))
            {
               return false;
            }
            if(a_1334.m_iYGridNo > 0)
            {
               if(!this.AddWaitShot(2))
               {
                  return false;
               }
               if(!this.AddWaitShot(2))
               {
                  return false;
               }
               if(!this.AddWaitShot(2))
               {
                  return false;
               }
            }
            if(a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               if(!this.AddWaitShot(2))
               {
                  return false;
               }
               if(!this.AddWaitShot(2))
               {
                  return false;
               }
               if(!this.AddWaitShot(2))
               {
                  return false;
               }
            }
            a_1324.reverse();
            a_1307 = a_1273;
            this.m_iShotPieceNum += 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            if(this.iFlag == 1)
            {
               if(0 == a_1323 && a_1334.m_iYGridNo > 0)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1,a_1323,2,1,iCurrentTime);
               }
               else if(1 == a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1,a_1323,3,2,iCurrentTime);
               }
               else if(2 == a_1323)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,0,0,0,iCurrentTime);
               }
               else if(3 == a_1323 && a_1334.m_iYGridNo > 0)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1,a_1323,2,1,iCurrentTime);
               }
               else if(4 == a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1,a_1323,3,2,iCurrentTime);
               }
               else if(5 == a_1323)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0,3,iCurrentTime);
               }
               else if(6 == a_1323 && a_1334.m_iYGridNo > 0)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1,a_1323,2,4,iCurrentTime);
               }
               else if(7 == a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1,a_1323,3,5,iCurrentTime);
               }
               else if(8 == a_1323)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0,6,iCurrentTime);
               }
               else if(9 == a_1323 && a_1334.m_iYGridNo > 0)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1,a_1323,2,7,iCurrentTime);
               }
               else if(10 == a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1,a_1323,3,8,iCurrentTime);
               }
               if(a_1324.length > 0)
               {
                  ++a_1323;
               }
            }
            else
            {
               if(0 == a_1323)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0,0,iCurrentTime);
               }
               else if(1 == a_1323 && a_1334.m_iYGridNo > 0)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1,a_1323,2,1,iCurrentTime);
               }
               else if(2 == a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1,a_1323,3,2,iCurrentTime);
               }
               else if(3 == a_1323)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0,3,iCurrentTime);
               }
               else if(4 == a_1323 && a_1334.m_iYGridNo > 0)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1,a_1323,2,4,iCurrentTime);
               }
               else if(5 == a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1,a_1323,3,5,iCurrentTime);
               }
               else if(6 == a_1323)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0,6,iCurrentTime);
               }
               else if(7 == a_1323 && a_1334.m_iYGridNo > 0)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1,a_1323,2,7,iCurrentTime);
               }
               else if(8 == a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
               {
                  this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1,a_1323,3,8,iCurrentTime);
               }
               if(a_1324.length > 0)
               {
                  ++a_1323;
               }
            }
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         this.m_iShotPieceNum = 0;
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.8 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 12;
      }
   }
}

