package com.aurora.ui.maogoutd.resource.defender.HorseYear.macaron
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class MacaronNormalAttackFighter extends a_3953
   {
      
      public var trans:int = 1;
      
      public var targetGrid:a_3491;
      
      private var stTempPosition:Point;
      
      public function MacaronNormalAttackFighter()
      {
         super();
         a_1095 = MacaronDefence.DEFENSE_PRICE;
         a_1313 = true;
         a_1310 = 11;
         a_1317 = 6;
         a_1333 = true;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = MacaronDefence.a_3966(m_iSkillDegree);
         a_1311 = MacaronDefence.a_3965(a_1094);
         this.targetGrid = null;
         return true;
      }
      
      override protected function a_3964() : int
      {
         return MacaronDefence.a_3964(a_1094);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:a_4348 = null;
         var numShotXpos:Number = NaN;
         var i:int = 0;
         var shot:MacaronNormalShot = null;
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && iCurrentTime >= a_1321 + a_1309)
         {
            this.targetGrid = this.GetFieldIntruderNumForAheadDirection(a_1334,this.trans);
            if(this.targetGrid == null)
            {
               return true;
            }
            a_1321 = iCurrentTime;
            a_1323 = 0;
            a_1307 = 1;
            a_1275 = 0;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - a_1321 == a_1310 && this.targetGrid != null)
         {
            if(this.trans == 1)
            {
               shot = MacaronBaseShot.a_4344();
            }
            else if(this.trans == 2)
            {
               shot = MacaronFirstShot.a_4344();
            }
            else
            {
               shot = MacaronSecondShot.a_4344();
            }
            shot.a_1598 = this.targetGrid;
            shot.a_1797(0,a_1312,a_1311,x,y - 50,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.SHOT_TYPE,a_1334);
            shot.InitData(this.trans);
            this.targetGrid = null;
         }
         return true;
      }
      
      private function GetShotMovieClip() : Class
      {
         if(this.trans == 1)
         {
            return MacaronBaseTopEffectMovie;
         }
         if(this.trans == 2)
         {
            return MacaronFirstTopEffectMovie;
         }
         return MacaronSecondTopEffectMovie;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            if(a_1278 == null)
            {
               a_1278 = "待机";
            }
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return 0.9 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.3 * height + 25;
      }
      
      override protected function a_3966() : int
      {
         return 5 * m_iSkillDegree;
      }
      
      private function GetFieldIntruderNumForAheadDirection(stFieldGrid:a_3491, trans:int) : a_3491
      {
         var yOffset:int = 0;
         var targetY:int = 0;
         var targetFieldGrid:a_3491 = null;
         var intruder:a_4206 = null;
         if(stFieldGrid == null || stFieldGrid.m_stCurrentBattbleFieldView == null)
         {
            return null;
         }
         var yRange:int = 1;
         if(trans == 3)
         {
            yRange = 2;
         }
         var battleFieldView:BattleFieldView = stFieldGrid.m_stCurrentBattbleFieldView;
         var stRowIntruderArray:Array = [];
         this.stTempPosition = new Point((stFieldGrid.m_iXGridNo + 0.5) * a_3491.a_1080,(stFieldGrid.m_iYGridNo + 0.5) * a_3491.a_1081 - 28);
         for(var x:int = 0; x < BattleFieldView.a_1011; x++)
         {
            for(yOffset = -yRange; yOffset <= yRange; yOffset++)
            {
               targetY = stFieldGrid.m_iYGridNo + yOffset;
               targetFieldGrid = battleFieldView.a_3438(x,targetY);
               if(targetFieldGrid != null)
               {
                  for each(intruder in targetFieldGrid.a_1511)
                  {
                     if(intruder.iLifeValue > 0)
                     {
                        if(trans == 1)
                        {
                           if(intruder.iSpaceState == 0)
                           {
                              stRowIntruderArray.push(intruder);
                           }
                        }
                        else if(intruder.iSpaceState == 0 || intruder.iSpaceState == 3)
                        {
                           stRowIntruderArray.push(intruder);
                        }
                     }
                  }
               }
            }
         }
         if(stRowIntruderArray.length > 0)
         {
            stRowIntruderArray.sort(this.OnSortToken);
            return stRowIntruderArray[0].m_stCurrentFieldGrid;
         }
         return null;
      }
      
      private function OnSortToken(a:a_4206, b:a_4206) : int
      {
         if(this.stTempPosition == null)
         {
            return 0;
         }
         var aMouseY:Number = a.y + a.stDisplayBitmap.y + a.height / 2;
         var aMouseX:Number = a.x + a.stDisplayBitmap.x + a.width / 2;
         var bMouseY:Number = b.y + b.stDisplayBitmap.y + b.height / 2;
         var bMouseX:Number = b.x + a.stDisplayBitmap.x + b.width / 2;
         var disa:Number = Point.distance(this.stTempPosition,new Point(aMouseX,aMouseY));
         var disb:Number = Point.distance(this.stTempPosition,new Point(bMouseX,bMouseY));
         if(Math.abs(disa) < Math.abs(disb))
         {
            return -1;
         }
         if(Math.abs(disa) > Math.abs(disb))
         {
            return 1;
         }
         return 0;
      }
   }
}

