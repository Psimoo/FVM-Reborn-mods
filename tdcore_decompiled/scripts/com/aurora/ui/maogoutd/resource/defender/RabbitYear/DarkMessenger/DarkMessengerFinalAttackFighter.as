package com.aurora.ui.maogoutd.resource.defender.RabbitYear.DarkMessenger
{
   import a_4718.b_182;
   import a_4754.a_2161;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.FrameLabel;
   import flash.utils.Dictionary;
   
   public class DarkMessengerFinalAttackFighter extends a_3953
   {
      
      private var m_isShoted:Boolean;
      
      private var m_arrShotList:Array = [];
      
      private var m_arrBaseEffectList:Array = [];
      
      private var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_shotIndex:int = 0;
      
      private var m_dicIntruderHitCount:Dictionary = new Dictionary();
      
      private var multipliers:Array = [1,1,1.5,2,3];
      
      public function DarkMessengerFinalAttackFighter()
      {
         super();
         a_1309 = 60;
         a_1312 = 0;
         a_1095 = DarkMessengerDefence.DEFENSE_PRICE;
         a_1310 = 8;
         a_1338 = 8;
         a_1308 = 44;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DarkMessengerFinalAttackFighter) as DarkMessengerFinalAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DarkMessengerFinalAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         var enterRoom:Object = null;
         a_1310 = 12;
         super.a_1797(stFieldGrid);
         if(m_bServerIssued)
         {
            a_1311 = DarkMessengerDefence.a_3965(a_1094);
            a_1309 = 60;
            a_1339 = DarkMessengerDefence.LIFE_VALUE;
            a_1275 = 1;
            this.gotoAndStop((a_1276[0] as FrameLabel).frame);
            this.m_shotIndex = 0;
            this.m_isShoted = false;
            a_1313 = true;
            enterRoom = a_2161.e.getEnterRoom();
            this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,BattleFieldView.ms_iServerLockStep);
         }
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var shot:DarkMessengerFinalShot = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var arrIntruder:Array = null;
         var len:int = 0;
         var i:int = 0;
         var intruder:a_4206 = null;
         var grid:a_3491 = null;
         var eff:DarkMessengeEffect = null;
         var hitCount:int = 0;
         var m_HotMultiplier:Number = NaN;
         var effect:DarkMessengerFinalDeadEffect = null;
         if(!a_1334)
         {
            return false;
         }
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 3,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 3,BattleFieldView.a_1012 - 1);
         if(iCurrentTime - m_iPlaceTimeIntervals - a_1308 > DarkMessengerDefence.a_3966(m_iSkillDegree))
         {
            this.a_3969(a_1339);
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && !this.m_isShoted)
         {
            a_1275 = 2;
            this.gotoAndStop((a_1276[2] as FrameLabel).frame);
            this.visible = false;
            this.m_isShoted = true;
            a_1321 = iCurrentTime;
            a_1323 = 1;
            shot = DarkMessengerFinalShot.a_4344() as DarkMessengerFinalShot;
            if(shot == null)
            {
               return false;
            }
            this.m_arrShotList.push(shot);
            shot.iShotSequenceNum = a_1323;
            shot.a_1797(0,a_1312,a_1311,x,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
            shot.x = a_1334.m_iXGridNo * a_3491.a_1080 + 30;
            shot.y = a_1334.m_iYGridNo * a_3491.a_1081 + 26;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(shot,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
            a_1307 = 23;
         }
         if(this.m_isShoted && iCurrentTime % 16 == 0)
         {
            for(yIndex = yStart; yIndex <= yEnd; yIndex++)
            {
               for(xIndex = xStart; xIndex <= xEnd; xIndex++)
               {
                  arrIntruder = stFieldGridVector[yIndex][xIndex].IntruderArray;
                  len = int(arrIntruder.length);
                  for(i = 0; i < len; i++)
                  {
                     intruder = arrIntruder[i];
                     if(!(!intruder || intruder.iSpaceState == 0 && intruder.isCannotSeeByFighter))
                     {
                        grid = intruder.m_stCurrentFieldGrid;
                        if(grid)
                        {
                           eff = DarkMessengeEffect.GetFreeInstance1();
                           eff.a_1797(false);
                           eff.x = intruder.x + intruder.stDisplayBitmap.x + intruder.width * 0.5;
                           eff.y = intruder.y + intruder.stDisplayBitmap.y + intruder.height * 0.5;
                           grid.m_stCurrentBattbleFieldView.AddToBattleView(eff,BattleLayerDefine.EFFECTS_TOP_TYPE,grid);
                           eff.play();
                           hitCount = this.m_dicIntruderHitCount[intruder.globalMoveFighterID] != undefined ? int(this.m_dicIntruderHitCount[intruder.globalMoveFighterID]) : 0;
                           if(hitCount < 20)
                           {
                              hitCount++;
                              this.m_dicIntruderHitCount[intruder.globalMoveFighterID] = hitCount;
                           }
                           m_HotMultiplier = hitCount < this.multipliers.length ? Number(this.multipliers[hitCount]) : hitCount;
                           intruder.a_4208(b_182.a_432,2);
                           intruder.a_4209(a_1311 * m_HotMultiplier);
                           if(this.m_stRandomSeed.nextInt(100) < 15 && intruder.iLifeValue > 0)
                           {
                              intruder.a_4208(b_182.a_435,30);
                           }
                           if(intruder.iLifeValue <= 0 && intruder.visible && !intruder.IsBossIntruder && !intruder.IsWaterIntruder && Boolean(intruder.parent))
                           {
                              intruder.a_3432();
                              effect = DarkMessengerFinalDeadEffect.a_3926();
                              effect.a_1797(false);
                              stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,stFieldGrid);
                              effect.x = intruder.x;
                              effect.y = intruder.y;
                           }
                        }
                     }
                  }
               }
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return DarkMessengerDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
         super.gotoAndStop(frame,scene);
      }
      
      override public function a_3940() : Boolean
      {
         var key:* = undefined;
         var shot:DarkMessengerFinalShot = null;
         var eff:DarkMessengerFinalBaseEffect = null;
         super.a_3940();
         for(key in this.m_dicIntruderHitCount)
         {
            delete this.m_dicIntruderHitCount[key];
         }
         for each(shot in this.m_arrShotList)
         {
            shot.m_isParentAttackDie = true;
         }
         this.m_arrShotList.length = 0;
         for each(eff in this.m_arrBaseEffectList)
         {
            eff.m_isParentAttackDie = true;
         }
         this.m_arrBaseEffectList.length = 0;
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.9;
      }
      
      override protected function a_3956() : Number
      {
         return -height * 0.1;
      }
   }
}

