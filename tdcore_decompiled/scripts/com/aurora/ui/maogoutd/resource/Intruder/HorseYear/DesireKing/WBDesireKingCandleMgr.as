package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleRangeUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class WBDesireKingCandleMgr
   {
      
      private static var _instance:WBDesireKingCandleMgr;
      
      private var _container:Sprite;
      
      private var _line:WBDesireKingRowDmgFxMovie;
      
      private var _range:WBDesireKingFsDmgFxMovie;
      
      private var _lines:Array = [];
      
      private var _maskShape:Shape;
      
      private var _iXOffset:int = 30;
      
      private var _iYOffset:int = 40;
      
      private var _stCandleArr:Array = [];
      
      private var _iCurrentTick:int = -1;
      
      private var _stRandomSeed:RandomSeed;
      
      private var _stBattleView:BattleFieldView;
      
      private var _level:int = 1;
      
      private var _skillTimes:int = 0;
      
      public function WBDesireKingCandleMgr()
      {
         super();
      }
      
      public static function getInstance() : WBDesireKingCandleMgr
      {
         if(_instance == null)
         {
            _instance = new WBDesireKingCandleMgr();
         }
         return _instance;
      }
      
      public function Add(candle:WBDesireKingCandleEffect, randomSeed:RandomSeed, battleView:BattleFieldView) : void
      {
         var buffGrid:a_3491 = null;
         var iNoY:int = 0;
         this._stRandomSeed = randomSeed;
         this._stBattleView = battleView;
         var i:int = 0;
         if(this._container == null)
         {
            this._container = new Sprite();
            this._range = new WBDesireKingFsDmgFxMovie();
            battleView.AddToBattleView(this._container,BattleLayerDefine.EFFECTS_BASE2_TYPE);
            this._container.addChild(this._range);
            this._range.x = 250;
            this._range.y = 232;
            this._range.scaleX = 1.2;
            this._range.scaleY = 1.2;
            this._line = new WBDesireKingRowDmgFxMovie();
            battleView.AddToBattleView(this._container,BattleLayerDefine.EFFECTS_BASE2_TYPE);
            this._container.addChild(this._line);
            this._line.visible = false;
         }
         if(this._maskShape == null)
         {
            this._maskShape = new Shape();
            battleView.AddToBattleView(this._maskShape,BattleLayerDefine.EFFECTS_BASE2_TYPE);
            this._range.mask = this._maskShape;
         }
         this._level = candle._level;
         candle.SetAnimationOnce2Loop(0,2);
         candle.Change2Black();
         this._stCandleArr.push(candle);
         if(this.CanUpdate())
         {
            if(this._level == 1)
            {
               iNoY = candle._grid.m_iYGridNo;
               this._line.PlayAnimation();
               this._line.x = candle._grid.m_iXGridNo * 60 + 30 + 100;
               this._line.y = candle._grid.m_iYGridNo * 64 + 32 + 8;
               for(i = 4; i <= 8; i++)
               {
                  this.AddBuff2Grid(i,iNoY);
               }
            }
            else
            {
               this.DrawShapes();
            }
         }
      }
      
      private function DrawShapes() : void
      {
         var candle:WBDesireKingCandleEffect = null;
         var points:Array = [];
         for(var i:int = 0; i < this._stCandleArr.length; i++)
         {
            candle = this._stCandleArr[i];
            points.push([candle._grid.m_iXGridNo,candle._grid.m_iYGridNo]);
         }
         this._range.PlayAnimation();
         this.DrawShape(points);
         this.UpdateShape();
      }
      
      private function AddBuff2Grid(iNoX:int, iNoY:int) : void
      {
         var buffGrid:a_3491 = this._stBattleView.a_3438(iNoX,iNoY);
         if(buffGrid == null)
         {
            return;
         }
         if(this._skillTimes <= 1)
         {
            buffGrid.tagCom.AddTag(20025);
         }
         else if(this._skillTimes == 2)
         {
            buffGrid.tagCom.AddTag(20035);
         }
         else
         {
            buffGrid.tagCom.AddTag(20036);
         }
      }
      
      private function UpdateShape() : void
      {
         var candle:WBDesireKingCandleEffect = null;
         var buffGrid:a_3491 = null;
         var arr:Array = [];
         var i:int = 0;
         for(i = 0; i < this._stCandleArr.length; i++)
         {
            candle = this._stCandleArr[i];
            arr.push([candle._grid.m_iXGridNo,candle._grid.m_iYGridNo]);
         }
         var obj:Object = BattleRangeUtil.MaxConvexRegion(arr);
         var range:Array = BattleRangeUtil.FixAllRange(obj.hullPoints);
         this.DrawShape(range);
         var effectArr:Array = BattleRangeUtil.GetCoveredCells(range,arr);
         for(i = 0; i < effectArr.length; i++)
         {
            this.AddBuff2Grid(effectArr[i][0],effectArr[i][1]);
         }
      }
      
      private function DrawShape(points:Array) : void
      {
         var line:WBDesireKingDiagDmgFxMovie = null;
         this._maskShape.graphics.clear();
         this._maskShape.graphics.beginFill(0);
         this._maskShape.graphics.moveTo(points[0][0] * a_3491.a_1080 + this._iXOffset,points[0][1] * a_3491.a_1081 + this._iYOffset);
         var i:int = 0;
         for(i = 1; i < points.length; i++)
         {
            this._maskShape.graphics.lineTo(points[i][0] * a_3491.a_1080 + this._iXOffset,points[i][1] * a_3491.a_1081 + this._iYOffset);
         }
         this._maskShape.graphics.lineTo(points[0][0] * a_3491.a_1080 + this._iXOffset,points[0][1] * a_3491.a_1081 + this._iYOffset);
         this._maskShape.graphics.endFill();
         while(this._lines.length < points.length)
         {
            line = new WBDesireKingDiagDmgFxMovie();
            this._container.addChild(line);
            this._lines.push(line);
         }
         for(i = 0; i < points.length; i++)
         {
            if(i == points.length - 1)
            {
               this.drawLine(this._lines[i],points[i],points[0]);
            }
            else
            {
               this.drawLine(this._lines[i],points[i],points[i + 1]);
            }
         }
         for(i = int(points.length); i < this._lines.length; i++)
         {
            this._lines[i].StopAnimation();
         }
      }
      
      private function drawLine(line:WBDesireKingDiagDmgFxMovie, point1:Array, point2:Array) : void
      {
         var startPosition:Point = null;
         var iAllDistance:Number = NaN;
         startPosition = new Point(point1[0] * a_3491.a_1080 + 30,point1[1] * a_3491.a_1081 + 38);
         var MouseX:Number = point2[0] * a_3491.a_1080 + 30;
         var MouseY:Number = point2[1] * a_3491.a_1081 + 38;
         iAllDistance = Point.distance(startPosition,new Point(MouseX,MouseY));
         var dy:Number = MouseY - startPosition.y;
         var dx:Number = MouseX - startPosition.x;
         var Ratation:Number = Math.atan2(dy,dx);
         Ratation = Ratation * 180 / Math.PI;
         line.rotation = Ratation;
         line.x = startPosition.x;
         line.scaleY = -1;
         line.y = startPosition.y;
         line.bgMask.width = iAllDistance;
         line.PlayAnimation();
      }
      
      public function Remove(candle:WBDesireKingCandleEffect) : void
      {
         if(this._stCandleArr.length == 0)
         {
            return;
         }
         var idx:int = this._stCandleArr.indexOf(candle);
         if(idx != -1)
         {
            this._stCandleArr.splice(idx,1);
            if(this._stCandleArr.length == 0)
            {
               this.a_4158();
            }
            return;
         }
      }
      
      public function ResetTimes(skillTimes:int) : void
      {
         this.a_4158();
         this._skillTimes = skillTimes;
      }
      
      public function a_4158() : void
      {
         var i:int = 0;
         var j:int = 0;
         var buffGrid:a_3491 = null;
         this._skillTimes = 0;
         this._iCurrentTick = -1;
         for(i = 0; i < this._stCandleArr.length; i++)
         {
            this._stCandleArr[i].RealRealease();
         }
         this._stCandleArr.length = 0;
         for(i = 0; i < this._lines.length; i++)
         {
            this._lines[i].StopAnimation();
         }
         if(this._line != null)
         {
            this._line.StopAnimation();
         }
         if(this._range != null)
         {
            this._range.StopAnimation();
         }
         if(this._stBattleView != null)
         {
            for(i = 0; i <= BattleFieldView.a_1011; i++)
            {
               for(j = 0; j <= BattleFieldView.a_1011; j++)
               {
                  buffGrid = this._stBattleView.a_3438(i,j);
                  if(buffGrid != null)
                  {
                     buffGrid.tagCom.RemoveTag(20025);
                     buffGrid.tagCom.RemoveTag(20035);
                     buffGrid.tagCom.RemoveTag(20036);
                  }
               }
            }
         }
      }
      
      private function CanUpdate() : Boolean
      {
         if(this._level == 1 && this._stCandleArr.length < 2)
         {
            return false;
         }
         if(this._level == 2 && this._stCandleArr.length < 3)
         {
            return false;
         }
         if(this._level == 3)
         {
            if(this._stCandleArr.length < 4 && this._skillTimes <= 1)
            {
               return false;
            }
            if(this._stCandleArr.length < 8 && this._skillTimes == 2)
            {
               return false;
            }
            if(this._stCandleArr.length < 12 && this._skillTimes > 2)
            {
               return false;
            }
         }
         return true;
      }
      
      public function a_3897(iCurrentTick:int) : void
      {
         var candle:WBDesireKingCandleEffect = null;
         var i:int = 0;
         if(this._iCurrentTick >= iCurrentTick)
         {
            return;
         }
         this._iCurrentTick = iCurrentTick;
         if(!this.CanUpdate())
         {
            return;
         }
         var blackArr:Array = [];
         var bHasPurple:Boolean = false;
         var bAllIsNone:Boolean = true;
         for(i = 0; i < this._stCandleArr.length; i++)
         {
            candle = this._stCandleArr[i];
            if(candle._iState == 1)
            {
               blackArr.push(i);
            }
            else if(candle._iState == 0)
            {
               bHasPurple = true;
            }
            if(candle._iState != 2)
            {
               bAllIsNone = false;
            }
         }
         if(bAllIsNone == true)
         {
            for(i = 0; i < this._stCandleArr.length; i++)
            {
               candle = this._stCandleArr[i];
               candle.SetAnimation(5,true);
            }
            this.a_4158();
         }
         else if(bHasPurple == false)
         {
            this._stCandleArr[blackArr[this._stRandomSeed.nextInt(blackArr.length)]].Change2Purple();
         }
      }
   }
}

