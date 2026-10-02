package com.aurora.ui.maogoutd.resource.gamemap.newMap.RabbitYear.Anniversary13
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class PlotEffect extends a_4108
   {
      
      private static var a_1300:Vector.<BitmapData> = new Vector.<BitmapData>(50);
      
      private static var a_1301:Vector.<Point> = new Vector.<Point>(50);
      
      public static var ms_arrBreadCard:Array = new Array(286523412,286523424,286523438,294846592,286457998,286457999,286458192,286458206,286458207,292552704,292552718,292552719);
      
      public static var ms_arrSteamedDump:Array = new Array(286457876,286457888,286457904,286457936,286458208,294846576,286458112,286458224,291700752,291700766,291700767,294846480,294846494,294846495,291700992,291701006,291701007);
      
      public static var ms_arrBoomCard:Array = new Array(286394688,286394702,286394703,286458144,294846544,286457950,286457983);
      
      private var m_iStartTime:int;
      
      public var m_iType:int;
      
      public var stTargetFieldGrid:a_3491;
      
      public var stCallBackFunc:Function = null;
      
      private var m_iTimeoutIntval:int;
      
      public function PlotEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
      }
      
      public static function a_3926() : PlotEffect
      {
         return PoolManager.getInstance().CheckOutOne(PlotEffect) as PlotEffect;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iTimeoutIntval = -1;
         a_3916();
         a_1271 = true;
         a_3910();
         this.m_iStartTime = 0;
         this.addShield(this.stTargetFieldGrid);
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         return true;
      }
      
      override protected function a_3911() : Vector.<BitmapData>
      {
         return a_1300;
      }
      
      override protected function a_3912() : Vector.<Point>
      {
         return a_1301;
      }
      
      override protected function a_3913() : MovieClip
      {
         var returnMovie:Class = null;
         switch(this.m_iType)
         {
            case 1:
               returnMovie = PlotOneMovie;
               break;
            case 2:
               returnMovie = PlotTwoMovie;
               break;
            case 3:
               returnMovie = PlotThreeMovie;
               break;
            case 4:
               returnMovie = PlotFourthMovie;
               break;
            case 5:
               returnMovie = PlotFiveMovie;
               break;
            case 6:
               returnMovie = PlotSixMovie;
               break;
            case 7:
               returnMovie = PlotSevenMovie;
               break;
            case 8:
               returnMovie = PlotEightMovie;
               break;
            default:
               returnMovie = PlotOneMovie;
         }
         return EffectManager.getInstance().GetMoveClip(returnMovie).moveClip;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         ++this.m_iStartTime;
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(this.checkHasDefense(this.stTargetFieldGrid))
         {
            if(this.m_iTimeoutIntval == -1 && a_1275 != 2)
            {
               this.m_iTimeoutIntval = setTimeout(this.LightPlot,2 * 1000);
            }
         }
         else if(a_1275 != 0)
         {
            a_1275 = 0;
            gotoAndStop((a_1276[0] as FrameLabel).frame);
            if(this.stCallBackFunc != null)
            {
               this.stCallBackFunc(this.stTargetFieldGrid,false);
            }
         }
         if(a_1273 == 85)
         {
            if(this.checkHasDefense(this.stTargetFieldGrid))
            {
               if(this.stCallBackFunc != null)
               {
                  this.stCallBackFunc(this.stTargetFieldGrid,true);
               }
            }
         }
      }
      
      private function LightPlot() : void
      {
         if(this.m_iTimeoutIntval >= 0)
         {
            clearTimeout(this.m_iTimeoutIntval);
         }
         this.m_iTimeoutIntval = -1;
         if(a_1275 != 2)
         {
            a_1275 = 2;
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_stPlotEffect = this;
         }
         if(stFieldGrid != null && Boolean(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
      
      protected function ClearShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null)
         {
            stFieldGrid.m_stPlotEffect = null;
         }
         if(stFieldGrid != null && Boolean(stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap()))
         {
            stFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
         }
         return true;
      }
      
      public function checkHasDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(this.m_iType == 2 || this.m_iType == 6)
         {
            if(stFieldGrid.m_stAttackFighter != null && ms_arrBreadCard.indexOf(stFieldGrid.m_stAttackFighter.a_3512()) != -1)
            {
               return true;
            }
            return false;
         }
         if(this.m_iType == 3 || this.m_iType == 7)
         {
            if(stFieldGrid.m_stAttackFighter != null && ms_arrSteamedDump.indexOf(stFieldGrid.m_stAttackFighter.a_3512()) != -1)
            {
               return true;
            }
            return false;
         }
         if(stFieldGrid.m_stBoomDefense != null && ms_arrBoomCard.indexOf(stFieldGrid.m_stBoomDefense.a_3512()) != -1)
         {
            return true;
         }
         return stFieldGrid.m_stAttackFighter != null && !(stFieldGrid.m_stAttackFighter is a_3924) || stFieldGrid.m_stTrayDefense != null || stFieldGrid.m_stProtector != null || stFieldGrid.m_stFlowerDefense != null || stFieldGrid.m_stBaseAuxiliaryFighter != null;
      }
      
      override public function a_3940() : Boolean
      {
         this.ClearShield(this.stTargetFieldGrid);
         super.a_3940();
         return true;
      }
   }
}

