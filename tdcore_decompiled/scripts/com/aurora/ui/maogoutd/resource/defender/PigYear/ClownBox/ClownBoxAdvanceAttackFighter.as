package com.aurora.ui.maogoutd.resource.defender.PigYear.ClownBox
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.display.Bitmap;
   import flash.display.FrameLabel;
   import flash.utils.setTimeout;
   
   public class ClownBoxAdvanceAttackFighter extends a_3953
   {
      
      private static var ms_arrMouseScareBitmapArray:Array = new Array();
      
      private var a_1358:Boolean = false;
      
      private var m_iChangeTimes:int;
      
      public function ClownBoxAdvanceAttackFighter()
      {
         a_1271 = true;
         super();
         a_1095 = 215;
         a_1304 = 0;
         a_1310 = 1;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(ClownBoxAdvanceAttackFighter) as ClownBoxAdvanceAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return ClownBoxAdvanceAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1338 = 1;
         this.a_1358 = false;
         this.m_iChangeTimes = (stFieldGrid.m_iXGridNo + 1) * (stFieldGrid.m_iYGridNo + 1);
         super.a_1797(stFieldGrid);
         a_1339 = 50 + this.a_3965();
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 300;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         var stMoveIntruder:a_4206 = null;
         var i:int = 0;
         var stTargetFieldGrid:a_3491 = null;
         var arrBaseMoveIntruderVector:Array = null;
         var stTempFieldGrid:a_3491 = null;
         var stScareBitmap:Bitmap = null;
         if(this.a_1358)
         {
            if(a_1334.a_1511.length > 0 && !(16 == a_1334.a_1511[0].m_stMoveIntruderTypeID || 15 == a_1334.a_1511[0].m_stMoveIntruderTypeID))
            {
               if(a_1339 > 30)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
               else if(a_1339 > 20)
               {
                  if(1 != a_1275)
                  {
                     a_1275 = 1;
                     gotoAndStop((a_1276[4] as FrameLabel).frame);
                  }
               }
               else if(a_1339 > 0)
               {
                  if(2 != a_1275)
                  {
                     a_1275 = 2;
                     gotoAndStop((a_1276[5] as FrameLabel).frame);
                  }
               }
               for each(stMoveIntruder in a_1334.a_1511.slice())
               {
                  if(stMoveIntruder.isFearCatHead)
                  {
                     i = 0 == this.m_iChangeTimes % 2 ? 1 : -1;
                     if(0 == a_1334.m_iYGridNo)
                     {
                        i = 1;
                     }
                     else if(BattleFieldView.a_1012 - 1 == a_1334.m_iYGridNo)
                     {
                        i = -1;
                     }
                     stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + i);
                     if(a_1334.m_isNeedTray != stTargetFieldGrid.m_isNeedTray)
                     {
                        i *= -1;
                     }
                     stTargetFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + i);
                     if(!stTargetFieldGrid || stFieldGrid.m_isNeedTray != stTargetFieldGrid.m_isNeedTray)
                     {
                        i = 0;
                     }
                     a_1334.a_3457(stMoveIntruder);
                     a_1334.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
                     arrBaseMoveIntruderVector = a_1334.m_stCurrentBattbleFieldView.m_arrBaseMoveIntruderVector;
                     if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
                     {
                        arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
                     }
                     stTempFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(a_1334.m_iXGridNo,a_1334.m_iYGridNo + i);
                     stScareBitmap = ms_arrMouseScareBitmapArray.pop();
                     if(null == stScareBitmap)
                     {
                        stScareBitmap = new Bitmap();
                        stScareBitmap.bitmapData = BitMapManager.getInstance().GetMouseScareBitmapData();
                     }
                     stScareBitmap.visible = true;
                     stScareBitmap.x = stMoveIntruder.x + stMoveIntruder.stDisplayBitmap.x;
                     stScareBitmap.y = stMoveIntruder.y + stMoveIntruder.stDisplayBitmap.y;
                     stMoveIntruder.parent.addChildAt(stScareBitmap,stMoveIntruder.parent.getChildIndex(stMoveIntruder) + 1);
                     if(stMoveIntruder.iArmorLifeValue >= 0)
                     {
                        stMoveIntruder.a_3969(stMoveIntruder.iArmorLifeValue);
                     }
                     if(stMoveIntruder.iLifeValue >= 0)
                     {
                        stMoveIntruder.ReduceLife2(60,[106]);
                     }
                     BattleFieldView.a_1021.play();
                     setTimeout(this.OnMouseScareTimeout,800,a_1334.m_stCurrentBattbleFieldView.a_3459,stMoveIntruder,stTempFieldGrid,stScareBitmap);
                     ++this.m_iChangeTimes;
                  }
               }
            }
            this.a_1358 = false;
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(iRduceLifeValue >= 1)
         {
            this.a_1358 = true;
         }
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 30)
         {
            if(1 != a_1275)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(20 == a_1339)
         {
            if(2 != a_1275)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3955() : Number
      {
         return 0.95 * width;
      }
      
      override protected function a_3956() : Number
      {
         return 0.5 * height;
      }
      
      private function OnMouseScareTimeout(stFunction:Function, stMoveIntruder:a_4206, stTempFieldGrid:a_3491, stMouseScareBitmap:Bitmap) : void
      {
         stFunction(stMoveIntruder,stTempFieldGrid,false);
         if(stMoveIntruder.iLifeValue >= 0)
         {
            stMoveIntruder.a_4208(b_182.a_433,20);
         }
         if(Boolean(stMouseScareBitmap.parent) && stMouseScareBitmap.parent.contains(stMouseScareBitmap))
         {
            stMouseScareBitmap.parent.removeChild(stMouseScareBitmap);
         }
         stMouseScareBitmap.visible = false;
         if(-1 == ms_arrMouseScareBitmapArray.indexOf(stMouseScareBitmap))
         {
            ms_arrMouseScareBitmapArray.push(stMouseScareBitmap);
         }
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         if(a_1094 <= 6)
         {
            iStarDegreeEffect = 2 * a_1094;
         }
         else if(a_1094 > 6 && a_1094 <= 9)
         {
            iStarDegreeEffect = 2 * 6 + 3 * (a_1094 - 6);
         }
         else if(a_1094 > 9)
         {
            iStarDegreeEffect = 2 * 6 + 3 * 3 + 4 * (a_1094 - 9);
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

