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
   
   public class DarkMessengerBaseAttackFighter extends a_3953
   {
      
      private var m_isShoted:Boolean;
      
      private var m_arrDarkMessengerBaseEffectArray:Array = [];
      
      private var m_arrDarkMessengerTopShotArray:Array = [];
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public function DarkMessengerBaseAttackFighter()
      {
         super();
         a_1309 = 60;
         a_1312 = 0;
         a_1095 = DarkMessengerDefence.DEFENSE_PRICE;
         a_1310 = 8;
         a_1338 = 8;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
         a_1308 = 22 * 2;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(DarkMessengerBaseAttackFighter) as DarkMessengerBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return DarkMessengerBaseAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 12;
         super.a_1797(stFieldGrid);
         a_1311 = DarkMessengerDefence.a_3965(a_1094);
         a_1309 = 60;
         a_1339 = DarkMessengerDefence.LIFE_VALUE;
         a_1275 = 1;
         this.gotoAndStop((a_1276[0] as FrameLabel).frame);
         this.m_isShoted = false;
         a_1313 = true;
         this.visible = true;
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stLastWaitShot:DarkMessengerBaseShot = null;
         var numShotXpos:Number = NaN;
         var stStartField:a_3491 = null;
         var yIndex:int = 0;
         var xIndex:int = 0;
         var baseEffect:DarkMessengerBaseEffect = null;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var m_stCurrentFieldGrid:a_3491 = null;
         var randomNum:int = 0;
         var stDarkMessengeEffect:DarkMessengeEffect = null;
         var stFieldGridVector:Array = a_1334.m_stCurrentBattbleFieldView.stFieldGridsVector;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 2,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 2,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 2,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 2,BattleFieldView.a_1012 - 1);
         if(iCurrentTime - m_iPlaceTimeIntervals - a_1308 > DarkMessengerDefence.a_3966(m_iSkillDegree))
         {
            this.a_3969(a_1339);
         }
         if(iCurrentTime > m_iPlaceTimeIntervals + a_1308 && !this.m_isShoted && a_1334 != null)
         {
            a_1275 = 2;
            this.gotoAndStop((a_1276[2] as FrameLabel).frame);
            this.visible = false;
            this.m_isShoted = true;
            a_1321 = iCurrentTime;
            a_1323 = 1;
            baseEffect = DarkMessengerBaseEffect.a_4344() as DarkMessengerBaseEffect;
            if(null == baseEffect)
            {
               return false;
            }
            this.m_arrDarkMessengerBaseEffectArray.push(baseEffect);
            baseEffect.iShotSequenceNum = a_1323;
            baseEffect.a_1797(0,a_1312,a_1311,x,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(baseEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,a_1334);
            baseEffect.x = a_1334.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - baseEffect.width) + 157;
            baseEffect.y = a_1334.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - baseEffect.height - 110) + 206;
            stLastWaitShot = DarkMessengerBaseShot.a_4344() as DarkMessengerBaseShot;
            if(null == stLastWaitShot)
            {
               return false;
            }
            this.m_arrDarkMessengerTopShotArray.push(stLastWaitShot);
            stLastWaitShot.iShotSequenceNum = a_1323;
            stLastWaitShot.a_1797(0,a_1312,a_1311,x,y,a_1334.m_stCurrentBattbleFieldView,a_1334);
            stLastWaitShot.x = a_1334.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stLastWaitShot.width) + 157;
            stLastWaitShot.y = a_1334.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stLastWaitShot.height - 110) + 206;
            a_1334.m_stCurrentBattbleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.EFFECTS_TOP_TYPE,a_1334);
            a_1307 = 23;
         }
         if(this.m_isShoted)
         {
            if(iCurrentTime % 20 == 0)
            {
               for(yIndex = yStart; yIndex <= yEnd; yIndex++)
               {
                  for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                  {
                     arrMoveIntruder = stFieldGridVector[yIndex][xIndex].a_1511.slice();
                     for each(stMoveIntruder in arrMoveIntruder)
                     {
                        if(!(0 == stMoveIntruder.iSpaceState && stMoveIntruder.isCannotSeeByFighter))
                        {
                           m_stCurrentFieldGrid = stMoveIntruder.m_stCurrentFieldGrid;
                           if(m_stCurrentFieldGrid)
                           {
                              stDarkMessengeEffect = DarkMessengeEffect.a_3926();
                              stDarkMessengeEffect.a_1797(false);
                              stDarkMessengeEffect.x = stMoveIntruder.x + stMoveIntruder.stDisplayBitmap.x + stMoveIntruder.width / 2;
                              stDarkMessengeEffect.y = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y + stMoveIntruder.height / 2;
                              m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stDarkMessengeEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,m_stCurrentFieldGrid);
                              stDarkMessengeEffect.play();
                           }
                           stMoveIntruder.a_4209(a_1311);
                           randomNum = this.m_stRandomSeed.nextInt(100) + 1;
                           if(randomNum <= 15 && stMoveIntruder.iLifeValue > 0)
                           {
                              stMoveIntruder.a_4208(b_182.a_435,30);
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
         var stDarkMessengerBaseShot:DarkMessengerBaseShot = null;
         var stDarkMessengerBaseEffect:DarkMessengerBaseEffect = null;
         super.a_3940();
         for each(stDarkMessengerBaseShot in this.m_arrDarkMessengerTopShotArray)
         {
            stDarkMessengerBaseShot.m_isParentAttackDie = true;
         }
         this.m_arrDarkMessengerTopShotArray = [];
         for each(stDarkMessengerBaseEffect in this.m_arrDarkMessengerBaseEffectArray)
         {
            stDarkMessengerBaseEffect.m_isParentAttackDie = true;
         }
         this.m_arrDarkMessengerBaseEffectArray = [];
         return true;
      }
      
      override protected function a_3955() : Number
      {
         return width * 0.9;
      }
      
      override protected function a_3956() : Number
      {
         return -0.1 * height;
      }
   }
}

