package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import a_4781.TimeoutManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.GameCardView;
   import com.aurora.ui.maogoutd.game.Util.BattleCardDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child.WBDesireChildCalamityRatMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P3.WBDesireKingP3BoomFxMovie;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   
   public class WBDesireKingUtil
   {
      
      public function WBDesireKingUtil()
      {
         super();
      }
      
      public static function LockCards(lockNum:int, battleView:BattleFieldView) : void
      {
         var cardView:GameCardView = null;
         var i:int = 0;
         var lockEffect:WBDesireKingSlotUiEffect = null;
         var stRootContainer:DisplayObjectContainer = null;
         var stGlobalPoint:Point = null;
         var stRootLocalPoint:Point = null;
         var cardArr:Array = [];
         for(i = 0; i < BattleCardDefine.MAX_HAND_CARD_NUM; i++)
         {
            cardView = battleView.GetGameCardViewByIndex(i);
            if(cardView == null)
            {
               break;
            }
            cardArr.push(cardView);
         }
         cardArr.sort(OnSortToken);
         for(i = 0; i < Math.min(cardArr.length,lockNum); i++)
         {
            cardView = cardArr[i];
            lockEffect = EffectManager.getInstance().CheckOutOne(WBDesireKingSlotUiEffect,WBDesireKingSlotUiMovie) as WBDesireKingSlotUiEffect;
            lockEffect.x = cardView.x - 200 + (cardView.parent.x - 114);
            lockEffect.y = cardView.y - 110;
            battleView.AddToBattleView(lockEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,battleView.a_3438(0,0));
            lockEffect.InitData(cardView);
            stRootContainer = battleView.root as DisplayObjectContainer;
            stGlobalPoint = lockEffect.parent.localToGlobal(new Point(lockEffect.x,lockEffect.y));
            stRootLocalPoint = stRootContainer.globalToLocal(stGlobalPoint);
            lockEffect.x = stRootLocalPoint.x;
            lockEffect.y = stRootLocalPoint.y;
            if(lockEffect.parent.contains(lockEffect))
            {
               lockEffect.parent.removeChild(lockEffect);
            }
            battleView.AddToBattleView(lockEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
            stRootContainer.addChild(lockEffect);
         }
      }
      
      private static function OnSortToken(a:GameCardView, b:GameCardView) : int
      {
         if(a.iStarDegree < b.iStarDegree)
         {
            return 1;
         }
         if(a.iStarDegree > b.iStarDegree)
         {
            return -1;
         }
         return 0;
      }
      
      public static function CreateCalamityRat(grid:a_3491) : void
      {
         var mouse:WBDesireChildCalamityRatMoveIntruder = null;
         mouse = WBDesireChildCalamityRatMoveIntruder.a_3926();
         mouse.a_1797((1 << 16) + 1000 + grid.m_iYGridNo * 100 + grid.m_iXGridNo,-1);
         mouse.m_stMoveIntruderTypeID = 134235589;
         grid.m_stCurrentBattbleFieldView.a_3459(mouse,grid,false,BattleLayerDefine.INTRUDER_LAND_TYPE);
         mouse.x = (grid.m_iXGridNo + 0.5) * a_3491.a_1080;
         mouse.y = (grid.m_iYGridNo + 0.5) * a_3491.a_1081;
         mouse.InitData();
      }
      
      public static function HasRainbowDamageDefence(grid:a_3491) : Boolean
      {
         if(grid == null)
         {
            return false;
         }
         if(null != grid.m_stAttackFighter && grid.m_stAttackFighter is a_3924)
         {
            return false;
         }
         if(null != grid.m_stBaseToolDefense || null != grid.m_stProtector || null != grid.m_stAttackFighter || null != grid.m_stBoomDefense || null != grid.m_stFlowerDefense || null != grid.m_stBaseAuxiliaryFighter)
         {
            return true;
         }
         return false;
      }
      
      public static function CreateRainbow(grid:a_3491) : void
      {
         if(grid == null)
         {
            return;
         }
         if(!HasRainbowDamageDefence(grid))
         {
            return;
         }
         var effect:WBDesireKingRainbowNoteEffect = BattleEffectUtil.CreateGameEffect(WBDesireKingRainbowNoteEffect,WBDesireKingRainbowNoteMovie,grid) as WBDesireKingRainbowNoteEffect;
         effect.InitData(grid);
      }
      
      public static function DelayDamageBOSS(boss:BaseBossMoveIntruder, damage:int, delay:int) : void
      {
         var endCallBack:Function = null;
         endCallBack = function(damage:int, boss:BaseBossMoveIntruder):void
         {
            boss.ReduceLife2(damage,[50001]);
         };
         TimeoutManager.getInstance().AddDelay(delay,endCallBack,damage,boss);
      }
      
      public static function HasLight(grid:a_3491) : Boolean
      {
         if(grid == null)
         {
            return false;
         }
         if(grid.m_stFlowerDefense != null || grid.m_stBaseAuxiliaryFighter != null)
         {
            return true;
         }
         if(grid.m_stAttackFighter != null && grid.m_stAttackFighter.tagCom.HasTag(30034))
         {
            return true;
         }
         return false;
      }
      
      public static function ClearOneGridAllLight(grid:a_3491) : void
      {
         if(grid == null)
         {
            return;
         }
         var bClear:Boolean = false;
         if(grid.m_stFlowerDefense != null && !grid.m_stFlowerDefense.tagCom.HasTag(30035))
         {
            BattleDestroyUtil.DestroyCardIgnoreFangYu(grid.m_stFlowerDefense);
            bClear = true;
         }
         if(grid.m_stBaseAuxiliaryFighter != null && !grid.m_stBaseAuxiliaryFighter.tagCom.HasTag(30035))
         {
            BattleDestroyUtil.DestroyCardIgnoreFangYu(grid.m_stBaseAuxiliaryFighter);
            bClear = true;
         }
         if(bClear)
         {
            BattleEffectUtil.CreateGameEffect2(WBDesireKingP3BoomFxMovie,grid).SetAnimation(0,true);
         }
      }
   }
}

