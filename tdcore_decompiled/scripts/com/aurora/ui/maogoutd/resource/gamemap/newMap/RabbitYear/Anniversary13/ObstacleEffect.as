package com.aurora.ui.maogoutd.resource.gamemap.newMap.RabbitYear.Anniversary13
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ObstacleEffect extends a_4108
   {
      
      private static var a_1300:Vector.<BitmapData> = new Vector.<BitmapData>(50);
      
      private static var a_1301:Vector.<Point> = new Vector.<Point>(50);
      
      private var m_iStartTime:int;
      
      public var m_iType:int;
      
      public var stTargetFieldGrid:a_3491;
      
      public function ObstacleEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
      }
      
      public static function a_3926() : ObstacleEffect
      {
         return PoolManager.getInstance().CheckOutOne(ObstacleEffect) as ObstacleEffect;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         a_3916();
         a_1271 = true;
         a_3910();
         this.addShield(this.stTargetFieldGrid);
         this.m_iStartTime = 0;
         a_1275 = 2;
         gotoAndStop((a_1276[1] as FrameLabel).frame);
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
         var returnMovie:MovieClip = null;
         switch(this.m_iType)
         {
            case 1:
               returnMovie = EffectManager.getInstance().GetMoveClip(ObstacleOneMovie).moveClip;
               break;
            case 2:
               returnMovie = EffectManager.getInstance().GetMoveClip(ObstacleTwoMovie).moveClip;
               break;
            case 3:
               returnMovie = EffectManager.getInstance().GetMoveClip(ObstacleThreeMovie).moveClip;
               break;
            case 4:
               returnMovie = EffectManager.getInstance().GetMoveClip(ObstacleFourthMovie).moveClip;
               break;
            default:
               returnMovie = EffectManager.getInstance().GetMoveClip(ObstacleOneMovie).moveClip;
         }
         return returnMovie;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         ++this.m_iStartTime;
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      protected function addShield(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid != null && 0 == stFieldGrid.m_iFieldGridType)
         {
            stFieldGrid.m_iFieldGridType = 1;
         }
         stFieldGrid.m_stObstacleEffect = this;
         this.a_3502(stFieldGrid);
         return true;
      }
      
      public function changeState(working:Boolean) : void
      {
         if(!working)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
               if(this.stTargetFieldGrid != null && 0 == this.stTargetFieldGrid.m_iFieldGridType)
               {
                  this.stTargetFieldGrid.m_iFieldGridType = 1;
               }
               this.a_3502(this.stTargetFieldGrid);
            }
         }
         else if(a_1275 != 0)
         {
            a_1275 = 0;
            gotoAndStop((a_1276[3] as FrameLabel).frame);
            if(this.stTargetFieldGrid != null && 1 == this.stTargetFieldGrid.m_iFieldGridType)
            {
               this.stTargetFieldGrid.m_iFieldGridType = 0;
            }
         }
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
         if(stFieldGrid != null && stFieldGrid.m_iFieldGridType == 1)
         {
            stFieldGrid.m_iFieldGridType = 0;
         }
         if(stFieldGrid != null)
         {
            stFieldGrid.m_stObstacleEffect = null;
         }
         return true;
      }
      
      override public function a_3940() : Boolean
      {
         this.ClearShield(this.stTargetFieldGrid);
         super.a_3940();
         return true;
      }
   }
}

