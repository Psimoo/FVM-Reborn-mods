package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand.Movie.DragonSuppressingCircleEffectMovie;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.IsLand.Movie.IsLandLineEffectMovie;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class IsLandLineManager
   {
      
      private static var _instance:IsLandLineManager;
      
      private var m_dictZhu:Dictionary = new Dictionary();
      
      private const MAX_SIZE:int = 2;
      
      private var hasZhu:Boolean = false;
      
      public var nowCircle:BaseGameEffect = null;
      
      public var preCircle:BaseGameEffect = null;
      
      public var preLine:IsLandLineEffect = null;
      
      private var arrLineCards:Array = [286402672,286402686,286402687];
      
      public function IsLandLineManager()
      {
         super();
      }
      
      public static function getInstance() : IsLandLineManager
      {
         if(_instance == null)
         {
            _instance = new IsLandLineManager();
         }
         return _instance;
      }
      
      public function UpdateVirtual(cardID:uint, iNoX:int, iNoY:int, battleView:BattleFieldView) : void
      {
         var grid:a_3491 = null;
         var iNoX1:int = 0;
         var iNoY1:int = 0;
         if(this.hasZhu == false)
         {
            return;
         }
         if(this.arrLineCards.indexOf(cardID) == -1)
         {
            return;
         }
         var zhu:DragonSuppressingPillarEffect = this.GetNearestZhu(iNoX,iNoY);
         if(zhu == null)
         {
            this.HideVirtual();
         }
         else
         {
            grid = battleView.a_3438(iNoX,iNoY);
            if(this.nowCircle == null)
            {
               this.nowCircle = BattleEffectUtil.CreateGameEffect2(DragonSuppressingCircleEffectMovie,grid);
               this.nowCircle.SetAnimation(1);
               this.nowCircle.alpha = 0.6;
            }
            if(this.preCircle == null)
            {
               this.preCircle = BattleEffectUtil.CreateGameEffect2(DragonSuppressingCircleEffectMovie,battleView.a_3438(iNoX,iNoY));
               this.preCircle.SetAnimation(1);
               this.preCircle.alpha = 0.6;
            }
            if(this.preLine == null)
            {
               this.preLine = BattleEffectUtil.CreateOriginEffect(IsLandLineEffect,IsLandLineEffectMovie,grid) as IsLandLineEffect;
               this.preLine.SetAnimation(4);
               this.preLine.alpha = 0.6;
            }
            iNoX1 = zhu.stFieldGrid.m_iXGridNo;
            iNoY1 = zhu.stFieldGrid.m_iYGridNo;
            this.nowCircle.x = a_3491.a_1080 * (iNoX1 + 0.5);
            this.nowCircle.y = a_3491.a_1081 * (iNoY1 + 0.5);
            this.preCircle.x = a_3491.a_1080 * (grid.m_iXGridNo + 0.5);
            this.preCircle.y = a_3491.a_1081 * (grid.m_iYGridNo + 0.5);
            this.preLine.UpdateLine(iNoX1,iNoY1,iNoX,iNoY);
         }
      }
      
      public function HideVirtual() : void
      {
         if(this.nowCircle != null)
         {
            PoolManager.getInstance().CheckInOne(this.nowCircle);
            this.nowCircle = null;
         }
         if(this.preCircle != null)
         {
            PoolManager.getInstance().CheckInOne(this.preCircle);
            this.preCircle = null;
         }
         if(this.preLine != null)
         {
            PoolManager.getInstance().CheckInOne(this.preLine);
            this.preLine = null;
         }
      }
      
      public function GetNearestZhu(iNoX:int, iNoY:int) : DragonSuppressingPillarEffect
      {
         var j:int = 0;
         var zhu2:DragonSuppressingPillarEffect = null;
         var dis2:Number = NaN;
         var dis1:Number = 999999999;
         var zhu:DragonSuppressingPillarEffect = null;
         for(var i:int = -this.MAX_SIZE; i <= this.MAX_SIZE; i++)
         {
            for(j = -this.MAX_SIZE; j <= this.MAX_SIZE; j++)
            {
               zhu2 = IsLandLineManager.getInstance().GetZhuData(iNoX + i,iNoY + j);
               if(zhu2 != null && zhu2.state == 0)
               {
                  dis2 = Math.sqrt(i * i + j * j) * 10000 + j * 100 + i;
                  if(dis2 < dis1)
                  {
                     dis1 = dis2;
                     zhu = zhu2;
                  }
               }
            }
         }
         return zhu;
      }
      
      public function AddZhu(zhu:DragonSuppressingPillarEffect) : void
      {
         this.hasZhu = true;
         var iNoX:int = zhu.stFieldGrid.m_iXGridNo;
         var iNoY:int = zhu.stFieldGrid.m_iYGridNo;
         var iGridID:int = iNoY * 100 + iNoX;
         this.m_dictZhu[iGridID] = zhu;
      }
      
      public function GetZhuData(iNoX:int, iNoY:int) : DragonSuppressingPillarEffect
      {
         return this.m_dictZhu[iNoY * 100 + iNoX];
      }
      
      public function CheckInterestLine(zhu:DragonSuppressingPillarEffect, attacker:a_3953) : void
      {
         var secondaryEnd:Point = null;
         var secondaryStart:Point = null;
         var checkZhu:DragonSuppressingPillarEffect = null;
         var mainStart:Point = new Point(zhu.stFieldGrid.m_iXGridNo,zhu.stFieldGrid.m_iYGridNo);
         var mainEnd:Point = new Point(attacker.stFieldGrid.m_iXGridNo,attacker.stFieldGrid.m_iYGridNo);
         for each(checkZhu in this.m_dictZhu)
         {
            if(zhu != checkZhu)
            {
               secondaryStart = new Point(checkZhu.stFieldGrid.m_iXGridNo,checkZhu.stFieldGrid.m_iYGridNo);
               if(checkZhu.preCard != null)
               {
                  if(checkZhu.preCard.stFieldGrid != null)
                  {
                     secondaryEnd = new Point(checkZhu.preCard.stFieldGrid.m_iXGridNo,checkZhu.preCard.stFieldGrid.m_iYGridNo);
                     if(this.IsLineSegmentIntersect(mainStart,mainEnd,secondaryStart,secondaryEnd))
                     {
                        checkZhu.Line2RemoveCard(checkZhu.preCard);
                     }
                  }
                  else
                  {
                     checkZhu.Line2RemoveCard(checkZhu.preCard);
                  }
               }
               if(checkZhu.nextCard != null)
               {
                  if(checkZhu.nextCard.stFieldGrid != null)
                  {
                     secondaryEnd = new Point(checkZhu.nextCard.stFieldGrid.m_iXGridNo,checkZhu.nextCard.stFieldGrid.m_iYGridNo);
                     if(this.IsLineSegmentIntersect(mainStart,mainEnd,secondaryStart,secondaryEnd))
                     {
                        checkZhu.Line2RemoveCard(checkZhu.nextCard);
                     }
                  }
                  else
                  {
                     checkZhu.Line2RemoveCard(checkZhu.nextCard);
                  }
               }
            }
         }
      }
      
      private function IsLineSegmentIntersect(p1:Point, p2:Point, p3:Point, p4:Point) : Boolean
      {
         var ccw1:Boolean = this.Ccw(p1,p3,p4);
         var ccw2:Boolean = this.Ccw(p2,p3,p4);
         var ccw3:Boolean = this.Ccw(p3,p1,p2);
         var ccw4:Boolean = this.Ccw(p4,p1,p2);
         if(ccw1 != ccw2 && ccw3 != ccw4)
         {
            return true;
         }
         return false;
      }
      
      private function Ccw(p1:Point, p2:Point, p3:Point) : Boolean
      {
         return (p3.y - p1.y) * (p2.x - p1.x) > (p2.y - p1.y) * (p3.x - p1.x);
      }
      
      public function a_4158() : void
      {
         this.hasZhu = false;
         this.m_dictZhu = new Dictionary();
         this.HideVirtual();
      }
   }
}

