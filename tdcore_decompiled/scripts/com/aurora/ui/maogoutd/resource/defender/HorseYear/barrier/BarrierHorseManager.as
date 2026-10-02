package com.aurora.ui.maogoutd.resource.defender.HorseYear.barrier
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.Util.BattleRangeUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.shot.SecretWish.CollisionHit;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class BarrierHorseManager
   {
      
      private static var _instance:BarrierHorseManager;
      
      private var _horses:Array = [];
      
      private var _attackType:int = 0;
      
      private var _lastAttackNum:int = 0;
      
      private var _battleView:BattleFieldView;
      
      private var _iTimeNum:int = 0;
      
      private var _container:Sprite;
      
      private var _shotMovie:BarrierHorseNormalShot;
      
      private var _sceneBuffMovie:BarrierHorseEffectSceneBuffMovie;
      
      private var _maskShape:Shape;
      
      private var lines:Array = [];
      
      private var _minPos:Array = [0,0];
      
      private var _maxPos:Array = [0,0];
      
      private var _damageArray:Array = [];
      
      private var _minTrans:int = 999;
      
      private var _attackDamage:int = 999;
      
      private var m_iXOffset:int = 30;
      
      private var m_iYOffset:int = 40;
      
      public function BarrierHorseManager()
      {
         super();
      }
      
      public static function getInstance() : BarrierHorseManager
      {
         if(_instance == null)
         {
            _instance = new BarrierHorseManager();
         }
         return _instance;
      }
      
      public function get attackType() : int
      {
         return this._attackType;
      }
      
      public function AddOne(horse:BarrierHorseComponent) : void
      {
         if(this._horses.indexOf(horse) == -1)
         {
            this._horses.push(horse);
            if(horse.m_stBattleView != null)
            {
               this._battleView = horse.m_stBattleView;
            }
         }
         if(this._container == null)
         {
            this._container = new Sprite();
            this._sceneBuffMovie = new BarrierHorseEffectSceneBuffMovie();
            this._battleView.AddToBattleView(this._container,BattleLayerDefine.EFFECTS_BASE2_TYPE);
            this._container.addChild(this._sceneBuffMovie);
            this._sceneBuffMovie.x = 250;
            this._sceneBuffMovie.y = 232;
            this._sceneBuffMovie.scaleX = 1.2;
            this._sceneBuffMovie.scaleY = 1.2;
            this._shotMovie = new BarrierHorseNormalShot();
            this._battleView.AddToBattleView(this._shotMovie,BattleLayerDefine.EFFECTS_BASE2_TYPE);
         }
         if(this._maskShape == null)
         {
            this._maskShape = new Shape();
            this._battleView.AddToBattleView(this._maskShape,BattleLayerDefine.EFFECTS_BASE2_TYPE);
            this._sceneBuffMovie.mask = this._maskShape;
         }
      }
      
      public function RemoveOne(horse:BarrierHorseComponent) : void
      {
         var idx:int = this._horses.indexOf(horse);
         if(idx != -1)
         {
            this._horses.splice(idx,1);
         }
         if(this._horses.length == 0)
         {
            this._attackType = 0;
            this._damageArray.length = 0;
            if(this._container != null)
            {
               this._container.visible = false;
            }
            if(this._sceneBuffMovie != null)
            {
               this._sceneBuffMovie.StopAnimation();
            }
            if(this._shotMovie != null)
            {
               this._shotMovie.StopAnimation();
            }
         }
      }
      
      private function CheckAttackType() : int
      {
         var horse:BarrierHorseComponent = null;
         var allInHen:Boolean = false;
         var iStarY:int = 0;
         var allInLie:Boolean = false;
         var iStarX:int = 0;
         var i:* = 0;
         this._minTrans = 99999;
         this._attackDamage = 99999;
         this._minPos = [0,999];
         this._maxPos = [0,-999];
         for(i = int(this._horses.length - 1); i >= 0; i--)
         {
            horse = this._horses[i];
            if(horse._baseDefense == null || horse._baseDefense.stFieldGrid == null || horse._baseDefense.a_1339 <= 0)
            {
               this._horses.splice(i,1);
            }
            else
            {
               if(horse._trans < this._minTrans)
               {
                  this._minTrans = horse._trans;
               }
               if(horse._shotHurtPower < this._attackDamage)
               {
                  this._attackDamage = horse._shotHurtPower;
               }
               if(horse.m_iYGridNo < this._minPos[1])
               {
                  this._minPos = [horse.m_iXGridNo,horse.m_iYGridNo];
               }
               if(horse.m_iYGridNo > this._maxPos[1])
               {
                  this._maxPos = [horse.m_iXGridNo,horse.m_iYGridNo];
               }
            }
         }
         var attackType:int = 0;
         if(this._horses.length == 0)
         {
            attackType = 0;
         }
         else if(this._horses.length == 1)
         {
            attackType = 1;
         }
         else
         {
            allInHen = true;
            horse = this._horses[0];
            iStarY = horse.m_iYGridNo;
            allInLie = true;
            iStarX = horse.m_iXGridNo;
            for(i = 1; i < this._horses.length; i++)
            {
               horse = this._horses[i];
               if(horse.m_iYGridNo != iStarY)
               {
                  allInHen = false;
               }
               if(horse.m_iXGridNo != iStarX)
               {
                  allInLie = false;
               }
            }
            if(allInHen)
            {
               attackType = 1;
            }
            else if(allInLie)
            {
               attackType = 2;
            }
            else if(this._horses.length == 2)
            {
               attackType = 2;
            }
            else
            {
               attackType = 3;
            }
         }
         return attackType;
      }
      
      public function a_3897(iTimeNum:int) : void
      {
         var bIsChange:Boolean = false;
         var i:int = 0;
         if(this._iTimeNum == iTimeNum)
         {
            return;
         }
         this._iTimeNum = iTimeNum;
         bIsChange = false;
         var attackType:int = this.CheckAttackType();
         if(attackType != this._attackType)
         {
            this._attackType = attackType;
            this._lastAttackNum = iTimeNum;
            this._damageArray.length = 0;
            bIsChange = true;
         }
         if(this._attackType == 2)
         {
            this._sceneBuffMovie.StopAnimation();
            this._container.visible = false;
            if(iTimeNum % 5 == 0 || bIsChange == true)
            {
               this.UpdateShot(this._minPos[0],this._minPos[1],this._maxPos[0],this._maxPos[1]);
            }
            if(iTimeNum - this._lastAttackNum == BarrierHorseDefine.SHOT_INTERVAL)
            {
               this.DamageLineMouse();
               this._lastAttackNum = this._iTimeNum;
            }
         }
         else if(this._attackType == 3)
         {
            this._shotMovie.StopAnimation();
            if(iTimeNum % 5 == 0 || bIsChange == true)
            {
               this.UpdateShape();
            }
            this._container.visible = true;
            this._sceneBuffMovie.PlayAnimation();
            if(iTimeNum - this._lastAttackNum == BarrierHorseDefine.SHOT_INTERVAL)
            {
               for(i = 0; i < this._damageArray.length; i++)
               {
                  BarrierHorseDefine.DamageGrid(this._battleView.a_3438(this._damageArray[i][0],this._damageArray[i][1]),this._minTrans,this._attackDamage);
               }
               this._lastAttackNum = this._iTimeNum;
            }
         }
         else
         {
            for(i = 0; i < this.lines.length; i++)
            {
               this.lines[i].StopAnimation();
            }
            this._shotMovie.StopAnimation();
            this._sceneBuffMovie.StopAnimation();
            this._container.visible = false;
            this._damageArray.length = 0;
         }
      }
      
      private function DamageLineMouse() : void
      {
         var stMoveIntruder:a_4206 = null;
         var rect:Rectangle = null;
         for(var j:int = 0; j < this._battleView.m_arrBaseMoveIntruderVector.length; j++)
         {
            stMoveIntruder = this._battleView.m_arrBaseMoveIntruderVector[j];
            if(stMoveIntruder != null && stMoveIntruder.iLifeValue > 0 && stMoveIntruder.iSpaceState != 1)
            {
               if(this._maxPos[1] >= stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo && this._minPos[1] <= stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo)
               {
                  rect = CollisionHit.complexIntersectionRectangle(this._shotMovie.m_HitSprite,stMoveIntruder);
                  if(rect.width != 0 && rect.height != 0)
                  {
                     BarrierHorseDefine.DamageMouse(stMoveIntruder,this._minTrans,this._attackDamage);
                  }
               }
            }
         }
      }
      
      private function UpdateShot(iNoX1:int, iNoY1:int, iNoX2:int, iNoY2:int) : void
      {
         var startPosition:Point = null;
         var iAllDistance:Number = NaN;
         startPosition = new Point(iNoX1 * a_3491.a_1080 + 30,iNoY1 * a_3491.a_1081 + 32);
         var MouseY:Number = iNoY2 * a_3491.a_1081 + 32;
         var MouseX:Number = iNoX2 * a_3491.a_1080 + 30;
         iAllDistance = Point.distance(startPosition,new Point(MouseX,MouseY));
         var dy:Number = MouseY - startPosition.y;
         var dx:Number = MouseX - startPosition.x;
         var Ratation:Number = Math.atan2(dy,dx);
         Ratation = Ratation * 180 / Math.PI;
         this._shotMovie.rotation = Ratation;
         this._shotMovie.x = startPosition.x;
         this._shotMovie.y = startPosition.y;
         this._shotMovie.m_stUp.bgMask.width = iAllDistance;
         this._shotMovie.m_stDown.bgMask.width = iAllDistance;
         this._shotMovie.m_HitSprite.width = iAllDistance - 20;
         this._shotMovie.PlayAnimation();
      }
      
      private function UpdateShape() : void
      {
         var horse:BarrierHorseComponent = null;
         var arr:Array = [];
         for(var i:int = 0; i < this._horses.length; i++)
         {
            horse = this._horses[i];
            arr.push([horse.m_iXGridNo,horse.m_iYGridNo]);
         }
         var obj:Object = BattleRangeUtil.MaxConvexRegion(arr);
         var range:Array = BattleRangeUtil.FixAllRange(obj.hullPoints);
         this.DrawShape(range);
         this._damageArray = BattleRangeUtil.GetCoveredCells(range,arr);
      }
      
      private function FixAllRange(arr1:Array) : Array
      {
         var arr2:Array = [];
         for(var i:int = 0; i < arr1.length; i++)
         {
            if(i == 0)
            {
               arr2.push(this.FixOneRange(arr1[arr1.length - 1],arr1[i],arr1[i + 1]));
            }
            else if(i == arr1.length - 1)
            {
               arr2.push(this.FixOneRange(arr1[i - 1],arr1[i],arr1[0]));
            }
            else
            {
               arr2.push(this.FixOneRange(arr1[i - 1],arr1[i],arr1[i + 1]));
            }
         }
         return arr2;
      }
      
      private function FixOneRange(left:Array, now:Array, right:Array) : Array
      {
         var next:Array = [0,0];
         if(left[0] < now[0] && right[0] > now[0] || right[0] < now[0] && left[0] > now[0])
         {
            next[0] = now[0];
         }
         else if(left[0] >= now[0] && right[0] >= now[0])
         {
            next[0] = now[0] - 0.5;
         }
         else
         {
            next[0] = now[0] + 0.5;
         }
         if(left[1] < now[1] && right[1] > now[1] || right[1] < now[1] && left[1] > now[1])
         {
            next[1] = now[1];
         }
         else if(left[1] >= now[1] && right[1] >= now[1])
         {
            next[1] = now[1] - 0.5;
         }
         else
         {
            next[1] = now[1] + 0.5;
         }
         return next;
      }
      
      private function DrawShape(points:Array) : void
      {
         var line:BarrierHorseLineMovieClip = null;
         this._maskShape.graphics.clear();
         this._maskShape.graphics.beginFill(0);
         this._maskShape.graphics.moveTo(points[0][0] * a_3491.a_1080 + this.m_iXOffset,points[0][1] * a_3491.a_1081 + this.m_iYOffset);
         var i:int = 0;
         for(i = 1; i < points.length; i++)
         {
            this._maskShape.graphics.lineTo(points[i][0] * a_3491.a_1080 + this.m_iXOffset,points[i][1] * a_3491.a_1081 + this.m_iYOffset);
         }
         this._maskShape.graphics.lineTo(points[0][0] * a_3491.a_1080 + this.m_iXOffset,points[0][1] * a_3491.a_1081 + this.m_iYOffset);
         this._maskShape.graphics.endFill();
         while(this.lines.length < points.length)
         {
            line = new BarrierHorseLineMovieClip();
            this._container.addChild(line);
            this.lines.push(line);
         }
         for(i = 0; i < points.length; i++)
         {
            if(i == points.length - 1)
            {
               this.drawLine(this.lines[i],points[i],points[0]);
            }
            else
            {
               this.drawLine(this.lines[i],points[i],points[i + 1]);
            }
         }
         for(i = int(points.length); i < this.lines.length; i++)
         {
            this.lines[i].StopAnimation();
         }
      }
      
      private function drawLine(line:BarrierHorseLineMovieClip, point1:Array, point2:Array) : void
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
      
      private function GetBuffMovieClip(trans:int) : Class
      {
         return BarrierHorseEffectOneBuffMovie;
      }
      
      public function CreateGridBuff(defense:a_3962, trans:int, offsetX:int, offsetY:int) : void
      {
         var stFieldGrid:a_3491 = defense.stFieldGrid;
         if(stFieldGrid == null)
         {
            return;
         }
         var buffID1:int = 30004 + (trans - 1) * 2;
         var buffID2:int = buffID1 + 1;
         if(defense.tagCom.HasTag(buffID1) || defense.tagCom.HasTag(buffID2))
         {
            return;
         }
         var params:BattleBuffParams = new BattleBuffParams();
         params.gameMoveClipClass = this.GetBuffMovieClip(trans);
         params.x = offsetX;
         params.y = offsetY;
         var buffData:BattleBuffData = defense.buffCom.AddBuff(buffID1,999999,params);
         if(buffData != null && buffData.stEffect != null)
         {
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECTS_BASE2_TYPE,stFieldGrid);
         }
         var params1:BattleBuffParams = new BattleBuffParams();
         params1.gameMoveClipClass = this.GetBuffMovieClip(trans);
         params1.x = offsetX + 60;
         params1.y = offsetY;
         var buffData1:BattleBuffData = defense.buffCom.AddBuff(buffID2,999999,params1);
         if(buffData1 != null && buffData1.stEffect != null)
         {
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buffData1.stEffect,BattleLayerDefine.EFFECTS_BASE2_TYPE,stFieldGrid);
         }
      }
      
      public function RemoveGridBuff(defense:a_3962, trans:int) : void
      {
         var buffID:int = 30004 + (trans - 1) * 2;
         defense.buffCom.RemoveBuff(buffID);
         defense.buffCom.RemoveBuff(buffID + 1);
      }
   }
}

