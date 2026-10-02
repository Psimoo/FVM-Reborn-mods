package com.aurora.ui.maogoutd.resource.defender.dogSagittarius
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.DoublePeng.DoublePengShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class DogSagittariusFirstAttackFighter extends a_3953
   {
      
      public function DogSagittariusFirstAttackFighter()
      {
         super();
         a_1095 = DogSagittariusDefine.DEFENSE_PRICE;
         a_1304 = DogSagittariusDefine.GetShotTypeID();
         a_1313 = true;
         a_1316 = true;
         a_1333 = true;
         a_1310 = 8;
         a_1317 = 1;
         a_1312 = 15;
         a_1338 = 5;
         a_1309 = DogSagittariusDefine.a_3966(m_iSkillDegree);
         a_1311 = DogSagittariusDefine.a_3965(a_1094);
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DogSagittariusFirstAttackFighter) as DogSagittariusFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DogSagittariusFirstAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = DogSagittariusDefine.a_3966(m_iSkillDegree);
         a_1311 = DogSagittariusDefine.a_3965(a_1094);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return DogSagittariusDefine.a_3964();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      private function AddWaitShot() : Boolean
      {
         var stLastWaitShot:a_4348 = DoublePengShot.GetFreeDogShot2();
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
         stLastWaitShot.iShotSequenceNum = a_1322 + iShotSequenceNum;
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
            a_1321 = iCurrentTime;
            if(!this.AddWaitShot())
            {
               return false;
            }
            a_1323 = 0;
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
            a_1307 = a_1273;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 + a_1317 * a_1323 && a_1324.length > 0)
         {
            if(0 == a_1323)
            {
               this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0);
            }
            else if(1 == a_1323 && a_1334.m_iYGridNo > 0)
            {
               this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo - 1,a_1323,2);
            }
            else if(2 == a_1323 && a_1334.m_iYGridNo < BattleFieldView.a_1012 - 1)
            {
               this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo + 1,a_1323,3);
            }
            else if(3 == a_1323)
            {
               this.LaunchShot(a_1334.m_iXGridNo,a_1334.m_iYGridNo,a_1323,0);
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
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return 0.8 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 26;
      }
   }
}

